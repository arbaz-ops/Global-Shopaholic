//
//  SpecialServicesTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class SpecialServicesTableViewCell: UITableViewCell {

    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
