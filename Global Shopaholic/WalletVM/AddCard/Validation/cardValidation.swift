//
//  cardValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
struct cardValidation
{
    
    func Validation(registerRequest: AddCreditCardRequest) -> cardValidationResult
    {
        if registerRequest.cardNumber!.isEmpty
        {
            return cardValidationResult(success: false, error: "Please Enter Card Number")
        }
        if registerRequest.accountHolderName!.isEmpty
        {
            return cardValidationResult(success: false, error: "Please enter account holder name")
        }
        if registerRequest.expDate!.isEmpty
        {
            return cardValidationResult(success: false, error: "please select Month")
        }
        if registerRequest.expYear!.isEmpty
        {
            return cardValidationResult(success: false, error: "Please enter year")
        }
        if registerRequest.cvcNumber!.isEmpty
        {
            return cardValidationResult(success: false, error: "Please enter CVC number")
        }
       
        return cardValidationResult(success: true, error: nil)
    }
    
    
}
