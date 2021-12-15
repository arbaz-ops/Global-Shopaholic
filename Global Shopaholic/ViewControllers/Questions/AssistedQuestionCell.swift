//
//  AssistedQuestionCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
class AssistedQuestionCell: UITableViewCell {

    @IBOutlet weak var DetailField: UITextView!
    @IBOutlet weak var SaveBtn: UIButton!
    @IBOutlet weak var PreviousBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
 
    @IBOutlet weak var QuestionField: DropDown!
    override func awakeFromNib() {
        super.awakeFromNib()
//        contentView.DropShadowView()
//        contentView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
