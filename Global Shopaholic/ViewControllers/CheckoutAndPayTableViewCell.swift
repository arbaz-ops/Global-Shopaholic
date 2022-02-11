//
//  CheckoutAndPayTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CheckoutAndPayTableViewCell: UITableViewCell {

    @IBOutlet weak var payNowButton: UIButton!
    @IBOutlet var couriers: [UIView]!
    @IBOutlet weak var uspsView: UIView!
    @IBOutlet weak var upsView: UIView!
    @IBOutlet weak var dhlView: UIView!
    @IBOutlet weak var fedexView: UIView!
    @IBOutlet weak var aramexView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        couriers.forEach { view in
            view.layer.borderColor = hexStringToUIColor(hex: "#3B525A").cgColor
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
        }
        
        payNowButton.layer.cornerRadius = 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
