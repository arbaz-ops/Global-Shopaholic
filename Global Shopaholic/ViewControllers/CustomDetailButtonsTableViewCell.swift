//
//  CustomDetailButtonsTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 24/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

protocol CustomDetailButtonCellDelegate {
    func addItemTapped()
    func submitTapped()
}

class CustomDetailButtonsTableViewCell: UITableViewCell {

    var customDetailButtonCellDelegate: CustomDetailButtonCellDelegate?
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        submitButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        addItemButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        
        submitButton.layer.cornerRadius = 8
        addItemButton.layer.cornerRadius = 8

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        customDetailButtonCellDelegate?.submitTapped()
    }
    
    @IBAction func addItemButtonTapped(_ sender: UIButton) {
        customDetailButtonCellDelegate?.addItemTapped()
    
    }
    
}
