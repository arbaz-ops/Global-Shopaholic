//
//  BoxDimensionsTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class BoxDimensionsTableViewCell: UITableViewCell {
    @IBOutlet weak var boxWeight: UILabel!
    @IBOutlet weak var boxDimension: UILabel!
    @IBOutlet weak var boxActualWeightLabel
    : UILabel!
    @IBOutlet weak var boxDimensionsLabel
    : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
