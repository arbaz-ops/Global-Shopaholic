//
//  WalletVC+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import UIKit





extension WalletVC: UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if historyData.count != 0
        {
            return historyData.count
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib1 = UINib(nibName: "WalletHistoryCell", bundle: nil)
                               
        tableView.register(nib1, forCellReuseIdentifier: "WalletHistoryCell")
                               
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletHistoryCell") as! WalletHistoryCell
        let currentRowData = historyData[indexPath.row] as! NSDictionary
        let type = currentRowData["type"] as! String
        //MMM dd,yyyy
      
     
        if type == "deposit" || type == "refunded"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().depoiteHistoryTagColor)")
            
            cell.typeLbl.text = "Deposit"
            
        }
        if type == "withdrawal"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().withdrawalHistoryTagColor)")
            
            cell.typeLbl.text = "withdrawal"
        }
        if type == "offline_payment"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().spentHistoryTagColor)")
            
            cell.typeLbl.text = "spent"
        }
        if type == "return_shipment"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().deductedHistoryTagColor)")
            
            cell.typeLbl.text = "Deducted"
        }
        if type == "prepared_request_cancelled_deduction"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().deductedHistoryTagColor)")
            
            cell.typeLbl.text = "Deducted"
        }
        if type == "promo_code_deposite"
        {
            cell.BadgeView.backgroundColor = hexStringToUIColor(hex: "\(appColors.init().depoiteHistoryTagColor)")
            
            cell.typeLbl.text = "promo_code"
        }
        
        if let amount = currentRowData["amount"] as? String {
                
            cell.AmountLbl.text = (amount)
            }
        else{
            cell.AmountLbl.text = ""
        }
        
        //cell.DateLbl.text = (currentRowData["created_at"] as! String)
        cell.DateLbl.text = self.getFormattedDate(format: (currentRowData["created_at"] as! String))
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = hexStringToUIColor(hex: "EFF7F5")
        }
        else{
            cell.backgroundColor = .white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
             let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
         footerView.backgroundColor = .clear
         
             return footerView
         }

         func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
             return 5
         }
}







extension WalletVC {
   func getFormattedDate(format: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "MMM dd,yyyy hh:mm:ss a"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd,yyyy"
   
    let date: NSDate? = dateFormatterGet.date(from: format) as NSDate?
    
    return dateFormatterPrint.string(from: date! as Date)
    }
}
