//
//  AddBoxCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 10/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class AddBoxCell: UITableViewCell {

    @IBOutlet weak var ShippingRatesBtn: UIButton!
    @IBOutlet weak var AddboxBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        ShippingRatesBtn.layer.cornerRadius = 10
        AddboxBtn.layer.cornerRadius = 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
