//
//  MyStorageCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class MyStorageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var addCustomDetailLabel: UILabel!
    @IBOutlet weak var returnThisPackageLabel: UILabel!
    var isChecked: Bool?
    @IBOutlet weak var myStorageImageView: UIImageView!
    @IBOutlet weak var specialServiceLabel: UILabel!
    @IBOutlet weak var myStorageContentView: UIView!
    
    @IBOutlet weak var trackingNumber: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var indexPath: IndexPath?
    var storageCollectionViewCellDelegate: StorageCollectionViewCellDelegate?
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                containerView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
//            }
//            else {
//                containerView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
//
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myStorageImageView.roundTopCorners(radius: 14)
        myStorageImageView.layer.masksToBounds = true
        myStorageImageView.clipsToBounds = true
        myStorageImageView.layoutIfNeeded()
        myStorageContentView.layer.cornerRadius = 14
        self.DropShadowView()
        isChecked = false
        // Initialization code
        returnThisPackageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnPackageTapped)))
        returnThisPackageLabel.isUserInteractionEnabled = true
        addCustomDetailLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addCustomDetailTapped)))
        addCustomDetailLabel.isUserInteractionEnabled = true
        specialServiceLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(specialServiceTapped)))
        specialServiceLabel.isUserInteractionEnabled = true
    }

    @objc func returnPackageTapped() {
        print(<#T##items: Any...##Any#>)
        storageCollectionViewCellDelegate?.returnPackageTapped()
    }
    
    @objc func addCustomDetailTapped() {
        storageCollectionViewCellDelegate?.addCustomDetailTapped()

    }
    @objc func specialServiceTapped() {
        storageCollectionViewCellDelegate?.specialServiceTapped()
    }
    
}
