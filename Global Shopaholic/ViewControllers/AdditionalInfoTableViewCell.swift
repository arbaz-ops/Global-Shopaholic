//
//  AdditionalInfoTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 16/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class AdditionalInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(description: String) {
        infoLabel.text = description
        
    }
    
    
}
