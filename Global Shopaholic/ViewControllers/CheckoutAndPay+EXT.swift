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
            let alert = UIAlertController(title: "Coming Soon", message: "", preferredStyle: .alert)
          let action =  UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        case .card:
            let creditCardVC = self.storyboard?.instantiateViewController(withIdentifier: "CreditCardViewController") as? CreditCardViewController
            creditCardVC?.modalPresentationStyle = .overFullScreen
            creditCardVC?.isModalInPresentation = true
           present(creditCardVC!, animated: true, completion: nil)
        case .bank:
            let bankTransferVC = self.storyboard?.instantiateViewController(withIdentifier: "BankTransferViewController") as? BankTransferViewController
            bankTransferVC?.modalPresentationStyle = .overFullScreen
            bankTransferVC?.isModalInPresentation = true
           present(bankTransferVC!, animated: true, completion: nil)
        case .bitcoin:
            let alert = UIAlertController(title: "Coming Soon", message: "", preferredStyle: .alert)
          let action =  UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        
        case .none:
            let alert = UIAlertController(title: "Payment Method!", message: "Please select payment method.", preferredStyle: .alert)
          let action =  UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
   
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


