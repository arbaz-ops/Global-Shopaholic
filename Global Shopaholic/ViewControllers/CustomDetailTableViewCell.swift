//
//  CustomDetailTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
protocol CustomDetailCellDelegate {
    func cancelTapped(indexPath: IndexPath)
    func categorySelectedIndex(index: Int)
}

class CustomDetailTableViewCell: UITableViewCell {

    @IBOutlet var textFields: [UITextField]?
    var customDetailCellDelegate: CustomDetailCellDelegate?
    @IBOutlet weak var cancelButton: UIButton!
    var indexPath: IndexPath?
    var storageVM: StorageVM?
    var categorySelectedIndex: Int?
    @IBOutlet weak var trackingNumberLabel: UILabel!
    @IBOutlet weak var trackingNumber: UILabel!
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var categoryTextField: DropDown!
    var categoriesList: [[String: Any]]?
    override func awakeFromNib() {
        super.awakeFromNib()
        for field in textFields! {
            field.autocorrectionType = .no
        }
        qtyTextField.keyboardType = .numberPad
        valueTextField.keyboardType = .numberPad
        
        categoryTextField.layer.cornerRadius = 6
        categoryTextField.setLeftPaddingPoints(CGFloat(15))
        descriptionTextField.setLeftPaddingPoints(CGFloat(15))
        descriptionTextField.layer.cornerRadius = 6
        qtyTextField.layer.cornerRadius = 6
        qtyTextField.setLeftPaddingPoints(CGFloat(15))
        valueTextField.layer.cornerRadius = 6
        valueTextField.setLeftPaddingPoints(CGFloat(15))
        
        fetchCategories()
        
        categoryTextField.didSelect {[self] selectedText, index, id in
            customDetailCellDelegate?.categorySelectedIndex(index: index)
            
//            self.categorySelectedIndex = index
        }
        // Initialization code
        
    }
    func fetchCategories() {
        storageVM = StorageVM()
        let userToken = getCurrentUserToken()
        storageVM?.getPackageCustomCategory(token: userToken, success: {[self] response in
            completion(response: response)
        }, failure: { error in
            let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func completion(response: NSDictionary) {
        let data = response["data"] as? [String: Any]
        categoriesList = data!["list"] as? [[String: Any]]
        
        
        for categories in categoriesList! {
            let category = categories["title"] as? String
            categoryTextField.optionArray.append(category!)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.customDetailCellDelegate?.cancelTapped(indexPath: self.indexPath!)
    }
    
}

