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
    var doRemoveItemBoxes: Bool?
    var addExtraPadding: Bool?
    var other: Bool?
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func itemTestingCheckBoxTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
    }
    @IBAction func detailedPicturesCheckBoxTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func removeAllProtectivePackagingTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func removeShipperBoxesTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func removeItemBoxesTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    
    @IBAction func removeInvoicesTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    
    @IBAction func prepareInOneBoxTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func addFragileStickerTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    
    @IBAction func useSmallestBoxTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func packWithoutBubbleTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func doNotRemoveItemBoxesTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    @IBAction func addExtraBubbleTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    
    @IBAction func otherTapped(_ sender: UIButton) {
        sender.setImage(UIImage(named: "checkedGreen"), for: .normal)

    }
    
}
