//
//  SubRow.swift
//  NOOB
//
//  Created by Ahsan Minhas on 24/02/2021.
//

import UIKit

class SubRow: UITableViewCell {

    @IBOutlet weak var QuestionsLbl: UILabel!
    @IBOutlet weak var AnswerLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
