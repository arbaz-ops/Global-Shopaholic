//
//  RegistrationVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD

protocol RegistrationRequestDelegate{
    func DidFailtoRequest(RegisterResponse: RegisterRequestResponse?)
    func DidFinishedHTTPRequest(response: NSDictionary)
}


struct RegistrationViewModel{

    var delegate: RegistrationRequestDelegate?
    
    func RegisterUser(registerRequest: RegistrationRequest)
    {
        print()
        let validationResult = RegisterValidation().Validation(registerRequest: registerRequest)
        if validationResult.success{
            print("call Api")
            
            
            regApicall(registerRequest: registerRequest)
            
            
            
            
           // delegate?.DidFinishedHTTPRequest(response: )
        }
        else{
            self.delegate?.DidFailtoRequest(RegisterResponse: RegisterRequestResponse(message: validationResult.error))
        }
        
    }
    private func regApicall(registerRequest: RegistrationRequest)
    {
        print("EmailVerification API is getting called here")
        
            print("EmailVerification API is getting called here")
         let loginep = endpoints()
        let param = ["email":registerRequest.userEmail!,"password": registerRequest.password!,"first_name":registerRequest.FirstName!,"last_name": registerRequest.LastName!,"phone_number":registerRequest.PhoneNumber!,"gender":registerRequest.gender!]
         RappleActivityIndicatorView.startAnimating()
         WebService.requestPostUrlWithJSONDictionaryParameters(strURL: loginep.regisrationEP, is_loader_required: false, params: param) { (response) in
            print("asdsaasd \(response)")
             if response["status_code"] as! NSNumber == 200
             {
                 RappleActivityIndicatorView.stopAnimation()
                 self.delegate?.DidFinishedHTTPRequest(response: response)
             }
             else{
                 RappleActivityIndicatorView.stopAnimation()
                let error = response["errors"] as! NSDictionary
           
                if error["email"] != nil{
                    let err = error["email"] as! NSArray
                    self.delegate?.DidFailtoRequest(RegisterResponse: RegisterRequestResponse(message: (err[0] as! String)))
                }
                if error["phone_number"] != nil{
                    let err = error["phone_number"] as! NSArray
                    self.delegate?.DidFailtoRequest(RegisterResponse: RegisterRequestResponse(message: (err[0] as! String)))

                }
                if error["password"] != nil{
                    let err = error["passwords"] as! NSArray
                    self.delegate?.DidFailtoRequest(RegisterResponse: RegisterRequestResponse(message: (err[0] as! String)))

                }
                else{
                    self.delegate?.DidFailtoRequest(RegisterResponse: RegisterRequestResponse(message: (response["message"] as! String)))
                }
                 
             }
         } failure: { (error) in
             RappleActivityIndicatorView.stopAnimation()

             print("something bad happend")
         }

         //self.delegate?.didFinished()
            //self.delegate?.DidReceiveResponse()
        
    }
}
