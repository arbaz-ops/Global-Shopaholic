//
//  Request+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 07/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

extension RequestFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let requestFormCell = tableView.dequeueReusableCell(withIdentifier: "RequestFormTableViewCell", for: indexPath) as? RequestFormTableViewCell
        
        if let consolidation = reviewRequestList!["consolidation"] as? [String: Any],
           let uniqueKey = consolidation["unique_key"] as? String,
           let packagesConsolidated = consolidation["packageCount"] as? Int,
           let packages = consolidation["packages"] as? [[String: Any]],
           let packagesCustomDetail = packages[0]["package_custom_detail"],
           let customValue = packagesCustomDetail[0]["value"],
           
    
        
        return requestFormCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
