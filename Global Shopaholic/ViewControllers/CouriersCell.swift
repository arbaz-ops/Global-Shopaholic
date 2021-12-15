//
//  CouriersCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/9/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
class CouriersCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLbl.layer.cornerRadius = 5
        cellLbl.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
