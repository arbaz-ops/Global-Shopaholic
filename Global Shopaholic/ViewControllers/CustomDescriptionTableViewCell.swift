//
//  CustomDescriptionTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 24/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CustomDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
