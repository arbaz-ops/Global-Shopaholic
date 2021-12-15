//
//  InfoUpdateVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/3/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol InfoUpdateDelegate{
    func DidFailtoRequest(Response: InfoUpdateResponse?)
    func DidFinishedHTTPRequest(response: NSDictionary)
}

struct InfoUpdateVM{
    var delegate: InfoUpdateDelegate?
    
    func UpdateUser(request: InforUpdateRequest,token: String)
    {
        print()
        let validationResult = InfoUpdateValidation().Validation(registerRequest: request)
        if validationResult.success{
            update(request: request, token: token)
        }
        else{
            self.delegate?.DidFailtoRequest(Response: InfoUpdateResponse(message: validationResult.error))
        }
        
    }
    
    private func update(request: InforUpdateRequest,token: String)
    {
        print("Updating")
        
        let loginep = endpoints()
        let param = ["first_name":request.FirstName!,"last_name":"Minhas","gender": request.Gender!,"dob": request.DOB!,"phone": request.PhoneNumber!]
        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrl(Token: token, strURL: loginep.UpdateInfoEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.DidFinishedHTTPRequest(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.DidFailtoRequest(Response: InfoUpdateResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
}
