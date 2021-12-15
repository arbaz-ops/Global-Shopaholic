//
//  CancelledCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/15/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CancelledCell: UITableViewCell {

    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var aspIdLbl: UILabel!
    @IBOutlet weak var MainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        MainView.DropShadowView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getFormattedDate(format: String) -> String {
     let dateFormatterGet = DateFormatter()
     dateFormatterGet.dateFormat = "MMM dd,yyyy hh:mm:ss a"

     let dateFormatterPrint = DateFormatter()
     dateFormatterPrint.dateFormat = "MMM dd,yyyy"
    
     let date: NSDate? = dateFormatterGet.date(from: format) as NSDate?
     
     return dateFormatterPrint.string(from: date! as Date)
     }
}
