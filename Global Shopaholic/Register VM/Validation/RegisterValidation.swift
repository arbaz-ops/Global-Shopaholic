//
//  RegisterValidation.swift
//  Weddings live
//
//  Created by Ahsan on 14/10/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation


struct RegisterValidation
{
    
    func Validation(registerRequest: RegistrationRequest) -> registerValidationResult
    {
        if registerRequest.FirstName!.isEmpty
        {
            return registerValidationResult(success: false, error: "First name is empty")
        }
        if registerRequest.LastName!.isEmpty
        {
            return registerValidationResult(success: false, error: "Last Name is empty")
        }
        if registerRequest.userEmail!.isEmpty
        {
            return registerValidationResult(success: false, error: "User Email is empty")
        }
        else if !isValidEmail(testStr: registerRequest.userEmail!){
            return registerValidationResult(success: false, error: "Please enter a valid email address")
        }
        if registerRequest.PhoneNumber!.isEmpty
        {
            return registerValidationResult(success: false, error: "Phone number is empty")
        }
        if registerRequest.gender!.isEmpty
        {
            return registerValidationResult(success: false, error: "Please Select Gender")
        }
        if registerRequest.password!.isEmpty
        {
            return registerValidationResult(success: false, error: "Password is empty")
        }
        if registerRequest.confirmpassword!.isEmpty
        {
            return registerValidationResult(success: false, error: "confirm Password is empty")
        }
        if registerRequest.password! != registerRequest.confirmpassword!
        {
            return registerValidationResult(success: false, error: "Passwords does not match. Please check")
        }
        if registerRequest.TermsAndCondition == false
        {
            return registerValidationResult(success: false, error: "Please Accept Terms and conditions")
        }
        
        return registerValidationResult(success: true, error: nil)
    }
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
