//
//  ReturnPackageTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 08/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ReturnPackageTableViewCell: UITableViewCell {
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var chooseFileButton: UIButton!
    @IBOutlet weak var detailsTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailsTextField.layer.cornerRadius = 6
        chooseFileButton.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 5
        
        chooseFileButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
