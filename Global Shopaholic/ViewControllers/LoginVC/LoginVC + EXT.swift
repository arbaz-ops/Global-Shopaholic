//
//  LoginVC + EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension LoginVC : UITextFieldDelegate, LoginVmDelegat {
    func didFinished(response: NSDictionary) {
        let userDefaults = UserDefaults.standard
        let data = response["data"] as! NSDictionary
        let userData = data["user"] as! NSDictionary
        //let warehouseAddress = data["warehouseAddress"] as! NSDictionary
        //userData = userData as! NSDictionary
       // userData = data[0] as! NSDictionary
        //print("userdataaaaa()")warehouseAddress
        print("this is userDataaaaaaaa")
        print(userData)
        
       //nil print(warehouseAddress)
       
        //print(userData)
        self.user_data = UserDataClass(token: userData["access_token"] as! String, userData: userData, warehouseAddress: nil)
        
        do {
        let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: user_data!, requiringSecureCoding: false)
        
          userDefaults.set(encodedData, forKey: "user_data")
            
          userDefaults.synchronize()
          
            
        }catch let error{
            print(error.localizedDescription)
        }
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
               
               UIApplication.shared.windows.first?.rootViewController = viewController
               UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func didFailtoRequest(LoginRequestResponse: LoginRequestResponse) {
        COMMON_ALERT.showAlert(msg: LoginRequestResponse.message!)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("123")
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    
    
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
         print(activeTextField!.tag)
         if(shouldMoveViewUp) {
            if activeTextField!.tag == 5  {
                self.view.frame.origin.y = 0 - 200
            }
            else{
                self.view.frame.origin.y = 0 - 150
            }
             
         }
     }

    
     @objc func keyboardWillHide(notification: NSNotification) {
           self.view.frame.origin.y = 0
       }
       
       @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
           // go through all of the textfield inside the view, and end editing thus resigning first responder
           // ie. it will trigger a keyboardWillHide notification
           self.view.endEditing(true)
       }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 3
        {
            let currentField = textField.text ?? ""
            guard let strRange = Range(range,in:currentField)else
            {
                return false
            }
            let updateText = currentField.replacingCharacters(in: strRange, with: string)
                   // lblNumber.text = "\(16 - updateText.count)"
                    
                    return updateText.count < 15
        }
        return (200 != 0)
    }
}
