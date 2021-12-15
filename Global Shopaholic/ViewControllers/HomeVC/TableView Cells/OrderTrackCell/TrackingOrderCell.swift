//
//  TrackingOrderCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class TrackingOrderCell: UITableViewCell {

    @IBOutlet weak var nextBtn: UIButton!
   
    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var TrackField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView?.backgroundColor = .clear
        
             contentView.layer.cornerRadius = 10
          contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = hexStringToUIColor(hex: keysNstuff.init().secondColor).cgColor
        fieldView.layer.cornerRadius = 10
        fieldView.layer.borderWidth = 0.8
        fieldView.layer.borderColor = hexStringToUIColor(hex: keysNstuff.init().secondColor).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
