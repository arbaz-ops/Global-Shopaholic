//
//  StorageCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 16/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol StorageCollectionViewCellDelegate {
    func returnPackageTapped()
    func addCustomDetailTapped()
    func specialServiceTapped()
}

class StorageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addCustomDetailLabel: UILabel!
    @IBOutlet weak var returnThisPackageLabel: UILabel!
    var isChecked: Bool?
    @IBOutlet weak var myStorageImageView: UIImageView!
    @IBOutlet weak var specialServiceLabel: UILabel!
    @IBOutlet weak var myStorageContentView: UIView!
    @IBOutlet weak var storageCellContainerView: UIView!
    @IBOutlet weak var trackingNumber: UILabel!
    var storageCollectionViewCellDelegate: StorageCollectionViewCellDelegate?
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
    override func prepareForReuse() {
        super.prepareForReuse()
        isChecked = false
    }
    
    @objc func returnPackageTapped() {
        storageCollectionViewCellDelegate?.returnPackageTapped()
    }
    
    @objc func addCustomDetailTapped() {
        storageCollectionViewCellDelegate?.addCustomDetailTapped()

    }
    @objc func specialServiceTapped() {
        storageCollectionViewCellDelegate?.specialServiceTapped()
    }

    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if !isChecked! {
            isChecked = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
        }
        else if isChecked! {
            isChecked = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        }
    }
}
