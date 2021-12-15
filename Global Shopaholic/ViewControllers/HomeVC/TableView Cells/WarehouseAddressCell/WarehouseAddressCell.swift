//
//  WarehouseAddressCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class WarehouseAddressCell: UITableViewCell {
   
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var ZipCode: UILabel!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var Howto: UIButton!
    @IBOutlet weak var CompanyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailView.layer.cornerRadius = 10
        contentView.backgroundColor = .clear
        
       
        DetailView.DropShadowView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
