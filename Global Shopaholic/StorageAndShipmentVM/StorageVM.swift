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
    
    func getRequestPackageList(token: String, requestId: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        print(token)
        print(requestId)
        
        let params = ["request_id": requestId]
        print(params)
        RappleActivityIndicatorView.startAnimating()

        WebService.RequestWithTokenJsonWithParams(Token: token, strURL: ep.getRequestPackages, is_loader_required: false, params: params) { response in
            RappleActivityIndicatorView.stopAnimation()
            success(response)
        } failure: { str in
            RappleActivityIndicatorView.stopAnimation()
            failure(str)
            print(str)
        }
    }
    
    func attachPaidServices(token: String,packageId: String,paidService: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params: [String: Any] = [
            "package_id": packageId,
            "service_name": paidService
        ]
        RappleActivityIndicatorView.startAnimating()

        WebService.postMultipartDataWithTokenWithOutImage(Token: token, strURL: ep.paidServices, is_loader_required: false, params: params, method: .post) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
            
        } failure: { error in
            RappleActivityIndicatorView.stopAnimation()

            failure(error)
        }

    }
    
    func attachFreeServices(token: String,packageId: String,freeService: String, flag: String, description: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params: [String: Any] = [
            "package_id": packageId,
            "service_name": freeService,
            "flag": flag,
            "description": description
        ]
        RappleActivityIndicatorView.startAnimating()

        WebService.postMultipartDataWithTokenWithOutImage(Token: token, strURL: ep.freeServices, is_loader_required: false, params: params, method: .post) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
            
        } failure: { error in
            RappleActivityIndicatorView.stopAnimation()

            failure(error)
        }

    }
    
    func returnPackage(token: String,packageId: String,type: String,detail: String , image: UIImage, success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let params: [String: Any] = [
            "package_id": packageId,
            "type": type,
            "detail": detail
        ]
        RappleActivityIndicatorView.startAnimating()

        WebService.postMultipartDataWithToken(Token: token, strURL: ep.returnPackage, is_loader_required: false, image: image, params: params, method: .post) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
            
            
        } failure: { error in
            RappleActivityIndicatorView.stopAnimation()

            failure(error)
        }

        
    }
    
    
    func createConsolidationRequest(token: String, packages: [String], destinationAddress: String, specialRequestInfo: String?, additionalInfo: [String]?,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        RappleActivityIndicatorView.startAnimating()
        WebService.postMultipartArrayWithToken(Token: token, strURL: ep.createConsolidation, is_loader_required: false, packages: packages, destinationAddress: destinationAddress, specialRequestInfo: specialRequestInfo!, additionalInfo: additionalInfo!, method: .post) { response in
            RappleActivityIndicatorView.stopAnimation()

            success(response)
        } failure: { error in
            RappleActivityIndicatorView.stopAnimation()

            failure(error)
        }

    }
    
}
