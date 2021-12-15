//
//  addAddressVM.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol addAddressVMDelegate{
    func didFailtoRequest(LoginRequestResponse: addressModelRequestResponse)
    func didFinishedAddingAddress(response: NSDictionary)
}


struct addAddressVM {
    var delegate: addAddressVMDelegate?
    func addAddress(addressReq: addressModelRequest,accessToken: String,isEditing: Bool)
    {
        print("addAddress")
        let validationResult = addressValidtation().Validation(addressRequest: addressReq)
        if validationResult.success{
            self.SendAddress(addressReq: addressReq, accessToken: accessToken, isEditing: isEditing)
        }
        else{
            print(validationResult.error!)
         self.delegate?.didFailtoRequest(LoginRequestResponse: addressModelRequestResponse(message: validationResult.error))
        }
    }
    private func SendAddress(addressReq: addressModelRequest,accessToken: String,isEditing:Bool)
    {
        print("SendAddress")
     let loginep = endpoints()
        var ep = ""
        var param = [String:String]()
        if isEditing{
            print(addressReq)
            print(addressReq.addressID)
            param = ["name": addressReq.userName!,"phone":addressReq.contactNumber!,"country_name":addressReq.countryName!,"zip_code":addressReq.zipCode!,"street":addressReq.streetName!,"city":addressReq.cityName!,"state":addressReq.stateName!,"address_id":addressReq.addressID!]
            ep = loginep.updateAddressEP
        }
        else{
         param = ["name":addressReq.userName!,"phone":addressReq.contactNumber!,"country_name":addressReq.countryName!,"zip_code":addressReq.zipCode!,"street":addressReq.streetName!,"city":addressReq.cityName!,"state":addressReq.stateName!]
            ep = loginep.addAddressEP
        }
     RappleActivityIndicatorView.startAnimating()
        print("AccessTokem\(accessToken)")
        WebService.requestPostUrl(Token: accessToken, strURL: ep, params: param, is_loader_required: false) { (response) in
            print(response)
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.didFinishedAddingAddress(response: response)
         }
         else
         {
             RappleActivityIndicatorView.stopAnimation()
            self.delegate?.didFailtoRequest(LoginRequestResponse: addressModelRequestResponse(message: "error"))
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
}
