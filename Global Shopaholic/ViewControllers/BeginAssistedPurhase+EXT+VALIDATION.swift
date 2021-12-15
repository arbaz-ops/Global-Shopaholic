//
//  BeginAssistedPurhase+EXT+VALIDATION.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/22/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


extension BeginPurchaseVC{
    
     func itemsValidation(cell: AssistedItemCell!) -> Bool
     {
       
        if (cell.ItemLinkFIeld.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        if (cell.CategoryField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        if (cell.ItemNameField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
       
        if (cell.ItemQuantityField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        if (cell.ItemSizeField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        if (cell.ItemsColorField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        if (cell.ItemsPriceField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please fill complete form")
            return false
        }
        
        
        return true
    }
    
    
    func shippingValidation(cell: AssisterShippingCell) -> Bool
    {
        if (cell.ShippingChargesfield.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please enter Shipping charges")
            return false
        }
        if (cell.ServicesField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please select services field")
            return false
        }
        if (cell.PromoCodeField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please enter promo code")
            return false
        }
       
        if (cell.AmountField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please enter amount")
            return false
        }
        if (cell.PromoTypeField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please select promo code type")
            return false
        }
      shippingData = shippingDataModel(ShippingCharges: cell.ShippingChargesfield.text!, Service: cell.ServicesField.text!, promocode: cell.ShippingChargesfield.text!, Amount: cell.AmountField.text!, promoCodeType: cell.PromoTypeField.text!)
        return true
    }
    func missingitemAction(cell:AssistedQuestionCell) -> Bool
    {
        if (cell.QuestionField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please Select Question")
            return false
        }
        if (cell.DetailField.text!.isEmpty)
        {
            COMMON_ALERT.showAlert(msg: "Please enter Detail")
            return false
        }
        
        var missingItemOpt = ""
        if cell.QuestionField.text! == "Cancel this item only"
        {
            missingItemOpt = missingItemsKeys[0]
        }
        else if cell.QuestionField.text! == ""
        {
            missingItemOpt = missingItemsKeys[1]
        }
        else{
            missingItemOpt = missingItemsKeys[2]
        }
        missingData = missingItemAction(missingItemOpt: missingItemOpt, detail: cell.DetailField.text!)
//        DataForSummary = ASPCombineData(itemDataArray: itemsDatasource, shippingData: shippingData, QuestionData: missingData)
//        CreateRequest()
        return true
    }
    
   
    func CreateRequest()
    {
        if isPurchaseCountinueMode
        {
            ASPSummaryData.aspID = (ContinueItemData!["asp_id"] as! String)
        }
//        else{
//            ASPSummaryData = ASPSummaryModel(ShippingAmount: shippingData.Amount, selectedService: shippingData.Service, promocodeName: shippingData.promocode, promocodeType: shippingData.promoCodeType, promocodeAmount: shippingData.Amount, missingItemAction: missingData.missingItemOpt, missingItemDetail: missingData.detail)
//        }
//
//        itemsDatasource.forEach { val in
//            ASPSummaryData.itemUrl.append(val.itemLink)
//            ASPSummaryData.itemCategory.append(val.itemCategory)
//            ASPSummaryData.itemName.append(val.itemName)
//            ASPSummaryData.itemQuantity.append(val.itemQuantity)
//            ASPSummaryData.itemSize.append(val.itemSize)
//            ASPSummaryData.itemColor.append(val.itemColor)
//            ASPSummaryData.itemPrice.append(val.itemPrice)
//        }
        print(ASPSummaryData)
        print(ASPSummaryData.aspID)
        var ASPVM = BeginAspVM()
        ASPVM.delegate = self
        ASPVM.getsummary(token: user_data.token!, SummaryData: ASPSummaryData)
    }
    
    
}
