//
//  NewsAndUpdateCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/3/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class NewsAndUpdateCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var GShopIcon: UIImageView!
    @IBOutlet weak var MainImg: UIImageView!
    @IBOutlet weak var PostDetailLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        GShopIcon.layer.cornerRadius = GShopIcon.frame.height / 2
        GShopIcon.layer.borderWidth = 0.8
        GShopIcon.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
