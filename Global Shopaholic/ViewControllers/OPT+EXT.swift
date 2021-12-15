//
//  OPT+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension OTPVC
{
    @objc func keyboardWillShow(notification: NSNotification) {
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
        
        if(shouldMoveViewUp) {
           
            self.view.frame.origin.y = 0 - 150
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
             self.view.frame.origin.y = 0
         }
         
}



extension OTPVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("123")
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}
