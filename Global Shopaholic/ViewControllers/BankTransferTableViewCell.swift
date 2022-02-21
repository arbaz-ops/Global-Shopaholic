//
//  BankTransferTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class BankTransferTableViewCell: UITableViewCell {

    @IBOutlet weak var chooseFileButton: UIButton!
    @IBOutlet weak var transactionIdTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var bankNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        bankNameTextField.setLeftPaddingPoints(20)
        bankNameTextField.setRightPaddingPoints(10)
        
        transactionIdTextField.setLeftPaddingPoints(20)
        transactionIdTextField.setRightPaddingPoints(10)
        
        dateTextField.layer.cornerRadius = 10
        bankNameTextField.layer.cornerRadius = 10
        transactionIdTextField.layer.cornerRadius = 10

        
        chooseFileButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
