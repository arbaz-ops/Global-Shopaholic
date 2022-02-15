//
//  CheckoutAndPay+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 14/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension CheckoutAndPayViewController: CheckoutAndPayTableViewCellDelegate {
    
    
    func paynowTapped(paymentMethod: PaymentMethod?) {
        switch paymentMethod {
        case .paypal:
            print("Paypal")
        case .card:
            let creditCardVC = self.storyboard?.instantiateViewController(withIdentifier: "CreditCardViewController") as? CreditCardViewController
            creditCardVC?.modalPresentationStyle = .overFullScreen
//            creditCardVC?.isModalInPresentation = true
           present(creditCardVC!, animated: true, completion: nil)
        case .bank:
            print("Bank")
        case .bitcoin:
            print("bitcoin")
        
        case .none:
            let alert = UIAlertController(title: "Payment Method!", message: "Please select payment method.", preferredStyle: .alert)
          let action =  UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
