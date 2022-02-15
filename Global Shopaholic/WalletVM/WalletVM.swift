//
//  WalletVM.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 14/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD


class WalletVM {
    
    
     func getWalletInfo(token: String?, success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void)
    {

        let EP = endpoints()

        WebService.RequestWithTokenJson(Token: token!, strURL: EP.walletInfoEP, is_loader_required: false, params: ["":""]) {  (response) in
            if (response["success"] as! Bool) == true
            {
                
                RappleActivityIndicatorView.stopAnimation()

                success(response)
                
                
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()
            failure(error)
            print("something bad happend")
        }

    }
    
    
}
