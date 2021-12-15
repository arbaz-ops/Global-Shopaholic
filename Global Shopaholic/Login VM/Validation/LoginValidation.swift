//
//  LoginValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation


struct LoginValidation
{
    
    func Validation(registerRequest: LoginRequest) -> loginValidationResult
    {
        if registerRequest.Email_SN!.isEmpty
        {
            return loginValidationResult(success: false, error: "Email is empty")
        }
        else if !isValidEmail(testStr: registerRequest.Email_SN!){
            return loginValidationResult(success: false, error: "Please enter a valid email address")
        }
        if registerRequest.Password!.isEmpty
        {
            return loginValidationResult(success: false, error: "Password is empty")
        }
     
        return loginValidationResult(success: true, error: nil)
    }
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
