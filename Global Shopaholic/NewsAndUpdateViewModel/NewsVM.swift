//
//  NewsVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/15/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RappleProgressHUD

protocol NewsDelegate{
    func didGetNews(response: NSDictionary)
    func DidFailToGetNews(msg:String)
    
}
struct NewsVM{
    var delegate: NewsDelegate?
    
    func GetNews(token:String)
    {
        let ep = endpoints()
        WebService.GetRequestWithoutToken(Token: token, strURL: ep.newsEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
            self.delegate?.didGetNews(response: response)
            
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.DidFailToGetNews(msg: response["message"] as! String)

         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }
    }
}
