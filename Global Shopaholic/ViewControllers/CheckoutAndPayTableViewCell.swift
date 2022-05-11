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

    var paymentMethod: PaymentMethod?
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
    
    var rates: [[String: Any]]? {
        didSet {
            setUpCollectionView()
        }
    }
//    @IBOutlet weak var uspsView: UIView!
//    @IBOutlet weak var upsView: UIView!
//    @IBOutlet weak var dhlView: UIView!
//    @IBOutlet weak var fedexView: UIView!
//    @IBOutlet weak var aramexView: UIView!
    var useWallet: Bool?
    var chekoutAndPayDelegate: CheckoutAndPayTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        destinationView.layer.cornerRadius = 10
        destinationView.DropShadowView()
        shipmentInvoiceView.layer.cornerRadius = 10
        shipmentInvoiceView.DropShadowView()
        
        payNowButton.layer.cornerRadius = 10
        
        
        paymentMethod = .none
        
        useWallet = false
        courierServiceSelected = false
        // Initialization code
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
        if !useWallet! {
            sender.setImage(UIImage.init(systemName: "circle.fill"), for: .normal)
            sender.tintColor = hexStringToUIColor(hex: "#0BBAA3")
            useWallet = true
            paymentMethod = nil
            bankButton.backgroundColor = .white
            creditCardButton.backgroundColor = .white
            paypalButton.backgroundColor = .white
            bitpayButton.backgroundColor = .white
        }
        else {
            sender.setImage(UIImage.init(systemName: "circle"), for: .normal)
            sender.tintColor = hexStringToUIColor(hex: "#0BBAA3")
            useWallet = false
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
        
        
        
    }
    @IBAction func creditcardButtonTapped(_ sender: UIButton) {
        
        paymentMethod = .card
//        chekoutAndPayDelegate?.paymentMethodSelected(paymentMethod: .card)

        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

        
            bankButton.backgroundColor = .white
        
        
            bitpayButton.backgroundColor = .white
        
        
            paypalButton.backgroundColor = .white
        
    }
    
    @IBAction func paypalButtonTapped(_ sender: UIButton) {
        paymentMethod = .paypal
//        chekoutAndPayDelegate?.paymentMethodSelected(paymentMethod: .paypal)
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5
        
            bankButton.backgroundColor = .white
       
            creditCardButton.backgroundColor = .white
        
            bitpayButton.backgroundColor = .white
        
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
        paymentMethod = .bank
        
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

        paypalButton.backgroundColor = .white
   
        creditCardButton.backgroundColor = .white
    
        bitpayButton.backgroundColor = .white
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
        courierServiceCell?.priceLabel.text = "$ " + price! ?? "0.0"
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
        shippingChargesLabel.text = "$ " + price
        courierServiceCell?.isSelected = true
        courierServiceSelected = true

      
    }
    
    
}
