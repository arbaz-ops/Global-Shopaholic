//
//  getCountriesVM.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 12/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol CountriesVMDelegate{
    func didFailtoRequest(msg: String)
    func didFinished(response: NSDictionary)
}
struct CountriesVM
{
    var delegate: CountriesVMDelegate?
   
    
    func GetCountry(accessToken: String)
    {
        print("EmailVerification API is getting called here")
     let loginep = endpoints()
     
     RappleActivityIndicatorView.startAnimating()
        WebService.RequestWithTokenJson(Token: accessToken, strURL: loginep.getCountriesEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.didFinished(response: response)
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.didFailtoRequest(msg: "error")
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
    
}
