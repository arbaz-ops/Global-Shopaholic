//
//  WebService.swift
//  Dry Clean City
//
//  Created by Apple on 06/06/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum NetworkError: Error {
    case notFound, internalServerError, badUrl
}


import RappleProgressHUD//http://beta.globalshopaholics.com   //http://192.168.100.2/ http://globalshopaholics.com/
let BASE_URL = "http://34.194.133.139:8888/"
class WebService: NSObject {
    
    class func postMultipartArrayWithToken(Token: String, strURL: String,is_loader_required: Bool,  packages: [String],destinationAddress: String,specialRequestInfo: String,additionalInfo: [String] , method: HTTPMethod,success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
            print(Token)

       
            
            let headers = [
                "Authorization": "Bearer "+Token,
                "Accept": "application/json",
                "Content-Type": "multipart/form-data"
            ]
            print(packages)
            print(destinationAddress)
            print(specialRequestInfo)
            print(additionalInfo)
            
            Alamofire.upload(multipartFormData: { multipartData in
                                 
                for package in packages {
                    print(package)
                    multipartData.append("\(package)".data(using: .utf8)!, withName: "packages[]")
                }
                multipartData.append("\(destinationAddress)".data(using: .utf8)!, withName: "destination_address")
                multipartData.append("\(specialRequestInfo)".data(using: .utf8)!, withName: "special_request_info")
                
                for info in additionalInfo {
                    multipartData.append("\(info)".data(using: .utf8)!, withName: "additional_info[]")
                }
//                for (key,value) in params {
//                    multipartData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
            }, to: BASE_URL.appending(strURL), method: .post, headers: headers) { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        switch(response.result) {

                        case .success(_):
                            if let data = response.data
                            {
                                print(JSON(data).dictionaryObject!)
                              
                               
                                if let dataDictionary = JSON(data).dictionaryObject
                                {
                                    success(dataDictionary as NSDictionary)
                                }
                                if let dataArray = JSON(data).arrayObject
                                {
                                    success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                                }
                            }
                            break

                        case .failure(_):
                            
                            failure(response.error!.localizedDescription )
                            break
                        }
                    }
                case .failure(_):
                    failure("Something Went wrong")
                }
            }

    }
    }
    
    
    class func postMultipartDataWithTokenWithOutImage(Token: String, strURL: String,is_loader_required: Bool ,params: [String: Any], method: HTTPMethod,success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)
            print(Token)

       
            
            let headers = [
                "Authorization": "Bearer "+Token,
                "Accept": "application/json",
                "Content-Type": "multipart/form-data"
            ]
            
            Alamofire.upload(multipartFormData: { multipartData in
                
                
                 
                for (key,value) in params {
                    multipartData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to: BASE_URL.appending(strURL), method: .post, headers: headers) { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        switch(response.result) {

                        case .success(_):
                            if let data = response.data
                            {
                                print(JSON(data).dictionaryObject!)
                              
                               
                                if let dataDictionary = JSON(data).dictionaryObject
                                {
                                    success(dataDictionary as NSDictionary)
                                }
                                if let dataArray = JSON(data).arrayObject
                                {
                                    success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                                }
                            }
                            break

                        case .failure(_):
                            
                            failure(response.error.debugDescription )
                            break
                        }
                    }
                case .failure(let error):
                    failure(error.localizedDescription)
                }
            }

    }
    }
    
    
    class func postMultipartDataWithToken(Token: String, strURL: String,is_loader_required: Bool,image: UIImage? ,params: [String: Any], method: HTTPMethod,success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)
            print(Token)

       
            guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
                return
            }
            let headers = [
                "Authorization": "Bearer "+Token,
                "Accept": "application/json",
                "Content-Type": "multipart/form-data"
            ]
            
            Alamofire.upload(multipartFormData: { multipartData in
                
                
                 
                for (key,value) in params {
                    multipartData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                multipartData.append(imageData, withName: "file", fileName: "file", mimeType: "image/jpg")
            }, to: BASE_URL.appending(strURL), method: .post, headers: headers) { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        switch(response.result) {

                        case .success(_):
                            if let data = response.data
                            {
                                print(JSON(data).dictionaryObject!)
                              
                               
                                if let dataDictionary = JSON(data).dictionaryObject
                                {
                                    success(dataDictionary as NSDictionary)
                                }
                                if let dataArray = JSON(data).arrayObject
                                {
                                    success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                                }
                            }
                            break

                        case .failure(_):
                            
                            failure(response.error.debugDescription )
                            break
                        }
                    }
                case .failure(let error):
                    failure(error.localizedDescription)
                }
            }

    }
    }
    
    class  func performApiCallWithJsonBody<T: Codable>(Token:String,strURL:String, expectedReturnType: T.Type, params: [String:Any], method: HTTPMethod, success: @escaping (_ response:T) -> (), failure: @escaping (_ str: String) -> ()) {
       
        
        print(BASE_URL.appending(strURL))
            print(params)
       
        do
        {
            // json format
            let body = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

            let postString = NSString(data: body, encoding: String.Encoding.utf8.rawValue)

            print("Post Data -> \(String(describing: postString))")

        }
        catch let error as NSError
        {
            print(error)
        }
        let headers = [
            "Authorization": "Bearer "+Token,
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
        ]
        Alamofire.request(BASE_URL.appending(strURL), method: method, parameters: params ,headers: headers)
            .responseData { response in
                    switch response.result {
                    case .success:
                        let httpCode = response.response?.statusCode
                        switch httpCode {
                        case 201:
                            
                            do {
                                let decodedData = try JSONDecoder().decode(T.self, from: response.data!)
                                success(decodedData)
                                
                            }catch let error {
                                failure(error.localizedDescription)
                            }
                            
                        case 200:
                            

                            do {
                                
                                let decodedData = try JSONDecoder().decode(T.self, from: response.data!)
                                success(decodedData)
                            }catch let error {
                                failure(error.localizedDescription)
                            }
                        case 404:
                            failure("Not Found")
                        case 500:
                            failure("Internal Server Error")
                        case 409:
                            failure("Conflict")
                        default:
                            break
                        }
                    case .failure:
                        failure("Someting went wrong")
                    }
                    
                }
    }
    
    class func CalculatorRequestApi(Token:String,strURL:String, params:Parameters,is_loader_required:Bool, success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

            let headers = [
                "Content-Type":"application/json",
                "Authorization": "Bearer "+Token,
                "Accept": "application/json"
            ]
            

        print(BASE_URL.appending(strURL))
            print(params)
            Alamofire.request(BASE_URL.appending(strURL), method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseData { (response:DataResponse<Data>) in

            switch(response.result) {

            case .success(_):
                if let data = response.data
                {
                    print(JSON(data).dictionaryObject)
                  
                   
                    if let dataDictionary = JSON(data).dictionaryObject
                    {
                        success(dataDictionary as NSDictionary)
                    }
                    if let dataArray = JSON(data).arrayObject
                    {
                        success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                    }
                }
                break

            case .failure(_):
                
                failure(response.error.debugDescription )
                break
            }


        }
        }

        else
        {
          
            RappleActivityIndicatorView.stopAnimation()
            COMMON_ALERT.showAlert(msg: "Please check your internet")
        }
    }
    
    
    
    class func requestPostUrl(Token:String,strURL:String, params:[String:Any],is_loader_required:Bool, success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {
        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

            let headers = [
                "Authorization": "Bearer "+Token,
                "Accept": "application/json"
            ]

        print(BASE_URL.appending(strURL))
            print(params)
        Alamofire.request(BASE_URL.appending(strURL), method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseData { (response:DataResponse<Data>) in

            switch(response.result) {

            case .success(_):
                if let data = response.data
                {
                    print("in here")
                    print(data)
                    
                    if let dataDictionary = JSON(data).dictionaryObject
                    {
                        success(dataDictionary as NSDictionary)
                    }
                    if let dataArray = JSON(data).arrayObject
                    {
                        success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                    }
                }
                break

            case .failure(_):
                
                failure(response.error.debugDescription )
                break
            }


        }
        }

        else
        {
          
            RappleActivityIndicatorView.stopAnimation()
            COMMON_ALERT.showAlert(msg: "Please check your internet.")
        }
    }

    class func RequestWithTokenJsonWithParams(Token:String,strURL:String,is_loader_required:Bool, params:[String:Any], success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)
            print(Token)

        do
        {
            // json format
            let body = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

            let postString = NSString(data: body, encoding: String.Encoding.utf8.rawValue)

            print("Post Data -> \(String(describing: postString))")

        }
        catch let error as NSError
        {
            print(error)
        }

            let headers = [
                "Authorization": "Bearer "+Token,
                "Accept": "application/json",
                "Content-Type": "multipart/form-data"
            ]
            
            Alamofire.request(BASE_URL.appending(strURL), method: .get, parameters: params,headers: headers)
                .responseData { response in
                    print(response)
                    switch(response.result) {
                    case .success(_):
                        let httpCode = response.response?.statusCode
                        switch httpCode {
                        case 201:
                            if let data = response.data
                            {
                                
                                if let dataDictionary = JSON(data).dictionaryObject
                                {
                                    success(dataDictionary as NSDictionary)
                                }
                                if let dataArray = JSON(data).arrayObject
                                {
                                    success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                                }
                            }
                            break
                        case 200:
                            if let data = response.data
                            {
                                
                                if let dataDictionary = JSON(data).dictionaryObject
                                {
                                    success(dataDictionary as NSDictionary)
                                }
                                if let dataArray = JSON(data).arrayObject
                                {
                                    success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                                }
                            }
                            break
                        case 404:
                            failure("Not Found")
                        case 500:
                            failure("Internal Server Error")
                        case 409:
                            failure("Conflict")
                        default:
                            break

                        }
                       
                    case .failure(_):
                       
                        failure(response.error.debugDescription )
                        break
                    }
                }
        }

        else
        {
            RappleActivityIndicatorView.stopAnimation()

            COMMON_ALERT.showAlert(msg: "Please check your internet")
            return
        }
    }
    
    class func RequestWithTokenJson(Token:String,strURL:String,is_loader_required:Bool, params:[String:Any], success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)

        do
        {
            // json format
            let body = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

            let postString = NSString(data: body, encoding: String.Encoding.utf8.rawValue)

            print("Post Data -> \(String(describing: postString))")

        }
        catch let error as NSError
        {
            print(error)
        }

            let headers = [
                "Authorization": "Bearer "+Token
            ]
            Alamofire.request(BASE_URL.appending(strURL), method: .get, parameters: nil, encoding: JSONEncoding.default,headers: headers)
                .responseData { response in
                    print(response.response?.url)
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.data
                        {
                            
                            if let dataDictionary = JSON(data).dictionaryObject
                            {
                                success(dataDictionary as NSDictionary)
                            }
                            if let dataArray = JSON(data).arrayObject
                            {
                                success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                            }
                        }
                        break

                    case .failure(_):
                       
                        failure(response.error.debugDescription )
                        break
                    }
                }
        }

        else
        {
            RappleActivityIndicatorView.stopAnimation()

            COMMON_ALERT.showAlert(msg: "Please check your internet")
            return
        }
    }
    
    class func GetRequestWithoutToken(Token:String?,strURL:String,is_loader_required:Bool, params:[String:Any], success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)


            var headers = [String:String]()
            if Token != nil{
                headers = [
                    "Authorization": "Bearer "+Token!
                ]
            }
           
            Alamofire.request(BASE_URL.appending(strURL), method: .get, parameters: nil, encoding: JSONEncoding.default,headers: headers)
                .responseData { response in
                    switch(response.result) {
                    case .success(_):
                        if let data = response.data
                        {
                            if let dataDictionary = JSON(data).dictionaryObject
                            {
                                print(dataDictionary)
                                success(dataDictionary as NSDictionary)
                            }
                            if let dataArray = JSON(data).arrayObject
                            {
                                print(dataArray)
                                success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                            }
                        }
                        break

                    case .failure(_):
                       
                        failure(response.error.debugDescription )
                        break
                    }
                }
        }

        else
        {
            RappleActivityIndicatorView.stopAnimation()

            COMMON_ALERT.showAlert(msg: "Please check your internet")
            return
        }
    }
    class func requestPostUrlWithJSONDictionaryParameters(strURL:String,is_loader_required:Bool, params:[String:Any], success:@escaping (_ response:NSDictionary) -> (), failure:@escaping (String) -> ()) {

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)
            let headers: HTTPHeaders = [
                        "Content-Type":"application/json",
                        "Accept": "application/json"
                    ]
        do
        {
            // json format
            let body = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

            let postString = NSString(data: body, encoding: String.Encoding.utf8.rawValue)

            print("Post Data -> \(String(describing: postString))")

        }
        catch let error as NSError
        {
            print(error)
        }


        Alamofire.request(BASE_URL.appending(strURL), method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseData { (response:DataResponse<Data>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.data
                {
                    print(JSON(data))
                    if let dataDictionary = JSON(data).dictionaryObject
                    {
                        success(dataDictionary as NSDictionary)
                    }
                    if let dataArray = JSON(data).arrayObject
                    {
                        success(NSDictionary(dictionaryLiteral:  ("data",dataArray)))
                    }
                }
                break

            case .failure(_):
               
                failure(response.error.debugDescription )
                break
            }


        }
        }

        else
        {
            RappleActivityIndicatorView.stopAnimation()
            COMMON_ALERT.showAlert(msg: "Please check your internet")

            return
        }
    }

    
    
    class func GetSavedItemData(Token:String?,strURL:String,is_loader_required:Bool, params:[String:Any], success:@escaping (_ response:Data) -> (), failure:@escaping (String) -> ()) {

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

        print(BASE_URL.appending(strURL))
        print(params)


            var headers = [String:String]()
            if Token != nil{
                headers = [
                    "Authorization": "Bearer "+Token!
                ]
            }
           
            Alamofire.request(BASE_URL.appending(strURL), method: .get, parameters: nil, encoding: JSONEncoding.default,headers: headers)
                .responseData { response in
                    switch(response.result) {
                    case .success(_):
                        if let data = response.data
                        {
                            print(JSON(data))
                          success(data)
                        }
                        break

                    case .failure(_):
                       
                        failure(response.error.debugDescription )
                        break
                    }
                }
        }

        else
        {
            RappleActivityIndicatorView.stopAnimation()

            COMMON_ALERT.showAlert(msg: "Please check your internet")
            return
        }
    }
    
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
