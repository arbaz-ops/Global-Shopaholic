//
//  BankTransferValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 5/19/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

struct BankTransferValidation
{
    
    func Validation(Request: BankDepositeRequest) -> BankTransferValidationResult
    {
       
        if Request.transactionAmount!.isEmpty
        {
            return BankTransferValidationResult(success: false, error: "Please Enter Transaction Amount")
        }
        if Request.transactionId!.isEmpty
        {
            return BankTransferValidationResult(success: false, error: "Please Enter Track ID")
        }
        if Request.receiptImage == nil
        {
            return BankTransferValidationResult(success: false, error: "Please Select Receipt Image")
        }

      
        return BankTransferValidationResult(success: true, error: nil)
    }
    
    
}
