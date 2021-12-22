//
//  CustomDeclarationFormTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        descriptionView.layer.cornerRadius = 10
        totalView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
