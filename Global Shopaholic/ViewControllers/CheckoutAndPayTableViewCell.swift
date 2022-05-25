//
//  CheckoutAndPayTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

protocol CheckoutAndPayTableViewCellDelegate {
    func paynowTapped(paymentMethod: PaymentMethod?)
    func showAlert(message: String, title: String)
}

class CheckoutAndPayTableViewCell: UITableViewCell {

    var requestID: String?
    @IBOutlet weak var totalChargesLabel: UILabel!
    @IBOutlet weak var insuranceFee: UILabel!
    @IBOutlet weak var vapCharges: UILabel!
    @IBOutlet weak var packageLateFee: UILabel!
    @IBOutlet weak var lateFeeCharges: UILabel!
    @IBOutlet weak var processingCharges: UILabel!
    var paymentMethod: PaymentMethod? = .none
    var checkoutVM: CheckoutVM?
    var courierServiceSelected: Bool?
    @IBOutlet weak var shippingChargesLabel: UILabel!
    @IBOutlet weak var courierServiceCollectionView: UICollectionView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    @IBOutlet weak var shipToAddressLabel: UILabel!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var walletCurrentBalance: UILabel!
    @IBOutlet weak var bitpayButton: UIButton!
    @IBOutlet weak var bankButton: UIButton!
    @IBOutlet weak var creditCardButton: UIButton!
    @IBOutlet weak var paypalButton: UIButton!
    @IBOutlet weak var useWalletCircleButton: UIButton!
    @IBOutlet weak var shipmentInvoiceView: UIView!
    @IBOutlet weak var payNowButton: UIButton!
    
    var totalChargesValue: Double?
    

    var rates: [[String: Any]]? {
        didSet {
            setUpCollectionView()
        }
    }

    var isWallet: isWallet! = .no
    var chekoutAndPayDelegate: CheckoutAndPayTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        destinationView.layer.cornerRadius = 10
        destinationView.DropShadowView()
        shipmentInvoiceView.layer.cornerRadius = 10
        shipmentInvoiceView.DropShadowView()
//        shippingChargesValue = 0
        payNowButton.layer.cornerRadius = 10
        
        paymentMethod = .none
        
        isWallet = .no
        courierServiceSelected = false
        

    }
    
    
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.courierServiceCollectionView.collectionViewLayout = layout
        self.courierServiceCollectionView!.contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
        if let layout = self.courierServiceCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.minimumInteritemSpacing = 10
                    layout.minimumLineSpacing = 10
            
                    layout.itemSize = CGSize(width: self.frame.size.width-100, height: self.courierServiceCollectionView.frame.size.height-10)
                    layout.invalidateLayout()
                }
        courierServiceCollectionView.delegate = self
        courierServiceCollectionView.dataSource = self
        courierServiceCollectionView.showsHorizontalScrollIndicator = false
        courierServiceCollectionView.register(UINib(nibName: "CourierServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CourierServiceCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    @IBAction func useWalletCircleButtonTapped(_ sender: UIButton) {
        switch isWallet {
        case .no:
            sender.setImage(UIImage.init(systemName: "circle.fill"), for: .normal)
            sender.tintColor = hexStringToUIColor(hex: "#0BBAA3")
            isWallet = .yes
            if paymentMethod == .none {
                getCheckoutSummary(courierService: "", paymentMethod: "", isWallet: self.isWallet.rawValue)
            }
            else {
                getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
            }
            
            
        case .yes:
            sender.setImage(UIImage.init(systemName: "circle"), for: .normal)
            sender.tintColor = hexStringToUIColor(hex: "#0BBAA3")
            isWallet = .no
            if paymentMethod == .none {
                getCheckoutSummary(courierService: "", paymentMethod: "", isWallet: self.isWallet.rawValue)
            }
            else {
                getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
            }
        case .none:
            sender.setImage(UIImage.init(systemName: "circle"), for: .normal)
            sender.tintColor = hexStringToUIColor(hex: "#0BBAA3")
            isWallet = .no

        }
       
        
    }
    @IBAction func bitcoinButtonTapped(_ sender: UIButton) {

        
        paymentMethod = .bitcoin

//        chekoutAndPayDelegate?.paymentMethodSelected(paymentMethod: .bitcoin)

        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5
        
            bankButton.backgroundColor = .white
        
            creditCardButton.backgroundColor = .white
        
        
            paypalButton.backgroundColor = .white
        getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
        
        
    }
    @IBAction func creditcardButtonTapped(_ sender: UIButton) {
        
        

        paymentMethod = .card
//        chekoutAndPayDelegate?.paymentMethodSelected(paymentMethod: .card)

        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

        
            bankButton.backgroundColor = .white
        
        
            bitpayButton.backgroundColor = .white
        
        
            paypalButton.backgroundColor = .white
        getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
    }
    
    @IBAction func paypalButtonTapped(_ sender: UIButton) {
        paymentMethod = .paypal
        
        print(isWallet.rawValue)
        print(PaymentMethod.paypal.rawValue)
        
//        chekoutAndPayDelegate?.paymentMethodSelected(paymentMethod: .paypal)
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5
        
            bankButton.backgroundColor = .white
       
            creditCardButton.backgroundColor = .white
        
            bitpayButton.backgroundColor = .white
        getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
        
    }
    
    @IBAction func paynowTapped(_ sender: UIButton) {
        if courierServiceSelected! {
            chekoutAndPayDelegate?.paynowTapped(paymentMethod: paymentMethod)
        }
        else {
            chekoutAndPayDelegate?.showAlert(message: "Please Select Shipping Service!", title: "Alert")
        }
        
    }
    @IBAction func bankButtonTapped(_ sender: UIButton) {
        paymentMethod = .paypal
        
        paymentMethod = .bank
        
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

        paypalButton.backgroundColor = .white
   
        creditCardButton.backgroundColor = .white
    
        bitpayButton.backgroundColor = .white
        getCheckoutSummary(courierService: "", paymentMethod: paymentMethod!.rawValue, isWallet: self.isWallet.rawValue)
    }
}



extension CheckoutAndPayTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rates!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let courierServiceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourierServiceCollectionViewCell", for: indexPath) as? CourierServiceCollectionViewCell
       
        courierServiceCell?.courierNameLabel.text = rates?[indexPath.row]["courier_service"] as? String
        courierServiceCell?.daysLabel.text = rates?[indexPath.row]["courier_estimated_delivery_time"] as? String
        let price = rates?[indexPath.row]["rate"] as? String
        let image = rates?[indexPath.row]["courier_image"] as? String
        courierServiceCell?.priceLabel.text = "$ " + price!
        courierServiceCell?.serviceImageView.sd_setImage(with: URL(string: image!), placeholderImage: UIImage(), completed: nil)
        return courierServiceCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let courierServiceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourierServiceCollectionViewCell", for: indexPath) as? CourierServiceCollectionViewCell
        courierServiceCell?.isSelected = false
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let courierServiceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourierServiceCollectionViewCell", for: indexPath) as? CourierServiceCollectionViewCell
        let price = rates?[indexPath.row]["rate"] as! String
        chekoutAndPayDelegate?.showAlert(message: "$ \(price) Shipping Service Charges Added.", title: "Alert")
        let priceInDouble = Double.init(price)
        
       
        courierServiceCell?.isSelected = true
        courierServiceSelected = true
    }
    
    func updateChargesSummary(chargesSummary: [String : Any], totalCharges: Double) {
        guard let processingChargesValue = chargesSummary["processing_charges"] as? Int,
              let insuranceFeeValue = chargesSummary["insurance_fee"] as? Int,
              let lateFeeChargesValue = chargesSummary["late_fee_charges"] as? Int,
              let packageLateFeeValue = chargesSummary["package_late_fee"] as? Int,
              let vapChargesValue = chargesSummary["vap_charges"] as? Int,
              let shippingCharges =  chargesSummary["shipping_charges"] as? Int  else {
                  return
              }
        let processingChargesInDouble = Double.init(processingChargesValue)
        let insuranceFeeInDouble = Double.init(insuranceFeeValue)
        let lateFeeChargesInDouble = Double.init(lateFeeChargesValue)
        let packageLatFeeInDouble = Double.init(packageLateFeeValue)
        let vapChargesFeeInDouble = Double.init(vapChargesValue)
        let shippingChargesInDouble = Double.init(shippingCharges)
        let totalChargesInDouble = Double.init(totalCharges)
        processingCharges.text = "$ \(processingChargesInDouble)"
        insuranceFee.text = "$ \(insuranceFeeInDouble)"
        lateFeeCharges.text = "$ \(lateFeeChargesInDouble)"
        packageLateFee.text = "$ \(packageLatFeeInDouble)"
        vapCharges.text = "$ \(vapChargesFeeInDouble)"
        shippingChargesLabel.text = "$ \(shippingChargesInDouble)"
        totalChargesLabel.text = "$ \(totalChargesInDouble)"
        

    }
    
    func getCheckoutSummary(courierService: String,paymentMethod: String, isWallet: String) {
        checkoutVM = CheckoutVM()
        let userToken = getCurrentUserToken()
        checkoutVM?.getCheckoutSummaryOutgoing(token: userToken, requestId: self.requestID!, courier_service: courierService, payment_gateway: paymentMethod, is_wallet: isWallet, success: {[self] response in
           completion(response: response)
        }, failure: { str in
            print(str)
        })
    }
    
    
    func completion(response: NSDictionary) {
        let data = response["data"] as? [String: Any]
        let totalCharges = data?["total"]
        guard  let chargesSummary = data?["charges_summary"] as? [String: Any] else {
            return
        }
        self.updateChargesSummary(chargesSummary: chargesSummary, totalCharges: totalCharges as! Double)
    }
}
