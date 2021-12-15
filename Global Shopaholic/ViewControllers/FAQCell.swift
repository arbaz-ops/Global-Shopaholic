//
//  FAQCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class FAQCell: UITableViewCell {
    
    @IBOutlet weak var FAQlbl: UILabel!
    @IBOutlet weak var VIEW: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        VIEW.layer.cornerRadius = 10
        VIEW.ViewShadoww()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
