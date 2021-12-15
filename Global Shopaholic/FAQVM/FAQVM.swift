//
//  FAQVM.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 24/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol FaqVMDelegate{
    func didGetFaq(response: NSDictionary)
    func didFailedToGetFAQ(msg:String)
    
}

struct FaqVM {
    var delegate: FaqVMDelegate?
   
    
    func GetFaq()
    {
        print("EmailVerification API is getting called here")
     let loginep = endpoints()
     
     RappleActivityIndicatorView.startAnimating()
        WebService.GetRequestWithoutToken(Token: nil, strURL: loginep.GetFAQEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
             self.delegate?.didGetFaq(response: response)
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.didFailedToGetFAQ(msg: "error")
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
    
}
