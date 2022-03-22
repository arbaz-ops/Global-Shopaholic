//
//  ConsolidateAndShipTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 15/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

protocol ConsolidateAndShipTableViewCellDelegate {
    func insurePackage(selected: Bool?)
    func packageContainsBattery(selected: Bool?)
    func sendAsGift(selected: Bool?)
    func isDangerous(selected: Bool?)
    func expressProcessing(selected: Bool?)
    func prepareInOneBox(selected: Bool?)
    func addFragile(selected: Bool?)
    func useSmallestBox(selected: Bool?)
    func packWithoutBubbleWrap(selected: Bool?)
    func addExtraPaddingAndBubble(selected: Bool?)
    func acceptTermsAndCondition(selected: Bool?)
    
    func submitButtonTapped(selectedAddressIndex: Int?, specialService: String?)
}



class ConsolidateAndShipTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var expressProcessingCheckBox: UIButton!
    @IBOutlet weak var isDangerousGoodCheckBox: UIButton!
    @IBOutlet weak var sendAsGiftCheckBox: UIButton!
    @IBOutlet weak var packageContainsBatteryCheckBox: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var customValueLabel: UILabel!
    @IBOutlet weak var totalPackagesConsolidatedLabel: UILabel!
    @IBOutlet weak var specialServicesTextView: UITextView!
    @IBOutlet weak var addressDropDownField: DropDown!
    @IBOutlet weak var detailView: UIView!
    
    var consolidationAndShipCellDelegate: ConsolidateAndShipTableViewCellDelegate?
    var insurePackage: Bool?
    var packageContainsBattery: Bool?
    var sendAsGift: Bool?
    var isDangerousGood: Bool?
    var expressProcessing: Bool?
    var prepareInOneBox: Bool?
    var addFragileSticker: Bool?
    var userSmallestBox: Bool?
    var packWithoutBubbleWrap: Bool?
    var addExtraPaddingAndBubble: Bool?
    var acceptTermsAndCondition: Bool?
    var selectedAddressIndex: Int? {
        didSet {
            print(selectedAddressIndex!)
        }
    }
//    @IBOutlet weak var additionalInfoTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        insurePackage = false
        packageContainsBattery = false
        sendAsGift = false
        isDangerousGood = false
        expressProcessing = false
        prepareInOneBox = false
        addFragileSticker = false
        userSmallestBox = false
        packWithoutBubbleWrap = false
        addExtraPaddingAndBubble = false
        acceptTermsAndCondition = false
        initUI()
       
    }
    
    func initUI() {
        submitButton.layer.cornerRadius = 8
        detailView.layer.cornerRadius = 10
        addressDropDownField.layer.cornerRadius = 10
//        additionalInfoTableView.backgroundColor = .clear
        detailView.DropShadowView()
        specialServicesTextView.layer.cornerRadius = 10
        specialServicesTextView.setRightPaddingPoints(10)
        specialServicesTextView.setLeftPaddingPoints(10)
        addressDropDownField.setRightPaddingPoints(20)
        addressDropDownField.setLeftPaddingPoints(10)
        addressDropDownField.listHeight = 200
        addressDropDownField.rowHeight = 100
        
        addressDropDownField.didSelect { selectedText, index, id in
            self.selectedAddressIndex = index
            
        }
    }
    
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func insureThisPackageCheckBoxTapped(_ sender: UIButton) {
        if !insurePackage! {
            insurePackage = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.insurePackage(selected: insurePackage)
        }
        else if insurePackage == true {
            insurePackage = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.insurePackage(selected: insurePackage)

        }
    }
    
    @IBAction func thisPackageContainsBatteryCheckBoxTapped(_ sender: UIButton) {
        if !packageContainsBattery! {
            packageContainsBattery = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.packageContainsBattery(selected: packageContainsBattery)
        }
        else if packageContainsBattery == true {
            packageContainsBattery = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.packageContainsBattery(selected: packageContainsBattery)
        }
    }
    
    @IBAction func sendAsGiftCheckBoxTapped(_ sender: UIButton) {
        if !sendAsGift! {
            sendAsGift = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.sendAsGift(selected: sendAsGift)
        }
        else if sendAsGift == true {
            sendAsGift = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.sendAsGift(selected: sendAsGift)
        }
    }
    
    @IBAction func isDangerousGoodCheckBoxTapped(_ sender: UIButton) {
        if !isDangerousGood! {
            isDangerousGood = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.isDangerous(selected: isDangerousGood)
            
        }
        else if isDangerousGood == true {
            isDangerousGood = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.isDangerous(selected: isDangerousGood)
        }
    }
    @IBAction func expressProcessingCheckBoxTapped(_ sender: UIButton) {
        if !expressProcessing! {
            expressProcessing = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.expressProcessing(selected: expressProcessing)
        }
        else if expressProcessing == true {
            expressProcessing = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.expressProcessing(selected: expressProcessing)
        }
    }
    
    @IBAction func prepareInOneBoxCheckBoxTapped(_ sender: UIButton) {
        if !prepareInOneBox! {
            prepareInOneBox = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.prepareInOneBox(selected: prepareInOneBox)
        }
        else if prepareInOneBox == true {
            prepareInOneBox = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.prepareInOneBox(selected: prepareInOneBox)

        }
    }
    
    @IBAction func addFragileCheckBoxTapped(_ sender: UIButton) {
        if !addFragileSticker! {
            addFragileSticker = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.addFragile(selected: addFragileSticker)
        }
        else if addFragileSticker == true {
            addFragileSticker = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.addFragile(selected: addFragileSticker)
        }
    }
    
    @IBAction func useSmallestBoxCheckBoxTapped(_ sender: UIButton) {
        if !userSmallestBox! {
            userSmallestBox = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.useSmallestBox(selected: userSmallestBox)
        }
        else if userSmallestBox == true {
            userSmallestBox = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.useSmallestBox(selected: userSmallestBox)
        }
    }
    
    @IBAction func packWithoutBubbleWrapCheckBoxTapped(_ sender: UIButton) {
        if !packWithoutBubbleWrap! {
            packWithoutBubbleWrap = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.packWithoutBubbleWrap(selected: packWithoutBubbleWrap)
        }
        else if packWithoutBubbleWrap == true {
            packWithoutBubbleWrap = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.packWithoutBubbleWrap(selected: packWithoutBubbleWrap)
        }
    }
    @IBAction func addExtraPaddingAndBubbleCheckBoxTapped(_ sender: UIButton) {
        
        if !addExtraPaddingAndBubble! {
            addExtraPaddingAndBubble = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.addExtraPaddingAndBubble(selected: addExtraPaddingAndBubble)
        }
        else if addExtraPaddingAndBubble == true {
            addExtraPaddingAndBubble = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.addExtraPaddingAndBubble(selected: addExtraPaddingAndBubble)
        }
    }
    
    @IBAction func acceptTermsAndConditionsCheckBoxTapped(_ sender: UIButton) {
        
        if !acceptTermsAndCondition! {
            acceptTermsAndCondition = true
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            consolidationAndShipCellDelegate?.acceptTermsAndCondition(selected: acceptTermsAndCondition)
        }
        else if acceptTermsAndCondition == true {
            acceptTermsAndCondition = false
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            consolidationAndShipCellDelegate?.acceptTermsAndCondition(selected: acceptTermsAndCondition)
        }
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        consolidationAndShipCellDelegate?.submitButtonTapped(selectedAddressIndex: self.selectedAddressIndex, specialService: self.specialServicesTextView.text)
    }
    
    
}



