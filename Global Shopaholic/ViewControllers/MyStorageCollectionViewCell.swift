//
//  MyStorageCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol StorageCollectionViewCellDelegate {
    func returnPackageTapped(indexPath: IndexPath)
    func addCustomDetailTapped(indexPath: IndexPath)
    func specialServiceTapped(indexPath: IndexPath)
    func checkBoxTapped(indexPath: IndexPath)
}

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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//        if isChecked == false {
//            checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//            isChecked = true
//        }
//      else  if isChecked == true {
//            checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//            isChecked = false
//        }
    }

    @objc func returnPackageTapped() {
        
        storageCollectionViewCellDelegate?.returnPackageTapped(indexPath: self.indexPath!)
    }
    
    @objc func addCustomDetailTapped() {
        storageCollectionViewCellDelegate?.addCustomDetailTapped(indexPath: self.indexPath!)

    }
    @objc func specialServiceTapped() {
        storageCollectionViewCellDelegate?.specialServiceTapped(indexPath: self.indexPath!)
    }
    
    @IBAction func checkBocBUttonTapped(_ sender: UIButton) {
        storageCollectionViewCellDelegate?.checkBoxTapped(indexPath: indexPath!)
//        if isChecked == false {
//            checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//            isChecked = true
//        }
//      else  if isChecked == true {
//            checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//            isChecked = false
//        }
    }
}
