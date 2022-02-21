//
//  BankTransfer+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension BankTransferViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bankTransferCell = tableView.dequeueReusableCell(withIdentifier: "BankTransferTableViewCell") as? BankTransferTableViewCell
        return bankTransferCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
    
}
