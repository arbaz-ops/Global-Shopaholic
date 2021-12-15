//
//  DepositeCardValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 5/18/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
struct DespositeCardValidation
{
    
    func Validation(registerRequest: DepositeCreditCardRequest) -> DespositeCardValidationResult
    {
        if registerRequest.amount!.isEmpty
        {
            return DespositeCardValidationResult(success: false, error: "Please Enter Amount")
        }
        if registerRequest.cardNumber!.isEmpty
        {
            return DespositeCardValidationResult(success: false, error: "Please Enter Card Number")
        }
        if registerRequest.accountHolderName!.isEmpty
        {
            return DespositeCardValidationResult(success: false, error: "Please enter account holder name")
        }
        if registerRequest.expDate!.isEmpty
        {
            return DespositeCardValidationResult(success: false, error: "Please enter Expiry Date")
        }
        if registerRequest.cvcNumber!.isEmpty
        {
            return DespositeCardValidationResult(success: false, error: "Please enter CVC number")
        }
       
        return DespositeCardValidationResult(success: true, error: nil)
    }
    
    
}
