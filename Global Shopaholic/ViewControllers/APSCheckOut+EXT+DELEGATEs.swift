//
//  APSCheckOut+EXT+DELEGATEs.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/2/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


extension ASPCheckOut: checkoutDelegate{
    func didCCpaySuccessfully(response: NSDictionary) {
        if (response["success"] as! Bool) == true
        {
            COMMON_ALERT.showAlert(msg: response["message"] as! String)
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            COMMON_ALERT.showAlert(msg: response["message"] as! String)
        }
    }
    
    func didFailedToPayViaCC(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didBankPaySuccessFully(response: NSDictionary) {
        print(response)
        if (response["success"] as! Bool) == true
        {
            COMMON_ALERT.showAlert(msg: response["message"] as! String)
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            COMMON_ALERT.showAlert(msg: response["message"] as! String)
        }
    }
    
    func DidBankPayFailed(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didGetCheckoutSummary(response: NSDictionary) {
        let data = (response["data"] as! NSDictionary)
        self.summaryData = data
        self.updateSummary()
      
    }
    
    func didFailedToGetSummary(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    func updateSummary()
    {
        self.itemCostLbl.text = (summaryData["merchandise_cost"] as! NSNumber).stringValue
        self.shippingChargesLbl.text = (summaryData["shipping_charges"] as! NSNumber).stringValue
        self.processingChargesLbl.text = (summaryData["processing_charges"] as! NSNumber).stringValue
        self.bankChargesLbl.text = (summaryData["bank_charges"] as! NSNumber).stringValue
        self.promoCodeLbl.text = (summaryData["promocode_discount"] as! NSNumber).stringValue
        self.totalLbl.text = (summaryData["total"] as! NSNumber).stringValue
    }
    
}
