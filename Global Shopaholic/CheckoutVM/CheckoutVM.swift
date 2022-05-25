//
//  CheckoutVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/2/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
import Alamofire
import SwiftyJSON

protocol checkoutDelegate{
    func didGetCheckoutSummary(response: NSDictionary)
    func didFailedToGetSummary(msg: String)
    func didBankPaySuccessFully(response: NSDictionary)
    func DidBankPayFailed(msg: String)
    func didCCpaySuccessfully(response: NSDictionary)
    func didFailedToPayViaCC(msg:String)
    
}
struct CheckoutVM{
    var delegate: checkoutDelegate?
    
    func getCheckoutSummaryOutgoing(token: String, requestId: String,courier_service: String,payment_gateway: String,is_wallet: String ,success: @escaping (_ response: NSDictionary ) -> Void, failure: @escaping (_ :String) -> Void) {
        let ep = endpoints()
        let param: [String: Any] = [
            "request_id" : requestId,
            "courier_service": courier_service,
            "payment_gateway": payment_gateway,
            "isWallet": is_wallet
        ]
        var getCheckoutSummaryOutgoing = ep.GetCheckoutSummaryOutgoing
        getCheckoutSummaryOutgoing = getCheckoutSummaryOutgoing.replacingOccurrences(of: "{request_id}", with: "\(requestId)")
        RappleActivityIndicatorView.startAnimating()
        WebService.RequestWithTokenJsonWithParams(Token: token, strURL: getCheckoutSummaryOutgoing, is_loader_required: false, params: param) { response in
            if (response["success"] as! Bool) == true
            {
                
                RappleActivityIndicatorView.stopAnimation()
                success(response)
//                self.delegate?.didGetCheckoutSummary(response: response)
            }
            else{
                failure(response["message"] as! String)
                RappleActivityIndicatorView.stopAnimation()

            }
        } failure: { error in
            print(error)
            
            RappleActivityIndicatorView.stopAnimation()
            failure("Something went wrong.")
        }

    }
    
    func getCheckOutSummary(token: String,Request: OrderSummaryRequest)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        let param: [String: Any] = ["asp_request_id":Request.aspRequestID,"payment_method":Request.paymentMethod,"is_wallet":Request.isWallet]

        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrl(Token: token, strURL: ep.CheckoutSummaryEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                print(response)
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didGetCheckoutSummary(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFailedToGetSummary(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    func paynowViaBank(token:String, request: bankPaymentModel)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        let param: [String: Any] = ["asp_request_id":request.aspID!,"payment_method":request.paymenMethod!,"is_wallet":request.isWallet!,"bank_name":request.bankName!,"deposit_amount":request.depositAmount!,"bank_transaction_id":request.banktransactionID!]
        let timestamp = NSDate().timeIntervalSince1970

        let imageData = request.bankRecieptImage.jpegData(compressionQuality: 0.50)
        let headers = [
            "Authorization": "Bearer "+token]
        Alamofire.upload(multipartFormData:
            {
                (multipartFormData) in
                multipartFormData.append(imageData!, withName: "bank_receipt_copy", fileName: "\(timestamp).jpg", mimeType: "\(timestamp)/jpg")
                for (key, value) in param
                {
                    multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to:"\(BASE_URL)\(ep.BankCheckoutEP)",headers:headers)
        { (result) in
            switch result {
        
            case .success(let upload,_,_ ):
               

                upload.uploadProgress(closure: { (progress) in
                })
                upload.responseData
                { response in
                    print(response.result)
                    RappleActivityIndicatorView.stopAnimation()
                    if response.result.value != nil
                    {
                        if let data = response.data
                        {
                            print(JSON(data))
                            if let dataDictionary = JSON(data).dictionaryObject
                            {
                                self.delegate?.didBankPaySuccessFully(response: dataDictionary as NSDictionary)
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
    
    
    func paynowViaCC(token:String, request: CreditCardPaymentModel)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        let param: [String: Any] = ["asp_request_id":request.aspID!,"payment_method":request.paymenMethod!,"name":request.name!,"is_wallet":request.isWallet!,"credit_card_number":request.cardNumber!,"expiry":request.expiry!,"cvc":request.cvc!]

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.checkOutViaCCEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didCCpaySuccessfully(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFailedToPayViaCC(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
}
