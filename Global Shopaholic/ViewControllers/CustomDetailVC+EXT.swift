//
//  CustomDetailVC+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension CustomDetailViewController: CustomDetailButtonCellDelegate, CustomDetailCellDelegate {
  
    func categorySelectedIndex(index: Int) {
        categorySelectedIndex = index
        print(index)
        
    }
    
    func cancelTapped(indexPath: IndexPath) {
        DispatchQueue.main.async {[self] in
            customDetailTableView.beginUpdates()
            customDetails?.remove(at: indexPath.row)
            customDetailTableView.deleteRows(at: [IndexPath.init(row: indexPath.row, section: 0)], with: .none)
            let sum = customDetails!.reduce(0) {$0 + Int.init($1.value!)!}
            print(sum)
            let totalPackageValueCell = customDetailTableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? TotalPackageValueTableViewCell
            totalPackageValueCell?.totalPackageValueTextField.text = "$ \(sum)"
            customDetailTableView.endUpdates()
            customDetailTableView.reloadData()
        }
    }
    
    func submitTapped() {
        var category:[String]?
        for customDetail in customDetails! {
            category?.append((customDetail.categoryKey)!)
        }
        
    }
    
    func addItemTapped() {
        
        let customDetailCell = customDetailTableView.cellForRow(at: IndexPath.init(row: self.customDetails!.count - 1, section: 0)) as? CustomDetailTableViewCell
        
        guard let  categorytext = customDetailCell?.categoryTextField.text else {
            return
        }
        
        guard let description = customDetailCell?.descriptionTextField.text else {
            
            return
        }
        guard let qty = customDetailCell?.qtyTextField?.text else  {
           
            return
        }
        guard let value = customDetailCell?.valueTextField?.text else {
            
            return
        }
        
        if categorytext.isEmpty {
            showAlert(message: "Please select category.")

        }
        else if description.isEmpty {
         
            showAlert(message: "Please enter description.")

        }
        else if qty.isEmpty {
            
            showAlert(message: "Please enter quantity.")
        }
        else if value.isEmpty {
            showAlert(message: "Please enter value.")
        }
        else {
            let categoryIndex = customDetailCell?.categoryTextField.selectedIndex
            selectedCategories?.append(categorytext)
            guard let categoryKey = categoriesList?[categoryIndex!]["key"] as? String else {
                showAlert(message: "Category does not exist")
                return
            }
            print(categoryKey)
            let indexPath = customDetailCell?.indexPath
            customDetails?[indexPath!.row].category  = categorytext
            customDetails?[indexPath!.row].description = description
            customDetails?[indexPath!.row].quantity = qty
            customDetails?[indexPath!.row].value = value
            customDetails?[indexPath!.row].categoryKey = categoryKey
            let sum = customDetails!.reduce(0) {$0 + Int.init($1.value!)!}
            let totalPackageValueCell = customDetailTableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? TotalPackageValueTableViewCell
            totalPackageValueCell?.totalPackageValueTextField.text = "$ \(sum)"
           
            let customDetail = CustomDetail(category: "", categoryKey: "", description: "", quantity: "", value: "")
            customDetails?.append(customDetail)
            customDetailTableView.reloadData()
        
            

        }
  
    }
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


extension CustomDetailViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text)
//        let totalPackageValueCell = customDetailTableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? TotalPackageValueTableViewCell
//        totalPackageValueCell?.totalPackageValueTextField.text = "$ \(textField.text)"
//        customDetailTableView.reloadData()
    }
}
