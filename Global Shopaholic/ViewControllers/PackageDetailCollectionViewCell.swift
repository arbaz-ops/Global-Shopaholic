//
//  PackageDetailCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 27/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class PackageDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var editCustomDetailLabel: UILabel!
    @IBOutlet weak var trackingNumberLabel: UILabel!
    @IBOutlet weak var packageImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.DropShadowView()
        containerView.layer.cornerRadius = 12
    }
    
  

}
