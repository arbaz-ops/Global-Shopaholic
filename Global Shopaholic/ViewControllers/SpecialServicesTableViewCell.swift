//
//  SpecialServicesTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol SpecialServicesTableViewCellDelegate {
    func packageContentPhotoSelected()
    func packageConsolidationSelected()
    func repackingSelected()
    func removeItemBoxesSelected()
    func removeAllProtectivePackagingSelected()
    func removeShipperBoxesSelected()
    func removeInvoicesAndPricesTagsSelected()
    func doNotRemoveShipperBoxesSelected()
    func doNotRemoveItemBoxesSelected()
    
    func packageContentPhotoDeSelected()
    func packageConsolidationDeSelected()
    func repackingDeSelected()
    func removeItemBoxesDeSelected()
    func removeAllProtectivePackagingDeSelected()
    func removeShipperBoxesDeSelected()
    func removeInvoicesAndPricesTagsDeSelected()
    func doNotRemoveShipperBoxesDeSelected()
    func doNotRemoveItemBoxesDeSelected()
    
    func itemTestingSelected()
    
    func detailedPictureSelected()
    
    func splitBoxesSelected()
}

class SpecialServicesTableViewCell: UITableViewCell {
    @IBOutlet weak var detailedPictureCheckBoxButton: UIButton!
    @IBOutlet weak var itemTestingCheckBoxButton: UIButton!
    @IBOutlet weak var splitCheckBoxButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var paidServices: [String]?
    var freeServices: [String]?
    var itemTesting: Bool?
    var detailedPictures: Bool?
    var packageContentPhoto: Bool?
    var packageConsolidation: Bool?
    var repacking: Bool?
    var removeProtectivePackage: Bool?
    
    var split: Bool?
    var removeShipperBoxes: Bool?
    var removeInvoicesAndPriceTags: Bool?
    var removeItemBoxes: Bool?
    var doNotRemoveItemBoxes: Bool?
    var doNotRemoveShipperBoxes: Bool?
    var addExtraBubble: Bool?
    var other: Bool?
    var specialServicesCellDelegate: SpecialServicesTableViewCellDelegate?
    
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        if paidServices != nil {
//        for service in paidServices! {
//            if service == "test_device" {
//                itemTestingCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//                itemTesting = true
//            }
//            else if service != "test_device" {
//                itemTesting = false
//                itemTestingCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//            }
//
//            if service == "detail_photos" {
//                detailedPictures = true
//                detailedPictureCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//            }
//            else if service != "detail_photos" {
//                detailedPictures = false
//                detailedPictureCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//            }
//            if service == "split" {
//                split = true
//                splitCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//            }
//            else if service != "split" {
//                split = false
//                splitCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//            }
//        }
//        }
        
        packageContentPhoto = false
        packageConsolidation = false
        repacking = false
        removeItemBoxes = false
        removeProtectivePackage = false
        removeShipperBoxes = false
        removeInvoicesAndPriceTags = false
        doNotRemoveShipperBoxes = false
        doNotRemoveItemBoxes = false
        addExtraBubble = false
        other = false
        
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.layer.cornerRadius = 8
        
        descriptionLabel.isHidden = true
        descriptionTextView.isHidden = true
    }
    
    func updateUI(paidServices: [String]?) {
        
        if paidServices == nil {
            itemTesting = false
            itemTestingCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            detailedPictures = false
            detailedPictureCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            split = false
            splitCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            
        }else {
        if paidServices!.contains("test_device") {
            itemTestingCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
            itemTesting = true
        }
            else if !paidServices!.contains("test_device") {
            itemTesting = false
            itemTestingCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        }
        if paidServices!.contains("detail_photos") {
            detailedPictures = true
            detailedPictureCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
        }else {
            detailedPictures = false
            detailedPictureCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        }
            if paidServices!.contains("split") {
                split = true
                splitCheckBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
            }
            else {
                split = false
                splitCheckBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func itemTestingCheckBoxTapped(_ sender: UIButton) {
        print(itemTesting)
        if itemTesting == false {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.itemTestingSelected()
            itemTesting = true
        }
        
    }
    @IBAction func detailedPicturesCheckBoxTapped(_ sender: UIButton) {
        if detailedPictures == false {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.detailedPictureSelected()
            detailedPictures = true
            
        }
       

    }
    @IBAction func packageConsolidation(_ sender: UIButton) {
        if !packageConsolidation! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.packageConsolidationSelected()
            packageConsolidation = true
        }
        else if packageConsolidation == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.packageConsolidationDeSelected()
            packageConsolidation = false
        }

    }
    @IBAction func repacking(_ sender: UIButton) {
        if !repacking! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.repackingSelected()
            repacking = true
        }
        else if repacking == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.repackingDeSelected()

            repacking = false
        }

    }
    @IBAction func packageContentPhoto(_ sender: UIButton) {
        if !packageContentPhoto! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.packageContentPhotoSelected()
            packageContentPhoto = true
        }
        else if packageContentPhoto == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.packageContentPhotoDeSelected()
            packageContentPhoto = false
        }

    }
    
    @IBAction func removeItemBoxes(_ sender: UIButton) {
        if !removeItemBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.removeItemBoxesSelected()
            removeItemBoxes = true
        }
        else if removeItemBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.removeItemBoxesDeSelected()
            removeItemBoxes = false
        }

    }
    
    @IBAction func splitBoxesSelected(_ sender: UIButton) {
        if split == false {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.splitBoxesSelected()
            split = true
            
        }
        
    
    }
    @IBAction func removeProtectivePackage(_ sender: UIButton) {
        if !removeProtectivePackage! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.removeAllProtectivePackagingSelected()
            removeProtectivePackage = true
        }
        else if removeProtectivePackage == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.removeAllProtectivePackagingDeSelected()
            removeProtectivePackage = false
        }

    }
    @IBAction func removeShipperBoxes(_ sender: UIButton) {
        if !removeShipperBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.removeShipperBoxesSelected()
            removeShipperBoxes = true
        }
        else if removeShipperBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.removeShipperBoxesDeSelected()
            removeShipperBoxes = false
        }

    }
    
    @IBAction func removeInvoicesAndTags(_ sender: UIButton) {
        if !removeInvoicesAndPriceTags! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.removeInvoicesAndPricesTagsSelected()
            removeInvoicesAndPriceTags = true
        }
        else if removeInvoicesAndPriceTags == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.removeInvoicesAndPricesTagsDeSelected()
            removeInvoicesAndPriceTags = false
        }

    }
    @IBAction func doNotRemoveShipperBoxes(_ sender: UIButton) {
        if !doNotRemoveShipperBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.doNotRemoveShipperBoxesSelected()
            doNotRemoveShipperBoxes = true
        }
        else if doNotRemoveShipperBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.doNotRemoveShipperBoxesDeSelected()
            doNotRemoveShipperBoxes = false
        }

    }
    @IBAction func doNotRemoveItemBoxesTapped(_ sender: UIButton) {
        if !doNotRemoveItemBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            specialServicesCellDelegate?.doNotRemoveItemBoxesSelected()
            doNotRemoveItemBoxes = true
        }
        else if doNotRemoveItemBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            specialServicesCellDelegate?.doNotRemoveItemBoxesDeSelected()
            doNotRemoveItemBoxes = false
        }


    }
 
    
    
    @IBAction func otherTapped(_ sender: UIButton) {
        if !other! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            descriptionLabel.isHidden = false
            descriptionTextView.isHidden = false
            other = true
        }
        else if other == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            descriptionLabel.isHidden = true
            descriptionTextView.isHidden = true
            other = false
        }

    }
    
}
