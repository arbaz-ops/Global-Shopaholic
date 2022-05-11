//
//  CourierServiceCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/05/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CourierServiceCollectionViewCell: UICollectionViewCell {

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
