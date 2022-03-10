//
//  ReturnPackageTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 08/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol ReturnPackageTableViewCellDelegate {
    func chooseFileTapped(indexPath: IndexPath)
    func submitButtonTapped(type: String?, detail: String?)
}


class ReturnPackageTableViewCell: UITableViewCell {
    @IBOutlet weak var wholePackageLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var messageView: UIView!
    var returnLabel: Bool?
    var returnPackage: String?
    @IBOutlet weak var noReturnPackageCheckBox: UIButton!
    @IBOutlet weak var yesReturnPackageCheckBox: UIButton!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var returnPackageCellDelegate: ReturnPackageTableViewCellDelegate?
    
    @IBOutlet weak var attachLabel: UILabel!
    @IBOutlet weak var noWholePackageLabel: UILabel!
    @IBOutlet weak var yesWholePackageLabel: UILabel!
    @IBOutlet weak var noReturnLabelCheckBox: UIButton!
    @IBOutlet weak var yesReturnLabelCheckBox: UIButton!
    @IBOutlet weak var chooseFileButton: UIButton!
    @IBOutlet weak var detailsTextField: UITextView!
    var indexPath: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        returnLabel = false
        detailsTextField.autocorrectionType = .no
        detailsTextField.setRightPaddingPoints(10)
        detailsTextField.setLeftPaddingPoints(10)
        detailsTextField.layer.cornerRadius = 6
        chooseFileButton.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 5
        messageView.isHidden = true
        chooseFileButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
       
        
        returnPackageCellDelegate?.submitButtonTapped(type: returnPackage, detail: detailsTextField?.text)
    }
    @IBAction func noReturnLabelCheckBoxTapped(_ sender: UIButton) {
//        if returnLabel == false {
            noReturnLabelCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        yesReturnLabelCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            
            returnLabel = false
        changeUIOnReturnLabel(returnLabel!)
//        }
//        else if returnLabel == true {
//            returnLabel = false
//        }
    }
    
    @IBAction func chooseFileTapped(_ sender: UIButton) {
        returnPackageCellDelegate?.chooseFileTapped(indexPath: indexPath!)
    }
    @IBAction func yesReturnLabelCheckBox(_ sender: UIButton) {
//        if returnLabel == false {
            yesReturnLabelCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        noReturnLabelCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            returnLabel = true
        changeUIOnReturnLabel(returnLabel!)
//        }
//        else if returnLabel == true {
//
//            returnLabel = false
//        }
    }
    
    
    @IBAction func noReturnPackageCheckBox(_ sender: UIButton) {
        noReturnPackageCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
    yesReturnPackageCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        detailsTextField.isHidden = false
        detailsLabel.isHidden = false

        returnPackage = "no"
    }
    @IBAction func yesReturnPackageCheckBox(_ sender: UIButton) {
        yesReturnPackageCheckBox.setImage(UIImage(named: "checkedGreen"), for: .normal)
        noReturnPackageCheckBox.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        detailsTextField.isHidden = true
        detailsLabel.isHidden = true

        returnPackage = "yes"
    }
    
    func changeUIOnReturnLabel(_ condition: Bool) {
        switch condition {
        case true:
            if returnPackage == "yes" {
                detailsTextField.isHidden = true
                detailsLabel.isHidden = true

            }else if returnPackage == "no" {
                detailsTextField.isHidden = false
                detailsLabel.isHidden = false

            }
            else if returnPackage == "" {
                detailsTextField.isHidden = true
                detailsLabel.isHidden = true
            }
            wholePackageLabel.isHidden = false
            yesWholePackageLabel.isHidden = false
            noWholePackageLabel.isHidden = false
            attachLabel.isHidden = false
            chooseFileButton.isHidden = false
            submitButton.isHidden = false
            messageView.isHidden = true
            yesReturnPackageCheckBox.isHidden = false
            noReturnPackageCheckBox.isHidden = false
        case false:
            
            wholePackageLabel.isHidden = true
            yesWholePackageLabel.isHidden = true
            noWholePackageLabel.isHidden = true
            detailsLabel.isHidden = true
            detailsTextField.isHidden = true
            attachLabel.isHidden = true
            chooseFileButton.isHidden = true
            submitButton.isHidden = true
            messageView.isHidden = false
            yesReturnPackageCheckBox.isHidden = true
            noReturnPackageCheckBox.isHidden = true

        }
        
    }
}
