//
//  CheckoutAndPayTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CheckoutAndPayTableViewCell: UITableViewCell {

    @IBOutlet weak var dhlView: UIView!
    @IBOutlet weak var fedexView: UIView!
    @IBOutlet weak var aramexView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
