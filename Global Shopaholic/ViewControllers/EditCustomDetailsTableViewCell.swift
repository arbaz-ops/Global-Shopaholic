//
//  EditCustomDetailsTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 01/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

class EditCustomDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var totalPackagesValue: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var categoryDropDown: DropDown!
    @IBOutlet weak var trackingNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryDropDown.layer.cornerRadius = 6
        totalPackagesValue.layer.cornerRadius = 6
        valueTextField.layer.cornerRadius = 6
        qtyTextField.layer.cornerRadius = 6
        descriptionTextField.layer.cornerRadius = 6
        
        categoryDropDown.DropShadowView()
        totalPackagesValue.DropShadowView()
        valueTextField.DropShadowView()
        qtyTextField.DropShadowView()
        descriptionTextField.DropShadowView()
        
        categoryDropDown.setLeftPaddingPoints(20)
        totalPackagesValue.setLeftPaddingPoints(20)
        valueTextField.setLeftPaddingPoints(20)
        qtyTextField.setLeftPaddingPoints(20)
        descriptionTextField.setLeftPaddingPoints(20)
        
        categoryDropDown.setRightPaddingPoints(10)
        totalPackagesValue.setRightPaddingPoints(10)
        valueTextField.setRightPaddingPoints(10)
        qtyTextField.setRightPaddingPoints(10)
        descriptionTextField.setRightPaddingPoints(10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
