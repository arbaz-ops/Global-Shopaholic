//
//  VerificationTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit



class VerificationTableViewCell: UITableViewCell {

    @IBOutlet weak var verifyCodeButton: UIButton!
    @IBOutlet weak var resendCodeButton: UIButton!
    @IBOutlet weak var verificationCodeTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resendCodeButton.underline()
        verifyCodeButton.layer.cornerRadius = 6
        verificationCodeTextField.layer.cornerRadius = 10
        verificationCodeTextField.DropShadowTextField()
        verificationCodeTextField.setLeftPaddingPoints(20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
