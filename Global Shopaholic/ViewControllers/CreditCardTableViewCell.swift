//
//  CreditCardTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CreditCardTableViewCell: UITableViewCell {

    @IBOutlet weak var ccvTextField: UITextField!
    @IBOutlet weak var expiryDateTextField: UITextField!
    @IBOutlet weak var cardHolderNameTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        ccvTextField.setLeftPaddingPoints(25)
        ccvTextField.setRightPaddingPoints(10)
        
        expiryDateTextField.setLeftPaddingPoints(25)
        expiryDateTextField.setRightPaddingPoints(10)
        
        cardHolderNameTextField.setLeftPaddingPoints(25)
        cardHolderNameTextField.setRightPaddingPoints(10)
        
        cardNumberTextField.setLeftPaddingPoints(25)
        cardNumberTextField.setRightPaddingPoints(10)
        // Configure the view for the selected state
    }
    
}
