//
//  CalculatorDetailCellTableViewCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CalculatorDetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ServiceType: UILabel!
    @IBOutlet weak var Rate: UILabel!
    @IBOutlet weak var DeliveryTime: UILabel!
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var DetailView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailView.layer.cornerRadius = 15
        Img.layer.cornerRadius = 15
        Img.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
