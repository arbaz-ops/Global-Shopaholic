//
//  AspVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/28/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol AspDelegate {
    func didGetSavedItemsData(response: NSDictionary)
    func didFailedTogetSavedItemData(msg: String)
    
}

struct AspVMP{
    var delegate: AspDelegate?
    func getSavedItemsData(token: String)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        WebService.GetRequestWithoutToken(Token: token, strURL: ep.GetUserAspData, is_loader_required: false, params: ["":""]) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
               self.delegate?.didGetSavedItemsData(response: response)
               
            }
            else{
                RappleActivityIndicatorView.stopAnimation()

               self.delegate?.didFailedTogetSavedItemData(msg: response["message"] as! String)

            }
          
            
        
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }
    }
    
    }
