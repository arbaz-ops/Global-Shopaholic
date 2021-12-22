//
//  EditAddress+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

extension EditAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let editAddressCell = tableView.dequeueReusableCell(withIdentifier: "EditAddressTableViewCell", for: indexPath) as? EditAddressTableViewCell
        return editAddressCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
