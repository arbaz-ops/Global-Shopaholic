//
//  File.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

import RappleProgressHUD
protocol getCitiesVMDelegate{
    func didFailtoGetCities(msg: String)
    func didGetCities(response: NSDictionary)
}
struct getCitiesVM
{
    var delegate: getCitiesVMDelegate?
   
    
    func GetCities(accessToken: String,request: CountryCity)
    {
        print("EmailVerification API is getting called here")
     let loginep = endpoints()
        let param:[String: String] = ["country": request.CountryName!]
        
     RappleActivityIndicatorView.startAnimating()
        print("AccessTokem\(accessToken)")
        WebService.requestPostUrl(Token: accessToken, strURL: loginep.getCitiesEP, params: param, is_loader_required: false) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.didGetCities(response: response)
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.didFailtoGetCities(msg: "error")
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
    
}
