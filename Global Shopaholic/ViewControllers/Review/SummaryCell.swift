//
//  SummaryCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/24/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var totalItemCostLbl: UILabel!
    @IBOutlet weak var shippingChargesLbl: UILabel!
    @IBOutlet weak var processingChargesLbl: UILabel!
    @IBOutlet weak var MainView: UIView!
   
    @IBOutlet weak var promoCodeLbl: UILabel!
    @IBOutlet weak var finalTotalLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        MainView.DropShadowView()
        MainView.layer.cornerRadius = 10
        
        saveBtn.layer.cornerRadius = 10
        previousBtn.layer.cornerRadius = 10
        payBtn.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
