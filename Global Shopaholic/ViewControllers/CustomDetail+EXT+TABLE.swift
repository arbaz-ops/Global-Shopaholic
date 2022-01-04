//
//  CustomDetail+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension CustomDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customDetailCell = tableView.dequeueReusableCell(withIdentifier: "CustomDetailTableViewCell", for: indexPath) as? CustomDetailTableViewCell
        customDetailCell?.trackingNumber.text = trackingNumber
        customDetailCell?.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        
        return customDetailCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
