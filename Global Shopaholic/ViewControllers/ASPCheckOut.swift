//
//  ASPCheckOut.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/30/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ASPCheckOut: UIViewController, PayPalPaymentDelegate, PayPalFuturePaymentDelegate, PayPalProfileSharingDelegate {
    func payPalFuturePaymentDidCancel(_ futurePaymentViewController: PayPalFuturePaymentViewController) {
        
    }
    
    func payPalFuturePaymentViewController(_ futurePaymentViewController: PayPalFuturePaymentViewController, didAuthorizeFuturePayment futurePaymentAuthorization: [AnyHashable : Any]) {
        
    }
    
    func userDidCancel(_ profileSharingViewController: PayPalProfileSharingViewController) {
        
    }
    
    func payPalProfileSharingViewController(_ profileSharingViewController: PayPalProfileSharingViewController, userDidLogInWithAuthorization profileSharingAuthorization: [AnyHashable : Any]) {
        
    }
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        paymentViewController.dismiss(animated: true) { () -> Void in

            print("and Dismissed")

        }
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print(completedPayment.confirmation)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController) {

        paymentViewController.dismiss(animated: true) { () -> Void in

            print("and Dismissed")

        }

        print("Payment cancel")

    }

    
    
    
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
          if (newEnvironment != environment) {
            PayPalMobile.preconnect(withEnvironment: newEnvironment)
          }
        }
      }

    //# Credit Card View OUTLETS
    @IBOutlet var CreditCardView: UIView!
    
    @IBOutlet weak var CreditCardAmountField: UITextField!
    @IBOutlet weak var CreditCardNumberField: UITextField!
    @IBOutlet weak var CreditCardHolderName: UITextField!
    @IBOutlet weak var CreditCardExpMonthField: UITextField!
    @IBOutlet weak var CreditCardExpYearField: UITextField!
    @IBOutlet weak var CreditCardCVCField: UITextField!
    
    
    
    
    
      var resultText = "" // empty
      var payPalConfig = PayPalConfiguration()
    var user_data:UserDataClass!
    
    let userDefaults = UserDefaults()
    @IBOutlet weak var isWalletBtn: UIButton!
    var selectedPaymentMethod = "bank_transfer"
    var summaryData: NSDictionary!
    var aspRequestId: String?
    //var selectedPaymentMethod: String!
    var isWallet = "no"
    //var itemdata:
    @IBOutlet weak var transactionIDField: UITextField!
    @IBOutlet weak var depositeAmountField: UITextField!
    @IBOutlet weak var bankNameField: UITextField!
    @IBOutlet var bankTransferView: UIView!
    @IBOutlet weak var itemCostLbl: UILabel!
    @IBOutlet weak var shippingChargesLbl: UILabel!
    @IBOutlet weak var processingChargesLbl: UILabel!
    @IBOutlet weak var bankChargesLbl: UILabel!
    @IBOutlet weak var promoCodeLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    @IBOutlet weak var BankCertifyBtn: UIButton!
    @IBOutlet weak var SummaryView: UIView!
    @IBOutlet weak var paypalBtn: UIButton!
    @IBOutlet weak var cardBtn: UIButton!
    @IBOutlet weak var BankTransferBtn: UIButton!
    @IBOutlet weak var bitCoinBtn: UIButton!
    var term = false
    var bankModelData: bankPaymentModel?
    
    
    var BottomConstraintWhenToShowBankTransferView: NSLayoutConstraint?
    var BottomConstraintWhenToHideBankTransferView: NSLayoutConstraint?
    
    var BottomConstraintWhenToShowDepositeCardView: NSLayoutConstraint?
    var BottomConstraintWhenToHideDepositeCardView: NSLayoutConstraint?
    
    
    var vm = CheckoutVM()
    
    
    
    @IBOutlet weak var payBtn: UIButton!
    enum PaymentMethod {
        case paypal
        case card
        case bank
        case bitcoin
       
    }
    var SelectedMethod: PaymentMethod!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PayPal SDK Demo"
           //successView.isHidden = true
           
           // Set up payPalConfig
           payPalConfig.acceptCreditCards = false
           payPalConfig.merchantName = "Awesome Shirts, Inc."
           payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
           payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
            
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        
        // Setting the payPalShippingAddressOption property is optional.
        //
        // See PayPalConfiguration.h for details.
        
        payPalConfig.payPalShippingAddressOption = .payPal;
        
        print("PayPal iOS SDK Version: \(PayPalMobile.libraryVersion())")
        
        
        

        vm.delegate = self
        setupUI()
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            vm.delegate = self
            let request = OrderSummaryRequest(aspRequestID: aspRequestId!, paymentMethod: selectedPaymentMethod, isWallet: isWallet)
            vm.getCheckOutSummary(token: user_data.token, Request: request)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        PayPalMobile.preconnect(withEnvironment: environment)

    }
    @IBAction func BackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func paypalAction(_ sender: UIButton) {
//        SelectedMethod = PaymentMethod.paypal
//        paypalBtn.backgroundColor = hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
//        cardBtn.backgroundColor = .clear
//        BankTransferBtn.backgroundColor = .clear
//        bitCoinBtn.backgroundColor = .clear
//        selectedPaymentMethod = "paypal"
//       // print(summaryData)
//
//        let request = OrderSummaryRequest(aspRequestID: self.aspRequestId!, paymentMethod: selectedPaymentMethod, isWallet: isWallet)
//        vm.getCheckOutSummary(token: user_data.token, Request: request)
        
        resultText = ""
            
            // Note: For purposes of illustration, this example shows a payment that includes
            //       both payment details (subtotal, shipping, tax) and multiple items.
            //       You would only specify these if appropriate to your situation.
            //       Otherwise, you can leave payment.items and/or payment.paymentDetails nil,
            //       and simply set payment.amount to your total charge.
            
            // Optional: include multiple items
            let item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "84.99"), withCurrency: "USD", withSku: "Hip-0037")
            let item2 = PayPalItem(name: "Free rainbow patch", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00066")
            let item3 = PayPalItem(name: "Long-sleeve plaid shirt (mustache not included)", withQuantity: 1, withPrice: NSDecimalNumber(string: "37.99"), withCurrency: "USD", withSku: "Hip-00291")
            
            let items = [item1, item2, item3]
            let subtotal = PayPalItem.totalPrice(forItems: items)
            
            // Optional: include payment details
            let shipping = NSDecimalNumber(string: "5.99")
            let tax = NSDecimalNumber(string: "2.50")
            let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
            
            let total = subtotal.adding(shipping).adding(tax)
            
            let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Hipster Clothing", intent: .sale)
            
            payment.items = items
            payment.paymentDetails = paymentDetails
            
            if (payment.processable) {
              let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
              present(paymentViewController!, animated: true, completion: nil)
            }
            else {
              // This particular payment will always be processable. If, for
              // example, the amount was negative or the shortDescription was
              // empty, this payment wouldn't be processable, and you'd want
              // to handle that here.
              print("Payment not processalbe: \(payment)")
            }
        
        
        
        ////
        
        
        
        
    }
    
    @IBAction func creditCardAction(_ sender: UIButton) {
        SelectedMethod = PaymentMethod.card
        paypalBtn.backgroundColor = .clear
        
        cardBtn.backgroundColor = hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        BankTransferBtn.backgroundColor = .clear
        bitCoinBtn.backgroundColor = .clear
        selectedPaymentMethod = "credit_card"
                let request = OrderSummaryRequest(aspRequestID: self.aspRequestId!, paymentMethod: selectedPaymentMethod, isWallet: isWallet)
                vm.getCheckOutSummary(token: user_data.token, Request: request)

    }
    
    @IBAction func bankTransferAction(_ sender: UIButton) {
     
       
        SelectedMethod = PaymentMethod.bank
        paypalBtn.backgroundColor = .clear
        cardBtn.backgroundColor = .clear
        BankTransferBtn.backgroundColor = hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        bitCoinBtn.backgroundColor = .clear
        selectedPaymentMethod = "bank_transfer"
        let request = OrderSummaryRequest(aspRequestID: self.aspRequestId!, paymentMethod: selectedPaymentMethod, isWallet: isWallet)
        vm.getCheckOutSummary(token: user_data.token, Request: request)
    }
    
    @IBAction func BitcoinAction(_ sender: UIButton) {
        SelectedMethod = PaymentMethod.bitcoin
        paypalBtn.backgroundColor = .clear
        cardBtn.backgroundColor = .clear
        BankTransferBtn.backgroundColor = .clear
        bitCoinBtn.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
    }
    @IBAction func BankDropBtn(_ sender: Any) {
        BottomConstraintWhenToShowBankTransferView?.isActive = false
        BottomConstraintWhenToHideBankTransferView?.isActive = true
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func CreditCardDropAction(_ sender: UIButton) {
        BottomConstraintWhenToShowDepositeCardView?.isActive = false
        BottomConstraintWhenToHideDepositeCardView?.isActive = true
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func chooseImage(_ sender: UIButton) {
        
        ImagePickerManager().pickImage(self){ image in
                //here is the image
            //self.bankDepoRequest.receiptImage = image
            self.bankModelData = bankPaymentModel(bankRecieptImage: image)
        }
    }
    @IBAction func bankTransferConfirmationAction(_ sender: UIButton) {
        if term == false{
            term = true
            BankCertifyBtn.setImage(UIImage(named:"checked"), for: .normal)
            //"checked"
        }
        else{
            term = false
            BankCertifyBtn.setImage(nil, for: .normal)
        }
        
    }
    @IBAction func isWalletAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
         if sender.isSelected
         {
            sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            isWallet = "yes"
         }
         else{
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            isWallet = "no"
         }
        let request = OrderSummaryRequest(aspRequestID: self.aspRequestId!, paymentMethod: selectedPaymentMethod, isWallet: isWallet)
        vm.getCheckOutSummary(token: user_data.token, Request: request)
    }
    @IBAction func PayNowAction(_ sender: UIButton) {
        
        switch SelectedMethod {
        case .paypal:
            break
        case .bank:
            BottomConstraintWhenToShowBankTransferView?.isActive = true
            BottomConstraintWhenToHideBankTransferView?.isActive = false
        case .bitcoin:
            break
        case .card:
            BottomConstraintWhenToShowDepositeCardView?.isActive = true
            BottomConstraintWhenToHideDepositeCardView?.isActive = false
        default:
            break
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
        
        
        
      
        

    }
    
    
    @IBAction func CCPayAction(_ sender: UIButton) {
        let validate = validateCC()
        if validate{
            let cardexp = "\(CreditCardExpMonthField.text!)/\(CreditCardExpYearField.text!)"
            let request = CreditCardPaymentModel(aspID: aspRequestId, paymenMethod: selectedPaymentMethod, isWallet: isWallet, name: CreditCardHolderName.text!, cardNumber: CreditCardNumberField.text!, expiry: cardexp, cvc: CreditCardCVCField.text!)
            print(request)
            vm.paynowViaCC(token: user_data.token, request: request)
        }
        else{
            return
        }
        
    }
    
    @IBAction func CheckoutViaBank(_ sender: UIButton) {
        
                let validate = validateBankData()
                if validate{
                    self.bankModelData = bankPaymentModel(aspID: aspRequestId, paymenMethod: selectedPaymentMethod, isWallet: isWallet, bankName: bankNameField.text!, depositAmount: (summaryData["total"] as! NSNumber).stringValue, banktransactionID: transactionIDField.text!,bankRecieptImage: bankModelData?.bankRecieptImage!)
                    vm.paynowViaBank(token: user_data.token, request: bankModelData!)
                }
                else{
                    return
                }
        
    }
    
    
    
    
    
    
}
