//
//  DropAddressVM.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 16/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol DropAddressDelegate {
    func DidDeleteSuccessfully()
    func DidErrorOccuredWhileDeleting(error: String)
}

struct DropAddressVM{
    var delegate: DropAddressDelegate?
    func deleteAddress(accessToken: String,addressID:String)
    {
        print("deleteAddress")
     let loginep = endpoints()
        let param:[String: String] = ["address_id": addressID]
        
     RappleActivityIndicatorView.startAnimating()
        print("AccessTokem\(accessToken)")
        WebService.requestPostUrl(Token: accessToken, strURL: loginep.dropAddressEP, params: param, is_loader_required: false) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.DidDeleteSuccessfully()
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.DidErrorOccuredWhileDeleting(error: "Failed to delete address")
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
}
