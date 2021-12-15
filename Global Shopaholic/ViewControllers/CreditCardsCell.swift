//
//  CreditCardsCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CreditCardsCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardLstDigitsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 20
        // Initialization code
    }

}
