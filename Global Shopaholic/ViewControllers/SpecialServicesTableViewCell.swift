//
//  SpecialServicesTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class SpecialServicesTableViewCell: UITableViewCell {

    var itemTesting: Bool?
    var detailedPictures: Bool?
    var removeItemBoxes: Bool?
    var removeAllProtectivePackaging: Bool?
    var removeShipperBoxes: Bool?
    var removeInvoices: Bool?
    var prepareInOneBox: Bool?
    var addFragileSticker: Bool?
    var useSmallestBox: Bool?
    var packWithoutBubbleWrap: Bool?
    var doNotRemoveItemBoxes: Bool?
    var addExtraBubble: Bool?
    var other: Bool?
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemTesting = false
        detailedPictures = false
        removeItemBoxes = false
        removeAllProtectivePackaging = false
        removeShipperBoxes = false
        removeInvoices = false
        prepareInOneBox = false
        addFragileSticker = false
        useSmallestBox = false
        packWithoutBubbleWrap = false
        doNotRemoveItemBoxes = false
        addExtraBubble = false
        other = false
        
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func itemTestingCheckBoxTapped(_ sender: UIButton) {
        if !itemTesting! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            itemTesting = true
        }
        else if itemTesting == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            itemTesting = false
        }
        
    }
    @IBAction func detailedPicturesCheckBoxTapped(_ sender: UIButton) {
        if !detailedPictures! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            detailedPictures = true
        }
        else if detailedPictures == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            detailedPictures = false
        }

    }
    @IBAction func removeAllProtectivePackagingTapped(_ sender: UIButton) {
        if !removeAllProtectivePackaging! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            removeAllProtectivePackaging = true
        }
        else if removeAllProtectivePackaging == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            removeAllProtectivePackaging = false
        }

    }
    @IBAction func removeShipperBoxesTapped(_ sender: UIButton) {
        if !removeShipperBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            removeShipperBoxes = true
        }
        else if removeShipperBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            removeShipperBoxes = false
        }

    }
    @IBAction func removeItemBoxesTapped(_ sender: UIButton) {
        if !removeItemBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            removeItemBoxes = true
        }
        else if removeItemBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            removeItemBoxes = false
        }

    }
    
    @IBAction func removeInvoicesTapped(_ sender: UIButton) {
        if !removeInvoices! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            removeInvoices = true
        }
        else if removeInvoices == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            removeInvoices = false
        }

    }
    
    @IBAction func prepareInOneBoxTapped(_ sender: UIButton) {
        if !prepareInOneBox! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            prepareInOneBox = true
        }
        else if prepareInOneBox == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            prepareInOneBox = false
        }

    }
    @IBAction func addFragileStickerTapped(_ sender: UIButton) {
        if !addFragileSticker! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            addFragileSticker = true
        }
        else if addFragileSticker == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            addFragileSticker = false
        }

    }
    
    @IBAction func useSmallestBoxTapped(_ sender: UIButton) {
        if !useSmallestBox! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            useSmallestBox = true
        }
        else if useSmallestBox == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            useSmallestBox = false
        }

    }
    @IBAction func packWithoutBubbleTapped(_ sender: UIButton) {
        if !packWithoutBubbleWrap! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            packWithoutBubbleWrap = true
        }
        else if packWithoutBubbleWrap == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            packWithoutBubbleWrap = false
        }

    }
    @IBAction func doNotRemoveItemBoxesTapped(_ sender: UIButton) {
        if !doNotRemoveItemBoxes! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            doNotRemoveItemBoxes = true
        }
        else if doNotRemoveItemBoxes == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            doNotRemoveItemBoxes = false
        }


    }
    @IBAction func addExtraBubbleTapped(_ sender: UIButton) {
        if !addExtraBubble! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            addExtraBubble = true
        }
        else if addExtraBubble == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            addExtraBubble = false
        }

    }
    
    @IBAction func otherTapped(_ sender: UIButton) {
        if !other! {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            other = true
        }
        else if other == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            other = false
        }

    }
    
}
