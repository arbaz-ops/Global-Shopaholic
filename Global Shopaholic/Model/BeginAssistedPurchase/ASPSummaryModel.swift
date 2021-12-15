//
//  ASPSummaryModel.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/23/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


struct ASPSummaryModel{
    var itemUrl = [String]() ,itemCategory = [String]() ,itemName = [String]() ,itemQuantity = [String]() ,itemSize = [String]() ,itemColor = [String]() ,itemPrice = [String]()
    var ShippingAmount,selectedService,promocodeName,promocodeType,promocodeAmount,missingItemAction,missingItemDetail: String?
    var aspID: String?
}
