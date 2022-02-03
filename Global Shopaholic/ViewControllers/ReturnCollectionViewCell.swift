//
//  ReturnCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 03/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class ReturnCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var remainingStorageLabel: UILabel!
    @IBOutlet weak var returnPackageStatusLabel: UILabel!
    @IBOutlet weak var returnPackageStatusView: UIView!
    @IBOutlet weak var trackingNumberLabel: UILabel!
    @IBOutlet weak var returnImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        returnImageView.roundTopCorners(radius: 20)
        containerView.layer.cornerRadius = 20
        returnPackageStatusView.layer.cornerRadius = returnPackageStatusView.frame.height / 2
        self.DropShadowView()
    }
    
    func changeStatus(status: PackageStatus) {
        switch status {
        case .Approved:
            DispatchQueue.main.async {[self] in
                returnPackageStatusView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
                returnPackageStatusLabel.text = "Approved"
            }
        case .Rejected:
            DispatchQueue.main.async {[self] in
                returnPackageStatusView.backgroundColor = hexStringToUIColor(hex: "#FF8087")
                returnPackageStatusLabel.text = "Rejected"
            }

        case .Processing:
            DispatchQueue.main.async {[self] in
                returnPackageStatusView.backgroundColor = hexStringToUIColor(hex: "#FFD164")
                returnPackageStatusLabel.text = "Processing"
            }

        }
    }

}
