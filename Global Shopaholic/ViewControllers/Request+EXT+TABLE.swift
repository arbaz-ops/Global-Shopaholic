//
//  Request+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 07/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension RequestFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let requestFormCell = tableView.dequeueReusableCell(withIdentifier: "RequestFormTableViewCell", for: indexPath) as? RequestFormTableViewCell
        
        if let consolidation = reviewRequestList!["consolidation"] as? [String: Any],
        let unique_key = consolidation["unique_key"] as? String,
        let totalPackage = consolidation["packageCount"] as? Int,
        let packages = consolidation["packages"] as? [[String: Any]],
        let packageCustomDetails = packages[0]["package_custom_detail"] as? [[String: Any]],
        let address = consolidation["address"] as? [String: Any],
        let country = address["country"],
        let city = address["city"],
        let street = address["street"],
        let zipCode = address["zip_code"],
        let specialInstruction = consolidation["special_instructions"] as? String,
        let boxDetail = consolidation["box_detail"] as? [[String: Any]],
        let totalShippingCharges = reviewRequestList!["total_shipping_charges"] as? Double,
        let processingCharges = reviewRequestList!["processing_charges"] as? Int,
        let expressProcessingFee = reviewRequestList!["express_processing_fee"] as? Int,
        let vatCharges = reviewRequestList!["vat_charges"] as? Double,
           let totalPaidServices = reviewRequestList!["total_paid_service"] as? Int

            
        {
            if packageCustomDetails.count < 1 {
                requestFormCell?.customValue.text = "$ 0"
            }
            else {
                if let customValue = packageCustomDetails[0]["value"] as? String {
                    requestFormCell?.customValue.text = "$ \(String(describing: customValue))"
                }
            }
            if specialInstruction == "" {
                requestFormCell?.specialServices.text = "NUN"
            }
            else {
                requestFormCell?.specialServices.text = specialInstruction

            }

            requestFormCell?.destinationAddress.text = "\(street), \(city), \(country), \(zipCode)"
            requestFormCell?.requestId.text = unique_key
            requestFormCell?.consolidatedPackages.text = String.init(totalPackage)
            requestFormCell?.boxeDetail = boxDetail
            requestFormCell?.estimatedShippingCharges.text = "$ \(Int.init(totalShippingCharges))"
            requestFormCell?.expressProcessingCharges.text = "$ \(expressProcessingFee)"
            requestFormCell?.processingCharges.text = "$ \(processingCharges)"
            requestFormCell?.vatCharges.text = "$ \(vatCharges)"
            requestFormCell?.paidServices.text = "$ \(totalPaidServices)"

            let totalCost = Int(totalShippingCharges) + processingCharges + expressProcessingFee + Int.init(vatCharges) + totalPaidServices
            requestFormCell?.totalCost.text = "$ \(totalCost)"
            print(consolidation)
        }
        else {
            return UITableViewCell()
        }
        
        return requestFormCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
    
}
