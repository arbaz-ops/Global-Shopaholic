//
//  EditCustomDetails+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 01/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension EditCustomDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let editCustomFormCell = tableView.dequeueReusableCell(withIdentifier: "EditCustomDetailsTableViewCell") as? EditCustomDetailsTableViewCell
        editCustomFormCell?.trackingNumber.text = self.trackingNumber
        return editCustomFormCell!
    }
    
    
}
