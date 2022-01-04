//
//  AssistedPurchaseVC+EXT+Tableview.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/28/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension AssistedPurchaseVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentSelection {
        case .Active:
            if ProcessingData != nil{
                return processingFilterdData.count
            }
            return 0
        case .Saved:
            if savedItemData != nil{
                return savedFilteredData.count
            }
            return 0
        case .Cancelled:
            if CancelledData != nil{
                return cancelledFilteredData.count
            }
            return 0
        default:
            return 0
        }
       
    }
    
    
    
//    ["category": ["Automotive"], "name": ["123"], "price": ["123"], "url": ["123"], "quantity": ["123"], "color": ["123"], "service": "normal", "missing_item_action": "cancel_item", "size": ["123"], "shipping_amount": "123", "additional_info": "123"]
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch currentSelection {
        case .Active:
            let nib1 = UINib(nibName: "activeTableViewCell", bundle: nil)
                                 
          tableView.register(nib1, forCellReuseIdentifier: "activeTableViewCell")
                                 
          let cell = tableView.dequeueReusableCell(withIdentifier: "activeTableViewCell") as! activeTableViewCell
            let data = processingFilterdData[indexPath.row] as! NSDictionary
            cell.APID.text = (data["asp_id"] as! String)
    
            cell.DateLbl.text = cell.getFormattedDate(format: (data["created_at"] as! String))
            cell.orderReviewBtn.addTarget(self, action:#selector(self.ReviewAction), for: .touchUpInside)
            
            let itemData = (data["items"] as! NSArray)
            cell.TotalItemLbl.text = "\(itemData.count)"
            let status = (data["status"] as! String)
            if status == "processing"
            {
                cell.stepIndicatorView.currentStep = 0
            }
            else if status == "payment_done"
            {
                cell.stepIndicatorView.currentStep = 1
            }
            else if status == "on_hold" {
                cell.stepIndicatorView.currentStep = 2
            }
            
            return cell
        case .Saved:
            let nib1 = UINib(nibName: "SavedItemCell", bundle: nil)
                                 
          tableView.register(nib1, forCellReuseIdentifier: "SavedItemCell")
                                 
            let data = savedFilteredData[indexPath.row] as! NSDictionary
            
          let cell = tableView.dequeueReusableCell(withIdentifier: "SavedItemCell") as! SavedItemCell
          cell.DateLbl.text = cell.getFormattedDate(format: (data["created_at"] as! String))
          cell.IdLbl.text = (data["asp_id"] as! String)
            let itemData = (data["items"] as! NSArray)
          cell.TotalLbl.text = String(itemData.count)
            cell.continueBtn.addTarget(self, action: #selector(continuePurchaseAction(sender:)), for: .touchUpInside)
            cell.reviewBtn.addTarget(self, action:#selector(self.ReviewAction), for: .touchUpInside)
            return cell
        case .Cancelled:
            let nib1 = UINib(nibName: "CancelledCell", bundle: nil)
            tableView.register(nib1, forCellReuseIdentifier: "CancelledCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancelledCell") as! CancelledCell
            let data = cancelledFilteredData[indexPath.row] as! NSDictionary
            cell.aspIdLbl.text = (data["asp_id"] as! String)
            cell.dateLbl.text = cell.getFormattedDate(format: (data["created_at"] as! String))
            let itemData = (data["items"] as! NSArray)
            cell.totalLbl.text = String(itemData.count)
            cell.reviewBtn.addTarget(self, action:#selector(self.ReviewAction), for: .touchUpInside)
            return cell
        default:
            let nib1 = UINib(nibName: "SavedItemCell", bundle: nil)
          
          tableView.register(nib1, forCellReuseIdentifier: "SavedItemCell")
//
         let cell = tableView.dequeueReusableCell(withIdentifier: "SavedItemCell") as! SavedItemCell
            
//          cell.DateLbl.text = SavedItems.data.list.saved![indexPath.row].createdAt
//          cell.IdLbl.text = SavedItems.data.list.saved![indexPath.row].aspID
//          cell.TotalLbl.text = "\(SavedItems.data.list.saved![indexPath.row].items[0].price)"
            return cell
        }
        
      
    }
    @objc func ReviewAction(sender: UIButton)
    {
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "itemReviewVC") as! itemReviewVC
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        
        var itemData: NSDictionary?
        switch currentSelection {
        case .Active:
           
            itemData = (processingFilterdData[indexPath!.row] as! NSDictionary)
        
           
        case .Saved:
            if savedItemData != nil{
                itemData = (savedFilteredData[indexPath!.row] as! NSDictionary)
            }
        
        case .Cancelled:
            if CancelledData != nil{
                itemData = (cancelledFilteredData[indexPath!.row] as! NSDictionary)
            }
            
        default:
          return
        }

       
     
        vc.itemData = itemData
        
        self.present(vc, animated: true, completion: nil)
    }
    @objc func continuePurchaseAction(sender: UIButton)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
         let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let continueData = savedItemData[indexPath!.row] as! NSDictionary
        print(continueData)
        let vc = self.storyboard?.instantiateViewController(identifier: "BeginPurchaseVC") as! BeginPurchaseVC
        vc.ContinueItemData = continueData
        vc.isPurchaseCountinueMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func animateBuddy()
    {
      UIView.transition(with: tableView,
                        duration: 0.45,
                        options: .transitionCrossDissolve,
                        animations: { self.tableView.reloadData() })
    }
}
