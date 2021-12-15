//
//  IncomingPackageCell.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 19/03/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class IncomingPackageCell: UITableViewCell {

    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var DispatchBtn: UIButton!
    @IBOutlet weak var SpecialInsturctionsField: UITextField!
    @IBOutlet weak var TrackNumberField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentView.layer.cornerRadius = 10
        ContentView.DropShadowView()
        // Initialization code
        DispatchBtn.layer.cornerRadius = 5
        DispatchBtn.layer.borderWidth = 0.2
        DispatchBtn.layer.borderColor = UIColor.lightGray.cgColor
        SubmitBtn.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
