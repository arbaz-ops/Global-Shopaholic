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
  
    func getPackagesList(token: String, status: String,subStatus: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params = ["status": status,
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
    
    func getRequestReview(token: String, requestId: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params = ["request_id": requestId]
        print(params)
        RappleActivityIndicatorView.startAnimating()

        WebService.RequestWithTokenJsonWithParams(Token: token, strURL: ep.getRequestReview, is_loader_required: false, params: params) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
        } failure: { str in
            RappleActivityIndicatorView.stopAnimation()
            failure(str)
            print(str)
        }

    }
    
    func getCustomDeclaration(token: String, requestId: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params = ["request_id": requestId]
        print(params)
        RappleActivityIndicatorView.startAnimating()

        WebService.RequestWithTokenJsonWithParams(Token: token, strURL: ep.getCustomDeclaration, is_loader_required: false, params: params) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
        } failure: { str in
            RappleActivityIndicatorView.stopAnimation()
            failure(str)
            print(str)
        }
    }
}
