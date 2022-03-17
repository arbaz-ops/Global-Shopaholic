//
//  ConsolidateAndShipVC+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 16/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension ConsolidateAndShipViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let consolidateAndShipCell = tableView.dequeueReusableCell(withIdentifier: "ConsolidateAndShipTableViewCell") as? ConsolidateAndShipTableViewCell
        return consolidateAndShipCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
