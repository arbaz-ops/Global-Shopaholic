//
//  infoCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/12/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class infoCell: UITableViewCell {

    @IBOutlet weak var DHeaderLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        mainView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
