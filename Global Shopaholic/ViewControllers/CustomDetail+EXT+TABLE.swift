//
//  CustomDetail+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension CustomDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return  self.rows.count
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
            customDetailCell?.customDetailCellDelegate = self
            categoryField = customDetailCell?.categoryTextField
            descriptionField = customDetailCell?.descriptionTextField
            qtyTextField = customDetailCell?.qtyTextField
            valueTextField = customDetailCell?.valueTextField
            categorySelectedIndex = customDetailCell?.categorySelectedIndex
//            if selectedCategories!.count < 1 {
//                customDetailCell?.categoryTextField.text = nil
//            }
//            else if selectedCategories!.count > 0 {
//                print(selectedCategories![indexPath.row])
//                print(indexPath.row)
//            }
            
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
            totalPackageValue = totalPackageValueCell?.totalPackageValueTextField 
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
