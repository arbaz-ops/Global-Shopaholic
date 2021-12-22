//
//  CustomDetailTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

class CustomDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var trackingNumber: UILabel!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var totalValueTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryTextField.layer.cornerRadius = 6
        categoryTextField.setLeftPaddingPoints(CGFloat(15))
        descriptionTextField.setLeftPaddingPoints(CGFloat(15))
        descriptionTextField.layer.cornerRadius = 6
        qtyTextField.layer.cornerRadius = 6
        qtyTextField.setLeftPaddingPoints(CGFloat(15))
        valueTextField.layer.cornerRadius = 6
        valueTextField.setLeftPaddingPoints(CGFloat(15))
        totalValueTextField.layer.cornerRadius = 6
        
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        addItemButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.layer.cornerRadius = 8
        addItemButton.layer.cornerRadius = 8
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

