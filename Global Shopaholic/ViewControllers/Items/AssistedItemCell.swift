//
//  AssistedItemCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
class AssistedItemCell: UITableViewCell {
    @IBOutlet weak var ItemNoLbl: UILabel!
    
    @IBOutlet weak var ItemLinkFIeld: UITextField!
    @IBOutlet weak var CategoryField: DropDown!
    @IBOutlet weak var ItemNameField: UITextField!
    @IBOutlet weak var ItemQuantityField: UITextField!
    @IBOutlet weak var ItemSizeField: UITextField!
    @IBOutlet weak var ItemsColorField: UITextField!
    @IBOutlet weak var ItemsPriceField: UITextField!
    @IBOutlet weak var NextBtn: UIButton!
    @IBOutlet weak var SaveBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.DropShadowView()
        contentView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
