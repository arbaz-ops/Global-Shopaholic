//
//  BoxCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 10/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class BoxCell: UITableViewCell {
    
    @IBOutlet weak var ContainerV: UIView!
    @IBOutlet weak var HeigthLbl: UILabel!
    @IBOutlet weak var WidthLbl: UILabel!
    @IBOutlet weak var LengthLbl: UILabel!
    @IBOutlet weak var WeightLbl: UILabel!
    @IBOutlet weak var IndexLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ContainerV.layer.cornerRadius = 10
        ContainerV.DropShadowView()
        
        IndexLbl.layer.cornerRadius = 10
        IndexLbl.layer.masksToBounds = true
        
        
      
        WeightLbl.layer.cornerRadius = 10
        WeightLbl.layer.masksToBounds = true
        
      
       
        LengthLbl.layer.cornerRadius = 10
        LengthLbl.layer.masksToBounds = true
      
        WidthLbl.layer.cornerRadius = 10
        WidthLbl.layer.masksToBounds = true
     
        HeigthLbl.layer.cornerRadius = 10
        HeigthLbl.layer.masksToBounds = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
