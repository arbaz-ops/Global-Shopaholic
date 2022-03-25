//
//  TotalPackageValueTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 24/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class TotalPackageValueTableViewCell: UITableViewCell {

    @IBOutlet weak var totalPackageValueLabel: UILabel!
    @IBOutlet weak var totalPackageValueTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        totalPackageValueTextField.keyboardType = .numberPad
        totalPackageValueTextField.isUserInteractionEnabled = false
        totalPackageValueTextField.layer.cornerRadius = 6

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
