//
//  WalletHistoryCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/23/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class WalletHistoryCell: UITableViewCell {

    @IBOutlet weak var AmountLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var BadgeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
