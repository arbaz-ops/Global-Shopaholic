//
//  CustomDetail+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


extension CustomDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return  self.customDetails!.count
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
       
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rows.count
//    }
//
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            
            let customDetailCell = tableView.dequeueReusableCell(withIdentifier: "CustomDetailTableViewCell", for: indexPath) as? CustomDetailTableViewCell
            customDetailCell?.indexPath = indexPath
            customDetailCell?.trackingNumber.text = package!["tracking_number"] as? String
            customDetailCell?.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
            customDetailCell?.valueTextField.delegate = self
            customDetailCell?.customDetailCellDelegate = self
            customDetailCell?.categoryTextField.text = customDetails?[indexPath.row].category
            customDetailCell?.descriptionTextField.text = customDetails?[indexPath.row].description
            customDetailCell?.valueTextField.text = customDetails?[indexPath.row].value
            customDetailCell?.qtyTextField.text = customDetails?[indexPath.row].quantity
            if indexPath.row < 1 {
                customDetailCell?.trackingNumber.isHidden = false
                customDetailCell?.trackingNumberLabel.isHidden = false
                customDetailCell?.cancelButton.isHidden = true
            }
            else if indexPath.row > 0 {
                customDetailCell?.trackingNumber.isHidden = true
                customDetailCell?.trackingNumberLabel.isHidden = true
                customDetailCell?.cancelButton.isHidden = false
            }
            return customDetailCell!
        case 1:
            let totalPackageValueCell = tableView.dequeueReusableCell(withIdentifier: "TotalPackageValueTableViewCell") as? TotalPackageValueTableViewCell
            return totalPackageValueCell!
        case 2:
            let customDetailButtonCell = tableView.dequeueReusableCell(withIdentifier: "CustomDetailButtonsTableViewCell") as? CustomDetailButtonsTableViewCell
            customDetailButtonCell?.customDetailButtonCellDelegate = self
            return customDetailButtonCell!
        default:
            return UITableViewCell()
        }
    
       
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
