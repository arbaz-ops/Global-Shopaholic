//
//  StorageVM.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 23/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD

//protocol StorageVMDelegate{
//
//    func didFinishedGettingPackages(response: NSDictionary)
//}



struct StorageVM {
  
    func getPackagesList(token: String, keyValue: String,subStatus: String, key: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params = ["\(key)": keyValue,
                      "subStatus": subStatus]
        print(params)
        RappleActivityIndicatorView.startAnimating()

        WebService.RequestWithTokenJsonWithParams(Token: token, strURL: ep.packagesList, is_loader_required: false, params: params) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
        } failure: { str in
            RappleActivityIndicatorView.stopAnimation()
            failure(str)
            print(str)
        }

    }
}
