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
        
        if let uniqueKey = packageList![atIndex!.row]["unique_key"] as? String,
           let consolidatedPackages = packageList![indexPath.row]["packageCount"]! as? Int,
           let specialService = packageList![atIndex!.row]["special_instructions"] as? String,
           let address = packageList![atIndex!.row]["address"] as? [String: Any],
           let street = address["street"], let city = address["city"],
           let country = address["country"], let zipCode = address["zip_code"],
           let packages = packageList![atIndex!.row]["packages"] as? [[String: Any]],
           let packagesCustomDetail = packages[0]["package_custom_detail"] as? [[String:Any]],
           let boxDetails = packageList![atIndex!.row]["box_detail"] as? [[String: Any]]
          
        {
            print(packageList![atIndex!.row]["unique_key"])
            
            requestFormCell!.requestId.text = uniqueKey
            requestFormCell?.consolidatedPackages.text = "\(consolidatedPackages)"
            requestFormCell?.destinationAddress.text = "\(street), \(city), \(country), \(zipCode)"
            
            if specialService == "" {
                requestFormCell?.specialServices.text = "NA"
            }else {
                requestFormCell?.specialServices.text = specialService
            }
            
            if packagesCustomDetail.count < 1 {
                requestFormCell?.customValue.text = "NA"
            }
            else {
                if let packageCustomValue = packagesCustomDetail[0]["value"] as? String {
                    requestFormCell?.customValue.text = packageCustomValue
                }
                else {
                    requestFormCell?.customValue.text = "NA"
                }
            }
            
            if boxDetails.count > 1 {
               if let boxHeightFloat = boxDetails[0]["height"], let boxWidthFloat = boxDetails[0]["width"],
                let boxLengthFloat = boxDetails[0]["length"],
                  let actualWeight = boxDetails[0]["actual_weight"] {
                   let boxWidth = String(format: "%.0f", boxWidthFloat as! CVarArg)
                   print(boxWidth)
//                   print(boxHeight)
//                   print(boxLength)
                   print(actualWeight)
               }
            }
            
        }
        
        
    
        
        
        
//        let packagesCustomDetail = packages["package_custom_detail"]
        
        return requestFormCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
