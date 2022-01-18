//
//  ShippedTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 19/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ShippedTableViewCell: UITableViewCell {

   
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var requestIdNumber: UILabel!
    @IBOutlet weak var trackingIdNumber: UILabel!
    @IBOutlet weak var trackingIdLabel: UILabel!
    @IBOutlet weak var shippedViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var markAsDeliveredButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        markAsDeliveredButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 10)
        markAsDeliveredButton.layer.cornerRadius = 8
        containerView.layer.cornerRadius = 8
        containerView.DropShadowView()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
