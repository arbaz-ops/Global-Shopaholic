//
//  CheckoutAndPayTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

protocol CheckoutAndPayTableViewCellDelegate {
    func paynowTapped(paymentMethod: PaymentMethod?)
}

class CheckoutAndPayTableViewCell: UITableViewCell {

    var paymentMethod: PaymentMethod?
    
    @IBOutlet weak var walletCurrentBalance: UILabel!
    @IBOutlet weak var bitpayButton: UIButton!
    @IBOutlet weak var bankButton: UIButton!
    @IBOutlet weak var creditCardButton: UIButton!
    @IBOutlet weak var paypalButton: UIButton!
    @IBOutlet weak var useWalletCircleButton: UIButton!
    @IBOutlet weak var shipmentInvoiceView: UIView!
    @IBOutlet weak var payNowButton: UIButton!
    @IBOutlet var couriers: [UIView]!
    @IBOutlet weak var uspsView: UIView!
    @IBOutlet weak var upsView: UIView!
    @IBOutlet weak var dhlView: UIView!
    @IBOutlet weak var fedexView: UIView!
    @IBOutlet weak var aramexView: UIView!
    var useWallet: Bool?
    var chekoutAndPayDelegate: CheckoutAndPayTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        shipmentInvoiceView.layer.cornerRadius = 10
        shipmentInvoiceView.DropShadowView()
        couriers.forEach { view in
            view.layer.borderColor = hexStringToUIColor(hex: "#3B525A").cgColor
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
        }
        payNowButton.layer.cornerRadius = 10
        
        
        paymentMethod = .none

        useWallet = false
        // Initialization code
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
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5
        
            bankButton.backgroundColor = .white
        
        
            creditCardButton.backgroundColor = .white
        
        
            paypalButton.backgroundColor = .white
        
        
        
    }
    @IBAction func creditcardButtonTapped(_ sender: UIButton) {
        
        paymentMethod = .card
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

        
            bankButton.backgroundColor = .white
        
        
            bitpayButton.backgroundColor = .white
        
        
            paypalButton.backgroundColor = .white
        
    }
    
    @IBAction func paypalButtonTapped(_ sender: UIButton) {
        paymentMethod = .paypal
        sender.backgroundColor =  hexStringToUIColor(hex: appColors.init().checkoutMethodSelectedColor)
        sender.layer.cornerRadius = 5

            bankButton.backgroundColor = .white
       
            creditCardButton.backgroundColor = .white
        
            bitpayButton.backgroundColor = .white
        
    }
    
    @IBAction func paynowTapped(_ sender: UIButton) {
        chekoutAndPayDelegate?.paynowTapped(paymentMethod: paymentMethod)
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
