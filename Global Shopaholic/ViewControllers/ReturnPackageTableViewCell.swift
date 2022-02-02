//
//  ReturnPackageTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 08/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ReturnPackageTableViewCell: UITableViewCell {
    @IBOutlet weak var submitButton: UIButton!
    var returnLabel: Bool?
    var returnPackage: Bool?
    @IBOutlet weak var noReturnPackageCheckBox: UIButton!
    @IBOutlet weak var yesReturnPackageCheckBox: UIButton!
    
    @IBOutlet weak var noReturnLabelCheckBox: UIButton!
    @IBOutlet weak var yesReturnLabelCheckBox: UIButton!
    @IBOutlet weak var chooseFileButton: UIButton!
    @IBOutlet weak var detailsTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        returnLabel = false
        returnPackage = false
        detailsTextField.setRightPaddingPoints(10)
        detailsTextField.setLeftPaddingPoints(10)
        detailsTextField.layer.cornerRadius = 6
        chooseFileButton.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 5
        
        chooseFileButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func noReturnLabelCheckBoxTapped(_ sender: UIButton) {
//        if returnLabel == false {
            noReturnLabelCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        yesReturnLabelCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)

            returnLabel = false
//        }
//        else if returnLabel == true {
//            returnLabel = false
//        }
    }
    
    @IBAction func yesReturnLabelCheckBox(_ sender: UIButton) {
//        if returnLabel == false {
            yesReturnLabelCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        noReturnLabelCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            returnLabel = true
//        }
//        else if returnLabel == true {
//
//            returnLabel = false
//        }
    }
    
    
    @IBAction func noReturnPackageCheckBox(_ sender: UIButton) {
        noReturnPackageCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
    yesReturnPackageCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)

        returnPackage = false
    }
    @IBAction func yesReturnPackageCheckBox(_ sender: UIButton) {
        yesReturnPackageCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        noReturnPackageCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)

        returnPackage = true
    }
}
