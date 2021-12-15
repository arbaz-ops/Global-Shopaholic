//
//  BankDepositeVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 5/19/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
import Alamofire
import SwiftyJSON
protocol BankDepositeDelegate {
    
    func didBankDepositeSuccessfully(response:NSDictionary)
    func didRequestfailedToDeposite(errorResponse: BankDepositeResponse)
    
}



struct BankDepositeVM
{
    var delegate: BankDepositeDelegate?
    
    func BankDeposite(token: String,cardRequest: BankDepositeRequest)
    {
        let validationResult = BankTransferValidation().Validation(Request: cardRequest)
        if validationResult.success{
            
         self.depositeAmount(cardRequest: cardRequest, token: token)
        }
        else{
         self.delegate?.didRequestfailedToDeposite(errorResponse: BankDepositeResponse(message: validationResult.error))
        }

    }
    private func depositeAmount(cardRequest:BankDepositeRequest,token: String)
        {
        let param:[String:Any] = ["transaction_id":cardRequest.transactionId!,"transaction_amount":cardRequest.transactionAmount!]
        //let EP = endpoints()
        let timestamp = NSDate().timeIntervalSince1970

        let imageData = cardRequest.receiptImage.jpegData(compressionQuality: 0.50)
        let headers = [
            "Authorization": "Bearer "+token]
        Alamofire.upload(multipartFormData:
            {
                (multipartFormData) in
                multipartFormData.append(imageData!, withName: "receipt_image", fileName: "\(timestamp).jpg", mimeType: "\(timestamp)/jpg")
                for (key, value) in param
                {
                    multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
        }, to:"\(BASE_URL)api/wallet/deposit/bank_transfer",headers:headers)
        { (result) in
            switch result {
        
            case .success(let upload,_,_ ):
                upload.uploadProgress(closure: { (progress) in
                })
                upload.responseData
                { response in
                    print(response.result)
                    
                    if response.result.value != nil
                    {
                        if let data = response.data
                        {
                            print(JSON(data))
                            if let dataDictionary = JSON(data).dictionaryObject
                            {
                                self.delegate?.didBankDepositeSuccessfully(response: dataDictionary as NSDictionary)
                            }
                        }
                        
                    }
                }
            case .failure(let encodingError):
                print(encodingError.localizedDescription)
                RappleActivityIndicatorView.stopAnimation()
                break
            }
        }
    }
    
}
