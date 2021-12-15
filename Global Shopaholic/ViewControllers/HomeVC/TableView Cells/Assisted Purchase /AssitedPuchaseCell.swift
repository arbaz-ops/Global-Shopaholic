//
//  AssitedPuchaseCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class AssitedPuchaseCell: UITableViewCell {

    @IBOutlet weak var BeginBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = hexStringToUIColor(hex: "00BBA3").cgColor
        BeginBtn.layer.cornerRadius = 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
