//
//  AddressesCell.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class AddressesCell: UITableViewCell {
    @IBOutlet weak var CellView: UIView!
   
    @IBOutlet weak var ApprovedAddressBtn: UIButton!
    @IBOutlet weak var EditBtn: UIButton!
    @IBOutlet weak var SwipeRightLbl: UILabel!
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var SwipeLeft: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var CompleteAddressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DetailView.layer.cornerRadius = 10
        DetailView.clipsToBounds = true
        self.CellView.layer.cornerRadius = 10
        self.CellView.layer.masksToBounds = true
        self.CellView.ViewShadoww()
//        EditBtn.layer.cornerRadius = EditBtn.frame.height / 2
//        DeleteBtn.layer.cornerRadius = DeleteBtn.frame.height / 2
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
