//
//  FAQModel.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 24/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
struct FAQModel {
    let Header:String
    let title: [String]?
    var description: [String]?
    var isExpanded = false
    init(_ text: [String], items: [String]? = nil, Header:String) {
        self.title = text
        self.description = items
        self.Header = Header
    }
}
