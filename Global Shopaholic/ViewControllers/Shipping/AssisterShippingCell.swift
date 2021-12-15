//
//  AssisterShippingCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
class AssisterShippingCell: UITableViewCell {

    @IBOutlet weak var ShippingChargesfield
        : UITextField!
    @IBOutlet weak var ServicesField: DropDown!
    @IBOutlet weak var PromoCodeField: UITextField!
    @IBOutlet weak var AmountField: UITextField!
    @IBOutlet weak var PromoTypeField: DropDown!
    @IBOutlet weak var NextBtn: UIButton!
    @IBOutlet weak var SaveField: UIButton!
    @IBOutlet weak var PreviousBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.DropShadowView()
        contentView.layer.cornerRadius = 10    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
