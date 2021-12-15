//
//  ShippingDimensions.swift
//  Global Shopaholic
//
//  Created by Ahsan on 10/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation

struct ShippingDimensions
{
    var Length,Heigth,Width: Int?
    var Weight: Float?
    init(weight:Float,length:Int,Heigth:Int,width:Int) {
        self.Weight = weight
        self.Length = length
        self.Heigth = Heigth
        self.Width = width
        
    }
}
