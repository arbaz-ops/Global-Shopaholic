//
//  BeginPurchaseVC+EXT+TableVIew.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension BeginPurchaseVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch CurrentStep {
        case .Item:
            return NumberOfitems + 1
        case .Shipping:
            return 1
            
        case .Questions:
            return 1
            
        case .Review:
            if section == 0
            {
                return NumberOfitems
            }
            else{
                return 1
            }
        default:
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == NumberOfitems // Last Index Goes HERE
        {
            
            switch CurrentStep {
            case .Item:
                let nib1 = UINib(nibName: "AddAnotherBtnCell", bundle: nil)
                
                tableView.register(nib1, forCellReuseIdentifier: "AddAnotherBtnCell")
                
                let headerCell = tableView.dequeueReusableCell(withIdentifier: "AddAnotherBtnCell") as! AddAnotherBtnCell
                headerCell.saveBtn.addTarget(self, action: #selector(itemsSaveBtn(sender:)), for: .touchUpInside)
                
                headerCell.addCellAction.addTarget(self, action: #selector(addMoreItems(sender:)), for: .touchUpInside)
                headerCell.NextBtn.addTarget(self, action: #selector(itemNextBtnAction(sender:)), for: .touchUpInside)
                return headerCell
            default:
                break
            }
            
        }              
        let cell = currentStepFlow(index: indexPath)
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let nib1 = UINib(nibName: "HeaderCell", bundle: nil)
        
        tableView.register(nib1, forCellReuseIdentifier: "HeaderCell")
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        switch CurrentStep {
        case .Item:
            headerCell.headerLbl.text = "Item(s)"
        case .Shipping:
            headerCell.headerLbl.text = "Shipping"
            
        case .Questions:
            headerCell.headerLbl.text = "Question"
            
        case .Review:
            if section == 0
            {
                headerCell.headerLbl.text = "Review"
            }
            else{
                headerCell.headerLbl.text = "Summary"
                
            }
        default:
            break
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    
    
    
    
    
    private func currentStepFlow(index: IndexPath) -> UITableViewCell?
    {
        switch CurrentStep {
        case .Item:
            let nib1 = UINib(nibName: "AssistedItemCell", bundle: nil)
            
            tableView.register(nib1, forCellReuseIdentifier: "AssistedItemCell")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssistedItemCell") as! AssistedItemCell
            
            
            cell.NextBtn.addTarget(self, action: #selector(next(sender:)), for: .touchUpInside)
            cell.CategoryField.optionArray = categoriesTitles
            cell.ItemNoLbl.text = "Item #\(index.row + 1)"
            

                var categoryKey = ""

                if itemsDatasource.count == NumberOfitems
                {cell.ItemLinkFIeld.text = (itemsDatasource[index.row].itemLink)
                    for candidate in (categoryData as! [[String:Any]])
                    {
                        if (candidate["title"] as! String) == itemsDatasource[index.row].itemCategory || (candidate["key"] as! String) == itemsDatasource[index.row].itemCategory
                        {
                            cell.CategoryField.text = (candidate["title"] as! String)
                        }

                    }
                    cell.ItemNameField.text = (itemsDatasource[index.row].itemName)
                    cell.ItemQuantityField.text = (itemsDatasource[index.row].itemQuantity)
                    cell.ItemSizeField.text = (itemsDatasource[index.row].itemSize)
                    cell.ItemsColorField.text = (itemsDatasource[index.row].itemColor)
                    cell.ItemsPriceField.text = (itemsDatasource[index.row].itemPrice)}

            
            
            return cell
        case .Shipping:
            let nib1 = UINib(nibName: "AssisterShippingCell", bundle: nil)
            
            tableView.register(nib1, forCellReuseIdentifier: "AssisterShippingCell")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssisterShippingCell") as! AssisterShippingCell
            
            cell.ServicesField.optionArray = serviceType
            cell.PromoTypeField.optionArray = promoType
            if shippingData != nil{
                cell.ShippingChargesfield.text = shippingData.ShippingCharges
                cell.ServicesField.text = shippingData.Service
                cell.PromoCodeField.text = shippingData.promocode
                cell.AmountField.text = shippingData.Amount
                cell.PromoTypeField.text = shippingData.promoCodeType
            }
            cell.NextBtn.addTarget(self, action: #selector(itemNextBtnAction(sender:)), for: .touchUpInside)
            cell.SaveField.addTarget(self, action: #selector(itemsSaveBtn(sender:)), for: .touchUpInside)
            cell.PreviousBtn.addTarget(self, action: #selector(previous(sender:)), for: .touchUpInside)
            return cell
            
        case .Questions:
            let nib1 = UINib(nibName: "AssistedQuestionCell", bundle: nil)
            
            tableView.register(nib1, forCellReuseIdentifier: "AssistedQuestionCell")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssistedQuestionCell") as! AssistedQuestionCell
            
            cell.NextBtn.addTarget(self, action: #selector(itemNextBtnAction(sender:)), for: .touchUpInside)
            cell.SaveBtn.addTarget(self, action: #selector(itemsSaveBtn(sender:)), for: .touchUpInside)
            cell.QuestionField.optionArray = QuestionsForMissingItems
            cell.PreviousBtn.addTarget(self, action: #selector(previous(sender:)), for: .touchUpInside)
            if missingData != nil{
                cell.QuestionField.text = missingData.missingItemOpt
                cell.DetailField.text = missingData.detail
            }
            return cell
            
        case .Review:
            
            if index.section == 1
            {
                let nib1 = UINib(nibName: "SummaryCell", bundle: nil)
                
                tableView.register(nib1, forCellReuseIdentifier: "SummaryCell")
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell") as! SummaryCell
                if SummaryData != nil{
                    cell.totalItemCostLbl.text = (SummaryData["total"] as! NSNumber).stringValue
                    cell.shippingChargesLbl.text = (SummaryData["shipping_charges"] as! NSNumber).stringValue
                    cell.processingChargesLbl.text = (SummaryData["processing_charges"] as! NSNumber).stringValue
                    cell.finalTotalLbl.text = (SummaryData["total_merchandise_cost"] as! NSNumber).stringValue
                    cell.promoCodeLbl.text = shippingData.Amount
                    cell.payBtn.addTarget(self, action: #selector(PayBtnAction(sender:)), for: .touchUpInside)
                    return cell
                }
                return cell
            }
            else{
                
                let nib1 = UINib(nibName: "AssistedReviewCell", bundle: nil)
                
                tableView.register(nib1, forCellReuseIdentifier: "AssistedReviewCell")
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssistedReviewCell") as! AssistedReviewCell
                cell.itmNoLbl.text = "#\(index.row + 1)"
                cell.categoryLbl.text = itemsDatasource[index.row].itemCategory
                cell.nameLbl.text = itemsDatasource[index.row].itemName
                cell.colorLbl.text = itemsDatasource[index.row].itemColor
                cell.sizeLbl.text = itemsDatasource[index.row].itemSize
                cell.qtyLbl.text = itemsDatasource[index.row].itemQuantity
                cell.priceLbl.text = itemsDatasource[index.row].itemPrice
                cell.promoCodeLbl.text = shippingData.Amount
                let promo = Int(shippingData.Amount!)
                let Price = Int(itemsDatasource[index.row].itemPrice)
                let discount = Price! - promo!
                cell.totalLbl.text = "\(discount)"
                
                return cell
            }
        default:
            break
        }
        return nil
    }
    @objc func PayBtnAction(sender: UIButton)
    {
        let viewController = (self.storyboard?.instantiateViewController(withIdentifier: "ASPCheckOut"))! as! ASPCheckOut
        //        viewController.summaryData = self.SummaryData
        viewController.aspRequestId = self.aspRequestId
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func addMoreItems(sender: UIButton)
    {
        NumberOfitems += 1
        addedItems = false
        itemsDatasource.append(itemsData())
        print(itemsDatasource.count)
        self.animateBuddy()
    }
    @objc func previous(sender: UIButton)
    {
        print("idher")
        switch CurrentStep {
        case .Item:
            break
        case .Shipping:
            CurrentStep = Steps.Item
            stepIndicatorView.currentStep = 0
            self.animateBuddy()
            
            
        case .Questions:
            CurrentStep = Steps.Shipping
            stepIndicatorView.currentStep = 1
            self.animateBuddy()
            
            
        case .Review:
            CurrentStep = Steps.Questions
            stepIndicatorView.currentStep = 2
            self.animateBuddy()
            
            
        default:
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch CurrentStep {
        case .Review:
            return 2
        default:
            return 1
        }
    }
   
    @objc func itemNextBtnAction(sender: UIButton)
    {
        
        
        switch CurrentStep
        {
        case .Item:
           ItemSaveOrNext(save: false)
        case .Shipping:
            shippingSaveOrNext(save: false)
        case .Questions:
            questionSaveOrNext(save: false)
        case .Review:
            break
        default:
            break
        }
        
        
     
    }
    
    @objc func itemsSaveBtn(sender: UIButton)
    {
        
        switch CurrentStep {
        case .Item:
            ItemSaveOrNext(save: true)
        case .Shipping:
            shippingSaveOrNext(save: true)
        case .Questions:
            questionSaveOrNext(save: true)
        default:
            break
        }
    }
    @objc func next(sender: UIButton)
    {
        //        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        //         let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        //        switch CurrentStep {
        //        case .Item:
        //            return
        ////            let indexPath = IndexPath(row: indexPath!.row, section: indexPath!.section)
        ////            let cell:AssistedItemCell = tableView.cellForRow(at: indexPath) as! AssistedItemCell
        ////
        ////            let validation = itemsValidation(cell: cell)
        ////            if validation{
        ////            CurrentStep = Steps.Shipping
        ////            stepIndicatorView.currentStep = 1
        ////            self.animateBuddy()
        ////            }
        ////            else
        ////            {
        ////                return
        ////            }
        //        case .Shipping:
        //
        //            let indexPath = IndexPath(row: indexPath!.row, section: indexPath!.section)
        //            let cell:AssisterShippingCell = tableView.cellForRow(at: indexPath) as! AssisterShippingCell
        //            let validation = shippingValidation(cell: cell)
        //            if validation{
        //            CurrentStep = Steps.Questions
        //            stepIndicatorView.currentStep = 2
        //            self.animateBuddy()
        //            }
        //            else{
        //                return
        //            }
        //        case .Questions:
        //            let indexPath = IndexPath(row: indexPath!.row, section: indexPath!.section)
        //            let cell:AssistedQuestionCell = tableView.cellForRow(at: indexPath) as! AssistedQuestionCell
        //            let validation = missingitemAction(cell: cell)
        //            if validation{
        //            CurrentStep = Steps.Review
        //            stepIndicatorView.currentStep = 3
        //            self.animateBuddy()
        //            }
        //            else
        //            {
        //                return
        //            }
        //        case .Review:
        //            break
        //
        //        default:
        //            break
        //        }
    }
    func animateBuddy()
    {
        UIView.transition(with: tableView,
                          duration: 0.45,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
    
    
    
    private func questionSaveOrNext(save:Bool)
    {
    
        var indexPath: IndexPath!
        var categoryKey: String!
        var cell: AssistedQuestionCell!
        indexPath = IndexPath(row: 0, section: 0)
        cell = (tableView.cellForRow(at: indexPath) as! AssistedQuestionCell)
        let validation = missingitemAction(cell: cell)
        if validation{
            ASPSummaryData = ASPSummaryModel(itemUrl: ASPSummaryData.itemUrl, itemCategory: ASPSummaryData.itemCategory, itemName: ASPSummaryData.itemName, itemQuantity: ASPSummaryData.itemQuantity, itemSize: ASPSummaryData.itemSize, itemColor: ASPSummaryData.itemColor, itemPrice: ASPSummaryData.itemPrice, ShippingAmount: shippingData.Amount, selectedService: shippingData.Service, promocodeName: shippingData.promocode, promocodeType: shippingData.promoCodeType, promocodeAmount: shippingData.Amount,missingItemAction:missingData.missingItemOpt,missingItemDetail:missingData.detail)
            if save{
                var isContinue = false
        
                var vm = BeginAspVM()
                vm.delegate = self
                if isPurchaseCountinueMode{
                    ASPSummaryData.aspID = (ContinueItemData!["asp_id"] as! String)
                    isContinue = true
                }
                print(ASPSummaryData)
                vm.saveTillQuestion(token: user_data.token, itemData: ASPSummaryData,isContinue: isContinue)
            }
            else
            {
                CreateRequest()
                CurrentStep = Steps.Review
                stepIndicatorView.currentStep = 3
                self.animateBuddy()
            }
        }
    }
    private func shippingSaveOrNext(save:Bool)
    {
        
            var indexPath: IndexPath!
            var categoryKey: String!
            var cell: AssisterShippingCell!
        indexPath = IndexPath(row: 0, section: 0)
        cell = (tableView.cellForRow(at: indexPath) as! AssisterShippingCell)
        

            let validation = shippingValidation(cell: cell)
            if validation{
                
                    ASPSummaryData = ASPSummaryModel(itemUrl: ASPSummaryData.itemUrl, itemCategory: ASPSummaryData.itemCategory, itemName: ASPSummaryData.itemName, itemQuantity: ASPSummaryData.itemQuantity, itemSize: ASPSummaryData.itemSize, itemColor: ASPSummaryData.itemColor, itemPrice: ASPSummaryData.itemPrice, ShippingAmount: shippingData.Amount, selectedService: shippingData.Service, promocodeName: shippingData.promocode, promocodeType: shippingData.promoCodeType, promocodeAmount: shippingData.Amount)
                   
                if save{
                    var isContinue = false
            
                    var vm = BeginAspVM()
                    vm.delegate = self
                    if isPurchaseCountinueMode{
                        ASPSummaryData.aspID = (ContinueItemData!["asp_id"] as! String)
                        isContinue = true
                    }
                    print(ASPSummaryData)
                    vm.saveTillShipping(token: user_data.token, itemData: ASPSummaryData,isContinue: isContinue)
                }
                else{
            CurrentStep = Steps.Questions
            stepIndicatorView.currentStep = 2
            self.animateBuddy()
                }
            }
            else{
                return
            }
        print(cell.ShippingChargesfield.text!)
        print(itemsDatasource)
    }
    
    private func ItemSaveOrNext(save: Bool)
    {
            var indexPath: IndexPath!
            var categoryKey: String!
            var cell: AssistedItemCell!
            for index in (0...(NumberOfitems - 1)) {
                indexPath = IndexPath(row: index, section: 0)
                cell = (tableView.cellForRow(at: indexPath) as! AssistedItemCell)
                let validation = itemsValidation(cell: cell)
                if validation{
                    for candidate in (categoryData as! [[String:Any]])
                    {
                        if (candidate["title"] as! String) == cell.CategoryField.text! || (candidate["key"] as! String) == cell.CategoryField.text!
                        {
                            categoryKey = (candidate["key"] as! String)
                        }
                        itemsDatasource[index] = itemsData(itemLink: cell.ItemLinkFIeld.text!, itemCategory: categoryKey, itemName: cell.ItemNameField.text!, itemQuantity: cell.ItemQuantityField.text!, itemSize: cell.ItemSizeField.text!, itemColor: cell.ItemsColorField.text!, itemPrice: cell.ItemsPriceField.text!)
                        
                    }
                }
                else{
                    return
                }
            }
        ASPSummaryData = ASPSummaryModel()
        if addedItems == false{
        itemsDatasource.forEach { val in
            ASPSummaryData.itemUrl.append(val.itemLink)
            for candidate in (categoryData as! [[String:Any]])
            {
                if (candidate["title"] as! String) == val.itemCategory
                {
                    categoryKey = (candidate["key"] as! String)
                }
            }
            ASPSummaryData.itemCategory.append(categoryKey)
            ASPSummaryData.itemName.append(val.itemName)
            ASPSummaryData.itemQuantity.append(val.itemQuantity)
            ASPSummaryData.itemSize.append(val.itemSize)
            ASPSummaryData.itemColor.append(val.itemColor)
            ASPSummaryData.itemPrice.append(val.itemPrice)
        }
            addedItems = true
        }
        
        if save{
            var isContinue = false
    
            var vm = BeginAspVM()
            vm.delegate = self
            if isPurchaseCountinueMode{
                ASPSummaryData.aspID = (ContinueItemData!["asp_id"] as! String)
                isContinue = true
            }
            vm.saveTillItems(token: user_data.token, itemData: ASPSummaryData,isContinue: isContinue)
        }
        else{
            CurrentStep = Steps.Shipping
            stepIndicatorView.currentStep = 1
            self.animateBuddy()
        }
    }
    
}
