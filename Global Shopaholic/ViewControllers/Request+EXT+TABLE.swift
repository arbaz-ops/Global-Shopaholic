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
       
        requestFormCell!.requestId.text = packageList![atIndex!.row]["unique_key"] as? String
        requestFormCell!.consolidatedPackages.text = "\( packageList![atIndex!.row]["packageCount"]! as! Int)"
        if let address = packageList![atIndex!.row]["address"] as? [String: Any] {
            requestFormCell?.destinationAddress.text = "\(address["street"]!), \(address["city"]!), \(address["country"]!), \(address["zip_code"]!)"
            
        }
       
        if let packages = packageList![atIndex!.row]["packages"] as? [[String: Any]] {
            let packagesCustomDetail = packages[0]["package_custom_detail"] as? [[String:Any]]
            if packagesCustomDetail!.count < 1 {
                requestFormCell?.customValue.text = "NA"
            }
            else {
            if let packageCustomValue = packagesCustomDetail?[0]["value"] {
                requestFormCell?.customValue.text = "$ \(packageCustomValue)"
            }
            }

        }
        
        else {
            requestFormCell?.customValue.text = "NA"
        }
        
        
        
//        let packagesCustomDetail = packages["package_custom_detail"]
        
        return requestFormCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
