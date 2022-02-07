//
//  CustomView.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class CustomCardViews: UIView {
    
   

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
   
}
