//
//  CourierServiceCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/05/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CourierServiceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 2 : 1
            self.layer.borderColor = isSelected ? hexStringToUIColor(hex: "#0BBAA3").cgColor : hexStringToUIColor(hex: "#3B525A").cgColor
            self.containerView.backgroundColor = isSelected ? hexStringToUIColor(hex: "#0BBAA3").withAlphaComponent(0.1) : UIColor.clear
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var courierNameLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 1
        self.layer.borderColor = hexStringToUIColor(hex: "#3B525A").cgColor
        self.layer.cornerRadius = 5
    }

}
