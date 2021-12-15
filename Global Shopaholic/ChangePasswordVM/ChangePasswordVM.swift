//
//  ChangePasswordVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/5/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD


protocol ChangePasswordDelegate{
    func DidFailtoRequest(Response: ChangePasswordResponse?)
    func DidFinishedChanging(response: NSDictionary)
}



struct ChangePasswordVM{
    var delegate: ChangePasswordDelegate?
    func ChangePassword(request: ChangePasswordRequest,token: String)
    {
        print()
        let validationResult = PasswordValidation().Validation(registerRequest: request)
        if validationResult.success{
            Change(request: request, token: token)
        }
        else{
            self.delegate?.DidFailtoRequest(Response: ChangePasswordResponse(message: validationResult.error))
        }
        
    }
    private func Change(request: ChangePasswordRequest,token: String)
    {
        print("Updating")
        
        let loginep = endpoints()
        let param = ["old_password":request.OldPassword!,"password":request.NewPassword!,"password_confirmation": request.ConfirmPassword!]
        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrl(Token: token, strURL: loginep.ChangePasswordEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.DidFinishedChanging(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.DidFailtoRequest(Response: ChangePasswordResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
}
