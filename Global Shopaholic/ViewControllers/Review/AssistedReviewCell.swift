//
//  AssistedReviewCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class AssistedReviewCell: UITableViewCell {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var promoCodeLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var itmNoLbl: UILabel!
    @IBOutlet weak var MainContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        MainContainer.DropShadowView()
        MainContainer.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
