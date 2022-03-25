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
            rows.remove(at: indexPath.row)
            customDetailTableView.deleteRows(at: [IndexPath.init(row: indexPath.row, section: 0)], with: .none)
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
        guard let  categorytext = categoryField?.text else {
            return
        }
        
        guard let description = descriptionField?.text else {
            
            return
        }
        guard let qty = qtyTextField?.text else  {
           
            return
        }
        guard let value = valueTextField?.text else {
            
            return
        }
        
        if categorytext.isEmpty {
            let alert = UIAlertController(title: "", message: "Please select category.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if description.isEmpty {
            let alert = UIAlertController(title: "", message: "Please enter description.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if qty.isEmpty {
            let alert = UIAlertController(title: "", message: "Please enter quantity.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if value.isEmpty {
            let alert = UIAlertController(title: "", message: "Please enter value.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            guard let categoryKey = categoriesList?[categorySelectedIndex]["key"] as? String else {
                let alert = UIAlertController(title: "", message: "Category does not exist", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let customDetail = CustomDetail(category: categorytext, categoryKey: categoryKey, description: description, quantity: qty, value: value)
            customDetails?.append(customDetail)
            
            let sum = customDetails!.reduce(0) {$0 + Int.init($1.value!)!}
            
            let totalPackageValueCell = customDetailTableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? TotalPackageValueTableViewCell
            totalPackageValueCell?.totalPackageValueTextField.text = "$ \(sum)"
            
            self.rows.insert("CustomDetailCell", at: rows.endIndex)
            customDetailTableView.reloadData()
        }
        
        

        
    }
    
    
}


extension CustomDetailViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let totalPackageValueCell = customDetailTableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? TotalPackageValueTableViewCell
        totalPackageValueCell?.totalPackageValueTextField.text = "$ \(textField.text)"
        customDetailTableView.reloadData()
    }
}
