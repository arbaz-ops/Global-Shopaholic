//
//  addressValidtation.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation




struct addressValidtation
{
    
    func Validation(addressRequest: addressModelRequest) -> AddressValidationResult
    {
        if addressRequest.userName!.isEmpty
        {
            return AddressValidationResult(success: false, error: "User Name is empty")
        }
        if addressRequest.contactNumber!.isEmpty
        {
            return AddressValidationResult(success: false, error: "Contact Number is empty")
        }
        if addressRequest.streetName!.isEmpty
        {
            return AddressValidationResult(success: false, error: "Street Name is empty")
        }
        if addressRequest.countryName!.isEmpty
        {
            return AddressValidationResult(success: false, error: "Country Name is empty")
        }
        if addressRequest.stateName!.isEmpty
        {
            return AddressValidationResult(success: false, error: "State Name is empty")
        }
        if addressRequest.zipCode!.isEmpty
        {
            return AddressValidationResult(success: false, error: "zipCode is empty")
        }
        if addressRequest.cityName!.isEmpty
        {
            return AddressValidationResult(success: false, error: "City is empty")
        }
        return AddressValidationResult(success: true, error: nil)
    }
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

