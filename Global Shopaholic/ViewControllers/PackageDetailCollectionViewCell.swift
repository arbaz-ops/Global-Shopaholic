//
//  PackageDetailCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 27/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

protocol PackageDetailCollectionViewCellDelegate {
    func editCustomDetailTapped(cell: UICollectionViewCell)
}

class PackageDetailCollectionViewCell: UICollectionViewCell {
    var indexPath: IndexPath?
    var packageDetailCollectionViewCellDelegate: PackageDetailCollectionViewCellDelegate?
    @IBOutlet weak var storageRemainingLabel: UILabel!
    @IBOutlet weak var editCustomImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var editCustomDetailLabel: UILabel!
    @IBOutlet weak var trackingNumberLabel: UILabel!
    @IBOutlet weak var packageImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.DropShadowView()
        containerView.layer.cornerRadius = 12
        packageImageView.roundTopCorners(radius: 12)
        packageImageView.layer.masksToBounds = true
        packageImageView.clipsToBounds = true
        packageImageView.layoutIfNeeded()
        editCustomDetailLabel.isUserInteractionEnabled = true
        editCustomDetailLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(editCustomLabelTapped)))
    }
    
    @objc func editCustomLabelTapped() {
        packageDetailCollectionViewCellDelegate?.editCustomDetailTapped(cell: self)
    }
    
    func changeUI(status: OutgoingStatus) {
        
        switch status {
        case .Preparing:
            editCustomImageView.isHidden = false
            editCustomDetailLabel.isHidden = false
        case .PendingPayment:
            editCustomImageView.isHidden = false
            editCustomDetailLabel.isHidden = false
        case .Processing:
            editCustomImageView.isHidden = true
            editCustomDetailLabel.isHidden = true
        case .PaymentDone:
            editCustomImageView.isHidden = true
            editCustomDetailLabel.isHidden = true
        }
        
    }           

}
