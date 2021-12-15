//
//  ReviewSummaryCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/12/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ReviewSummaryCell: UITableViewCell {

    @IBOutlet weak var TotalItemCost: UILabel!
    @IBOutlet weak var ShippingChargesLbl: UILabel!
    @IBOutlet weak var ProcessingChargesLbl: UILabel!
    @IBOutlet weak var BankChargesLbl: UILabel!
    @IBOutlet weak var TotalLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
