//
//  WalletVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
import BetterSegmentedControl
import RappleProgressHUD
import Alamofire
import SwiftyJSON
class WalletVC: BaseViewController {

    @IBOutlet weak var PayDepts: UIButton!
    
    
    
    @IBOutlet weak var PromoCodesBtn: UIButton!
    @IBOutlet weak var bandDepositeCertifyCheckBtn: UIButton!
    var bankDepoRequest = BankDepositeRequest()
    
    var img: UIImage?
    
    @IBOutlet weak var BankDepositeAmountField: UITextField!
    
    @IBOutlet weak var BankDepositeIdField: UITextField!
    
    
    @IBOutlet weak var WalletBalancelbl: UILabel!
    var WalletInfoData = NSDictionary()
    var historyData = NSArray()
    
    // Deposite card
    
    @IBOutlet weak var DepositeAmountField: UITextField!
    @IBOutlet weak var DepositeCardField: UITextField!
    @IBOutlet weak var DepositeCardExpDayField: UITextField!
    @IBOutlet weak var DeposteCardExpYearField: UITextField!
    @IBOutlet weak var DesposteCVCField: UITextField!
    @IBOutlet weak var DespositeHolderNameField: UITextField!
    /////////////////////////
    
    
    
    @IBOutlet var BankTransferView: UIView!
    @IBOutlet var DepositeCardView: UIView!
    let userDefaults = UserDefaults.standard
    var user_data:UserDataClass!
    @IBOutlet weak var cardNumberField: UITextField!
    
    @IBOutlet weak var AccountHolderField: UITextField!
    
    @IBOutlet weak var expMonthField: UITextField!
    
    
    @IBOutlet weak var expYearField: UITextField!
    
    @IBOutlet weak var cvcField: UITextField!
    
    var cardList: NSArray!
    
    var BottomConstraintWhenToShowDepositeCardView: NSLayoutConstraint?
    var BottomConstraintWhenToHideDepositeCardView: NSLayoutConstraint?
    
    var BottomConstraintWhenToShowBankTransferView: NSLayoutConstraint?
    var BottomConstraintWhenToHideBankTransferView: NSLayoutConstraint?
    
    
    
    @IBOutlet weak var addCardBtn: UIButton!
    @IBOutlet weak var CollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var WalletHistoryView: UIView!
    @IBOutlet var MyCardsView: UIView!
    @IBOutlet weak var DepositMethodView: UIView!
    var showingWithdrawal = false
    @IBOutlet weak var WithdrawalFieldsView: UIView!
    @IBOutlet var DepWithView: UIView!
    @IBOutlet weak var WalletHistoyButton: UIButton!
    
    @IBOutlet weak var mycardsBtn: UIButton!
    @IBOutlet weak var dAndWBtn: UIButton!
    @IBOutlet weak var BackBtnView: UIView!
    @IBOutlet weak var SideMenuView: UIView!
    @IBOutlet weak var tableView: UITableView!
   
   
    @IBOutlet weak var BankTransactionIDField: UITextField!
    
    @IBOutlet weak var BankTransactioAmountField: UITextField!
    
    
    @IBOutlet weak var BankCloseBtn: UIButton!
    
    @IBOutlet weak var BankDepositeBtn: UIButton!
    
    
    
    var activeTextField : UITextField? = nil
    
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var BackTransferBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var listVM = cardListVM()
    @IBOutlet weak var btnShowMenu: UIButton!
    var isBankTranfer = false
    var isCreditCard = false
    var isPaypal = false
    override func viewDidLoad() {
        super.viewDidLoad()
        SetConstraints()
       UISetup()
        self.collectionView.isPagingEnabled = true

        setupPopUps()
       
        self.tableView.estimatedRowHeight = 10;
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
//        tableView.allowsSelection = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
          getWalletInfo()
           // GetInits()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(WalletVC.WalletVCkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(WalletVC.WalletVCkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func WalletVCkeyboardWillShow(notification: NSNotification) {
      print("keyboardWillShow")
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        print(activeTextField!.tag)
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - 250
        }
    }

   
    @objc func WalletVCkeyboardWillHide(notification: NSNotification) {
          self.view.frame.origin.y = 0
      }
    
    @IBAction func hideDepositeCardView(_ sender: UIButton) {
        hideDepositeView()
    }
    @IBAction func DepositeCardAction(_ sender: UIButton) {
        
        COMMON_ALERT.showAlert(msg: "Comming Soon")
//        BottomConstraintWhenToShowDepositeCardView?.isActive = true
//        BottomConstraintWhenToHideDepositeCardView?.isActive = false
//        UIView.animate(withDuration: 0.2) {
//            self.view.layoutIfNeeded()
//        }
    }
    
    @IBAction func BankTransferAction(_ sender: UIButton) {
        
        BottomConstraintWhenToShowBankTransferView?.isActive = true
        BottomConstraintWhenToHideBankTransferView?.isActive = false
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    @IBAction func HideBankTransferViewAction(_ sender: Any) {
        BottomConstraintWhenToShowBankTransferView?.isActive = false
        BottomConstraintWhenToHideBankTransferView?.isActive = true
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    func UISetup() {
        
        //self.PayDepts.isHidden = true
        bandDepositeCertifyCheckBtn.layer.borderWidth = 0.8
        bandDepositeCertifyCheckBtn.layer.cornerRadius = 2
        bandDepositeCertifyCheckBtn.layer.borderColor = hexStringToUIColor(hex: "00BCA3").cgColor
        self.collectionView.allowsSelection = true
        DepositMethodView.layer.cornerRadius = 8
        DepositMethodView.DropShadowView()
        WithdrawalFieldsView.layer.cornerRadius = 8
        WithdrawalFieldsView.DropShadowView()
        
        BackBtnView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        BackBtnView.layer.cornerRadius = BackBtnView.frame.height / 2
        SideMenuView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        SideMenuView.layer.cornerRadius = SideMenuView.frame.height / 2
        dAndWBtn.alignTextUnderImage()
        PromoCodesBtn.alignTextUnderImage()
        WalletHistoyButton.alignTextUnderImage()
        
        mycardsBtn.alignTextUnderImage()
        addCardBtn.layer.cornerRadius = 10
        addCardBtn.DropShadowView()
        
    }
    func SetConstraints()
    {
        MainView.addSubview(DepWithView)
        DepWithView.translatesAutoresizingMaskIntoConstraints = false
        DepWithView.bottomAnchor.constraint(equalTo: MainView.bottomAnchor, constant: 0).isActive = true
        DepWithView.topAnchor.constraint(equalTo: MainView.topAnchor, constant: 0).isActive = true
        DepWithView.leadingAnchor.constraint(equalTo: MainView.leadingAnchor, constant: 0).isActive = true
        DepWithView.trailingAnchor.constraint(equalTo: MainView.trailingAnchor, constant: 0).isActive = true
        
        
        MainView.addSubview(MyCardsView)
        MyCardsView.translatesAutoresizingMaskIntoConstraints = false
        MyCardsView.bottomAnchor.constraint(equalTo: MainView.bottomAnchor, constant: 0).isActive = true
        MyCardsView.topAnchor.constraint(equalTo: MainView.topAnchor, constant: 0).isActive = true
        MyCardsView.leadingAnchor.constraint(equalTo: MainView.leadingAnchor, constant: 0).isActive = true
        MyCardsView.trailingAnchor.constraint(equalTo: MainView.trailingAnchor, constant: 0).isActive = true
        
        MainView.addSubview(WalletHistoryView)
        WalletHistoryView.translatesAutoresizingMaskIntoConstraints = false
        WalletHistoryView.bottomAnchor.constraint(equalTo: MainView.bottomAnchor, constant: 0).isActive = true
        WalletHistoryView.topAnchor.constraint(equalTo: MainView.topAnchor, constant: 0).isActive = true
        WalletHistoryView.leadingAnchor.constraint(equalTo: MainView.leadingAnchor, constant: 0).isActive = true
        WalletHistoryView.trailingAnchor.constraint(equalTo: MainView.trailingAnchor, constant: 0).isActive = true
    
        WalletHistoryView.isHidden = true
        MyCardsView.isHidden = true
        WalletHistoyButton.layer.cornerRadius = 8
        WalletHistoyButton.DropShadowView()
        mycardsBtn.layer.cornerRadius = 8
        mycardsBtn.DropShadowView()
        dAndWBtn.layer.cornerRadius = 8
       
        PromoCodesBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        PromoCodesBtn.DropShadowView()
        PromoCodesBtn.DropShadowView()
        PromoCodesBtn.layer.cornerRadius = 8
        
        dAndWBtn.backgroundColor = hexStringToUIColor(hex: "0BBAA3")
        dAndWBtn.RemoveShadow()
        WalletHistoryView.isHidden = true
        WalletHistoyButton.DropShadowView()
        WalletHistoyButton.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        MyCardsView.isHidden = true
        mycardsBtn.DropShadowView()
        mycardsBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        
        
        dAndWBtn.setTitleColor(.white, for: .normal)
        mycardsBtn.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        WalletHistoyButton.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        
        
    }
    
    @IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
          
       }
    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
         print("The selected index is \(sender.index)")
        
     }
    

    @IBAction func WithdrawalAction(_ sender: UIButton) {
        
        
        WithdrawalFieldsView.isHidden = showingWithdrawal
        showingWithdrawal = !showingWithdrawal
       
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func walletHistoryAction(_ sender: Any) {
        DepWithView.isHidden = true
        hideBankTransferView()
        hideDepositeView()
        dAndWBtn.DropShadowView()
        dAndWBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        WalletHistoryView.isHidden = false
        WalletHistoyButton.backgroundColor = hexStringToUIColor(hex: "0BBAA3")
        WalletHistoyButton.RemoveShadow()
        MyCardsView.isHidden = true
        mycardsBtn.DropShadowView()
        mycardsBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        WalletHistoyButton.setTitleColor(.white, for: .normal)
        dAndWBtn.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        mycardsBtn.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        
        
    }
    @IBAction func mycardAction(_ sender: Any) {
        hideDepositeView()
        hideBankTransferView()
        DepWithView.isHidden = true
        dAndWBtn.DropShadowView()
        dAndWBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        WalletHistoryView.isHidden = true
        WalletHistoyButton.DropShadowView()
        WalletHistoyButton.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        MyCardsView.isHidden = false
        mycardsBtn.backgroundColor = hexStringToUIColor(hex: "0BBAA3")
        mycardsBtn.RemoveShadow()
        mycardsBtn.setTitleColor(.white, for: .normal)
        dAndWBtn.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        WalletHistoyButton.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        listVM.delegate = self
        listVM.getList(token: user_data.token)
    }
    @IBAction func dAndWAction(_ sender: UIButton) {
        DepWithView.isHidden = false
        hideBankTransferView()
        hideDepositeView()
        dAndWBtn.backgroundColor = hexStringToUIColor(hex: "0BBAA3")
        dAndWBtn.RemoveShadow()
        WalletHistoryView.isHidden = true
        WalletHistoyButton.DropShadowView()
        WalletHistoyButton.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        MyCardsView.isHidden = true
        mycardsBtn.DropShadowView()
        mycardsBtn.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        
        
        dAndWBtn.setTitleColor(.white, for: .normal)
        mycardsBtn.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
        WalletHistoyButton.setTitleColor(hexStringToUIColor(hex: "5A5657"), for: .normal)
    }
    
    
    @IBAction func AddCard(_ sender: UIButton) {
     //CollectionViewHeightConstraint.constant = 170
        let request = AddCreditCardRequest(cardNumber: self.cardNumberField.text!, accountHolderName: AccountHolderField.text!, expDate: expMonthField.text!, cvcNumber: cvcField.text!, expYear: expYearField.text!)
        var CardVM = addCardVM()
        CardVM.delegate = self
        CardVM.addCard(token: user_data.token!, cardRequest: request)
    }
    @IBAction func DepositeCardPayNow(_ sender: UIButton) {
        var expDate = ""
        if DepositeCardExpDayField.text == "" || DeposteCardExpYearField.text == ""
        {
            COMMON_ALERT.showAlert(msg: "Expiry Fields are missing")
        }
        else{
            expDate = "\(expMonthField.text!)/\(expYearField.text!)"
        }
        var despositeCardVM = DepositeCardVM()
        despositeCardVM.delegate = self
        let request = DepositeCreditCardRequest(cardNumber: self.DepositeCardField.text!, accountHolderName: DespositeHolderNameField.text!, expDate: expDate, cvcNumber: self.DesposteCVCField.text!, amount: DepositeAmountField.text!)
        despositeCardVM.addCard(token: user_data.token!, cardRequest: request)
    }
    
    
    private func getWalletInfo()
    {

        let EP = endpoints()
        WebService.RequestWithTokenJson(Token: user_data.token!, strURL: EP.walletInfoEP, is_loader_required: false, params: ["":""]) { [self] (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                
                
                
                self.WalletInfoData = response["data"] as! NSDictionary
               // print(WalletInfoData)
                self.historyData = WalletInfoData["transaction_history"] as! NSArray
                print(historyData)
                print(historyData.count)
                self.tableView.reloadData()
                if (WalletInfoData["current_wallet_balance"] as! NSNumber).intValue  < 0 {
                    PayDepts.isHidden = false
                }
                let balance = (WalletInfoData["current_wallet_balance"] as! NSNumber).stringValue
                WalletBalancelbl.text = "$\(balance)"
                
                
                
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }

    }
    @IBAction func ChooseImage(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
                //here is the image
            //self.bankDepoRequest.receiptImage = image
            self.img = image
        }
    }
    @IBAction func BankDepositePayNowAction(_ sender: UIButton) {
        self.bankDepoRequest = BankDepositeRequest(transactionId: BankDepositeIdField.text!, transactionAmount: BankDepositeAmountField.text!,receiptImage: img)
        print(self.bankDepoRequest)
        var DepositeVM = BankDepositeVM()
        DepositeVM.delegate = self
        DepositeVM.BankDeposite(token: user_data.token!, cardRequest: bankDepoRequest)
    }
    
    @IBAction func PaypalAction(_ sender: UIButton) {
        COMMON_ALERT.showAlert(msg: "Comming Soon")
    }
    
    @IBAction func PayDeptsAction(_ sender: UIButton) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction: UIAlertAction = UIAlertAction(title: "Paypal", style: .default) { action -> Void in

            print("First Action pressed")
        }

        let secondAction: UIAlertAction = UIAlertAction(title: "Credit Card", style: .default) { action -> Void in

            print("Second Action pressed")
        }
        let ThirdAction: UIAlertAction = UIAlertAction(title: "Bank Deposit", style: .default) { action -> Void in

            print("Second Action pressed")
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }

        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(ThirdAction)
        actionSheetController.addAction(cancelAction)


        // present an actionSheet...
        // present(actionSheetController, animated: true, completion: nil)   // doesn't work for iPad

        //actionSheetController.popoverPresentationController?.sourceView = yourSourceViewName // works for both iPhone & iPad

        present(actionSheetController, animated: true) {
            print("option menu presented")
        }

    }
    
}


extension WalletVC: BankDepositeDelegate
{
    func didBankDepositeSuccessfully(response: NSDictionary) {
        print(response)
    }
    
    func didRequestfailedToDeposite(errorResponse: BankDepositeResponse) {
        COMMON_ALERT.showAlert(msg: errorResponse.message!)
    }
    
    
}

extension WalletVC: DepositeCardDelegate{
    func didCardDepositeSuccessfully(response: NSDictionary) {
        hideDepositeView()
        DepositeCardField.text = ""
        DespositeHolderNameField.text = ""
        DepositeAmountField.text = ""
        DesposteCVCField.text = ""
        DeposteCardExpYearField.text = ""
        DepositeCardExpDayField.text = ""
        self.getWalletInfo()
        COMMON_ALERT.showAlert(msg: response["message"] as! String)
    }
    
    func didCardfailedToDeposite(errorResponse: DepositeCreditCardResponse) {
        COMMON_ALERT.showAlert(msg: errorResponse.message!)
    }
    
    
}

extension WalletVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
