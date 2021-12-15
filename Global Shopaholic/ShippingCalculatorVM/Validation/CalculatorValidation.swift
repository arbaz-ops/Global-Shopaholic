//
//  CalculatorValidation.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/13/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
struct CalculatorValidation{
    
    func Validation(CalculatorRequest: CalculatorRequest) -> CalculatorValidationResult
    {
        if CalculatorRequest.Country!.isEmpty
        {
            return CalculatorValidationResult(success: false, error: "Please Select Country")
            
        }
        
        if CalculatorRequest.City!.isEmpty
        {
                return CalculatorValidationResult(success: false, error: "Please Select City")
                
        }
        if CalculatorRequest.ZipCode!.isEmpty
        {
                return CalculatorValidationResult(success: false, error: "Please Enter Zipcode")
                
        }
        if (CalculatorRequest.Unit != 1 && CalculatorRequest.Unit != 2)
        {
                return CalculatorValidationResult(success: false, error: "Please Select Measurement Unit")
                
        }
        if CalculatorRequest.height!.isEmpty
        {
                return CalculatorValidationResult(success: false, error: "Please Add Box")
                
        }
        
        return CalculatorValidationResult(success: true, error: nil)
    }
}
