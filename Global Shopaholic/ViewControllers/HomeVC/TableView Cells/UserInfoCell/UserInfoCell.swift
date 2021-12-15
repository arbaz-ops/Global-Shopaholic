//
//  UserInfoCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell {
@IBOutlet weak var NotImageLbl: UILabel!
    @IBOutlet weak var UsernameAndSNLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        NotImageLbl.layer.cornerRadius =  NotImageLbl.frame.width/2
        NotImageLbl.dropShadoww()
        NotImageLbl.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
