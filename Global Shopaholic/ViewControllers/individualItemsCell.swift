//
//  individualItemsCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/11/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class individualItemsCell: UICollectionViewCell {
   
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var itemNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.DropShadowView()
        // Initialization code
    }

}
