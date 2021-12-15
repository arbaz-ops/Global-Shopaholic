//
//  InfoUpdateValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/3/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

struct InfoUpdateValidation
{
    
    func Validation(registerRequest: InforUpdateRequest) -> InfoValidationResult
    {
        if registerRequest.FirstName!.isEmpty
        {
            return InfoValidationResult(success: false, error: "First name is empty")
        }
        if registerRequest.PhoneNumber!.isEmpty
        {
            return InfoValidationResult(success: false, error: "Phone number is empty")
        }
        if registerRequest.DOB!.isEmpty
        {
            return InfoValidationResult(success: false, error: "DOB is empty")
        }
        if registerRequest.Gender!.isEmpty
        {
            return InfoValidationResult(success: false, error: "Gender Field is empty")
        }
      
        
        return InfoValidationResult(success: true, error: nil)
    }
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
