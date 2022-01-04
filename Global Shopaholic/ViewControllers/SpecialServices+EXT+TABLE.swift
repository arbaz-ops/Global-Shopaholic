//
//  SpecialServices+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension SpecialServicesViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let specialServicesCell = tableView.dequeueReusableCell(withIdentifier: "SpecialServicesTableViewCell", for: indexPath) as? SpecialServicesTableViewCell
        return specialServicesCell!
    }
    
    
}
