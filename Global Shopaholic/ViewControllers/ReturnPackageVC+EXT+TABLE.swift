//
//  ReturnPackageVC+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 08/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension ReturnPackageViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let returnPackageCell = tableView.dequeueReusableCell(withIdentifier: "ReturnPackageTableViewCell", for: indexPath) as? ReturnPackageTableViewCell
        return returnPackageCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
