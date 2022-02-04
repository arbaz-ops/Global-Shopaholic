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
    
    
    @IBInspectable var borderColor: CGColor = UIColor.white.cgColor {
        didSet {
            self.layer.borderColor = hexStringToUIColor(hex: "#3B525A").cgColor
        }
    }
}
