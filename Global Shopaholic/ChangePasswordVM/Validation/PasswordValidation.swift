//
//  PasswordValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/5/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


struct PasswordValidation{
    
    func Validation(registerRequest: ChangePasswordRequest) -> PasswordValidationResult
    {
        if registerRequest.OldPassword!.isEmpty
        {
            return PasswordValidationResult(success: false, error: "Please enter your Current Password")
        }
        if registerRequest.NewPassword!.isEmpty
        {
            return PasswordValidationResult(success: false, error: "Please enter your new password")
        }
        if registerRequest.ConfirmPassword!.isEmpty
        {
            return PasswordValidationResult(success: false, error: "Please Enter Confirm Password")
        }
        if registerRequest.ConfirmPassword! != registerRequest.NewPassword!
        {
            return PasswordValidationResult(success: false, error: "Passwords Doesnt Match")

        }
      
        return PasswordValidationResult(success: true, error: nil)
    }
}
