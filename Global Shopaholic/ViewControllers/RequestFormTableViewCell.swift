//
//  RequestFormTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 06/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class RequestFormTableViewCell: UITableViewCell {

    @IBOutlet weak var specialServices: UILabel!
    @IBOutlet weak var destinationAddress
    : UILabel!
    @IBOutlet weak var customValue: UILabel!
    @IBOutlet weak var consolidatedPackages: UILabel!
    @IBOutlet weak var requestId: UILabel!
    @IBOutlet weak var shipmentInvoiceViewBox: UIView!
    @IBOutlet weak var shipmentBoxViewBox: UIView!
    @IBOutlet weak var speacialServiceViewBox: UIView!
    @IBOutlet weak var destinationAddressViewBox: UIView!
    @IBOutlet weak var viewBox1: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        viewBox1.layer.cornerRadius = 12
        destinationAddressViewBox.layer.cornerRadius = 10
        speacialServiceViewBox.layer.cornerRadius = 12
        shipmentBoxViewBox.layer.cornerRadius = 10
        shipmentInvoiceViewBox.layer.cornerRadius = 10
        specialServices.text = "sasdgahjsgajgdshjgadjasghjdgsajhgdhjsagjdhsgajdgsjhagdjhsgajhdgsjagdjhsagjhdsgjdhsgahjdgshjagdjhsgajhdgsjhagdhjsagjhgdsjhagdjhsgajhdgsjahgdjsagjhdgsajhgdjhsaghjdgsajhgdhjasgjhdg"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
