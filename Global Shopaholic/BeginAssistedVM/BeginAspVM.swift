//
//  BeginAspVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
protocol BeginAspDelegate {
    func didGetAspView(response: NSDictionary)
    func failedToGetAspView(msg:String)
    func didGetSummary(response: NSDictionary)
    func DidFailedToGetSummary(msg: String)
    func didCreateASPRequestSuccessfully(response: NSDictionary)
    func DidFailedToCreateASPRequest(msg: String)
    func didSaveItemSuccessfully(response: NSDictionary)
    func didFailedToSaveItem(msg: String)
    func didSaveTillQuestion(response: NSDictionary)
    func didFailToSaveTillQuestion(msg: String)
    
}
struct BeginAspVM{
    var delegate: BeginAspDelegate?
    public func GetAspView(token: String)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        WebService.GetRequestWithoutToken(Token: token, strURL: ep.GetAspViewEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
            self.delegate?.didGetAspView(response: response)
            
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            self.delegate?.failedToGetAspView(msg: response["message"] as! String)

         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }
    }
    
    public func getsummary(token: String,SummaryData: ASPSummaryModel)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        let param: [String: Any] = ["url":SummaryData.itemUrl,"category":SummaryData.itemCategory,"name":SummaryData.itemName,"quantity":SummaryData.itemQuantity,"size":SummaryData.itemSize,"color":SummaryData.itemColor,"price":SummaryData.itemPrice,"shipping_amount":SummaryData.ShippingAmount!,"service":"normal","missing_item_action":SummaryData.missingItemAction!,"additional_info":SummaryData.missingItemDetail!]

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.GetAspSummaryEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didGetSummary(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.DidFailedToGetSummary(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
    
    
    
    public func CreateASPRequest(token: String,SummaryData: ASPSummaryModel,isCountinue: Bool)
    {
        RappleActivityIndicatorView.startAnimating()
        let ep = endpoints()
        let param: [String: Any]!
        if isCountinue{
             param = ["url":SummaryData.itemUrl,"category":SummaryData.itemCategory,"name":SummaryData.itemName,"quantity":SummaryData.itemQuantity,"size":SummaryData.itemSize,"color":SummaryData.itemColor,"price":SummaryData.itemPrice,"shipping_amount":SummaryData.ShippingAmount!,"service":"normal","missing_item_action":SummaryData.missingItemAction!,"additional_info":SummaryData.missingItemDetail!,"asp_request_id": SummaryData.aspID!]
        }
        else{
            param = ["url":SummaryData.itemUrl,"category":SummaryData.itemCategory,"name":SummaryData.itemName,"quantity":SummaryData.itemQuantity,"size":SummaryData.itemSize,"color":SummaryData.itemColor,"price":SummaryData.itemPrice,"shipping_amount":SummaryData.ShippingAmount!,"service":"normal","missing_item_action":SummaryData.missingItemAction!,"additional_info":SummaryData.missingItemDetail!] 
        }

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.CreateASPRequestEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didCreateASPRequestSuccessfully(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.DidFailedToCreateASPRequest(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
    
    public func saveTillItems(token: String,itemData: ASPSummaryModel,isContinue:Bool)
    {
        var param: [String: Any]
        let ep = endpoints()
        if isContinue
        {
           param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice,"asp_request_id":itemData.aspID!]
        }
        else{
            param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice]
        }
      

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.CreateASPRequestEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didSaveItemSuccessfully(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFailedToSaveItem(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
    public func saveTillQuestion(token: String,itemData: ASPSummaryModel,isContinue:Bool)
    {
        var param: [String: Any]
        let ep = endpoints()
        if isContinue
        {
            param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice,"shipping_amount":itemData.ShippingAmount!,"service":"normal","missing_item_action":itemData.missingItemAction!,"additional_info":itemData.missingItemDetail!,"asp_request_id": itemData.aspID!]
        }
        else{
            param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice,"shipping_amount":itemData.ShippingAmount!,"service":"normal","missing_item_action":itemData.missingItemAction!,"additional_info":itemData.missingItemDetail!]
        }
      

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.CreateASPRequestEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didSaveTillQuestion(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFailToSaveTillQuestion(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
    
    public func saveTillShipping(token: String,itemData: ASPSummaryModel,isContinue:Bool)
    {
        var param: [String: Any]
        let ep = endpoints()
        if isContinue
        {
           param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice,"shipping_amount":itemData.ShippingAmount!,"service":"normal","asp_request_id": itemData.aspID!]
        }
        else{
            param = ["url":itemData.itemUrl,"category":itemData.itemCategory,"name":itemData.itemName,"quantity":itemData.itemQuantity,"size":itemData.itemSize,"color":itemData.itemColor,"price":itemData.itemPrice,"shipping_amount":itemData.ShippingAmount!,"service":"normal"]
        }
      

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: ep.CreateASPRequestEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.didSaveItemSuccessfully(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didFailedToSaveItem(msg: response["message"] as! String)
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
}
