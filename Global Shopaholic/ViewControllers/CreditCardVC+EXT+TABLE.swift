//
//  CreditCardVC+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 14/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension CreditCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let creditCardCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardTableViewCell") as? CreditCardTableViewCell
        return creditCardCell!
    }
    
    
}
