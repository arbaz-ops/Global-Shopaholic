//
//  LoginVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
import UIKit
protocol LoginVmDelegat{
    func didFailtoRequest(LoginRequestResponse: LoginRequestResponse)
    func didFinished(response: NSDictionary)
}

struct LoginVM
{
    var delegate: LoginVmDelegat?
    func Loginuser(registerRequest: LoginRequest)
       {
           print()
           let validationResult = LoginValidation().Validation(registerRequest: registerRequest)
           if validationResult.success{
            self.LoginUser(registerRequest: registerRequest)
           }
           else{
            self.delegate?.didFailtoRequest(LoginRequestResponse: LoginRequestResponse(message: validationResult.error))
           }
//        Post Data -> Optional({
//          "password" : "qwerty",
//          "phone_number" : "+92333",
//          "first_name" : "ahsan",
//          "email" : "Minhas@gmail.com",
//          "last_name" : "MInhas"
//        })
       }
       private func LoginUser(registerRequest: LoginRequest)
       {
           print("EmailVerification API is getting called here")
        let loginep = endpoints()
        let param = ["email":registerRequest.Email_SN!,"password": registerRequest.Password!]
        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrlWithJSONDictionaryParameters(strURL: loginep.loginEP, is_loader_required: false, params: param) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFinished(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()

                self.delegate?.didFailtoRequest(LoginRequestResponse: LoginRequestResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }

        //self.delegate?.didFinished()
           //self.delegate?.DidReceiveResponse()
       }
}
