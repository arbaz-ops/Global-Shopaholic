//
//  StorageCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 16/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit



class StorageCollectionViewCell: UICollectionViewCell {
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
        
        specialServiceLabel.isUserInteractionEnabled = true
    }
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if !isChecked! {
               checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
            isChecked = true

                }
           else if isChecked! {
   
               checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
               isChecked = false

                }
    }
    
   

    @IBAction func checkBoxTapped(_ sender: UIButton) {
//        if !isChecked! {
//            isChecked = true
//            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
//        }
//        else if isChecked! {
//            isChecked = false
//            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//        }
        storageCollectionViewCellDelegate?.checkBoxTapped(indexPath: self.indexPath!)
        
    }
}
