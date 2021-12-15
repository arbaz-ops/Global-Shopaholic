//
//  itemCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/12/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class itemCell: UITableViewCell {

    @IBOutlet weak var openLinkBtn: UIButton!
    @IBOutlet weak var QuantityLbl: UILabel!
    @IBOutlet weak var SizeLbl: UILabel!
    @IBOutlet weak var ColoLbl: UILabel!
    @IBOutlet weak var ItemNoLbl: UILabel!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var CategoryLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        mainView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
