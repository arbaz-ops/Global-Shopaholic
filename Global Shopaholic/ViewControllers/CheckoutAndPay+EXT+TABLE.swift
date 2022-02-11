//
//  CheckoutAndPay+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension CheckoutAndPayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let checkoutAndPayCell = tableView.dequeueReusableCell(withIdentifier: "CheckoutAndPayTableViewCell") as? CheckoutAndPayTableViewCell
        
        return checkoutAndPayCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
