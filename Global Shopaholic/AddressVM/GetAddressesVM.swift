//
//  GetAddressesVM.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 16/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol getAddressesDelegate{
    func didFailToGetAddress(msg:String)
    func didFinishedGettingAddress(response: NSDictionary)
}





struct GetAddressesVM {
    var delegate: getAddressesDelegate?
    
    func getAddress(accessToken: String)
    {
        print("EmailVerification API is getting called here")
     let loginep = endpoints()
     
     RappleActivityIndicatorView.startAnimating()
        WebService.RequestWithTokenJson(Token: accessToken, strURL: loginep.getUserAddressesEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.didFinishedGettingAddress(response: response)
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.didFailToGetAddress(msg: "error")
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         self.delegate?.didFailToGetAddress(msg: "Something went bad")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
}

