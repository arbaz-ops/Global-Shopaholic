//
//  EditAddressTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class EditAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var completeAddressTextField: UITextView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        submitButton.layer.cornerRadius = 8
        nameTextField.setLeftPaddingPoints(20)
        nameTextField.setRightPaddingPoints(20)
        nameTextField.layer.cornerRadius = 10
        
        phoneNumberTextField.setLeftPaddingPoints(20)
        phoneNumberTextField.setRightPaddingPoints(20)
        phoneNumberTextField.layer.cornerRadius = 10
        
        completeAddressTextField.layer.cornerRadius = 10
        completeAddressTextField.setRightPaddingPoints(20)
        completeAddressTextField.setLeftPaddingPoints(20)
        
        nameTextField.placeholder = "Name"
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.keyboardType = .namePhonePad
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
