//
//  PackageDetails+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 01/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension PackageDetailsViewController: PackageDetailCollectionViewCellDelegate {
    func editCustomDetailTapped(atIndex: IndexPath) {
       
        print(atIndex.row)
        
        let editCustomDetailVC = storyboard?.instantiateViewController(withIdentifier: "EditCustomDetailsViewController") as? EditCustomDetailsViewController
        editCustomDetailVC?.trackingNumber = packages[atIndex.row]["tracking_number"] as? String
        editCustomDetailVC?.modalPresentationStyle = .overFullScreen
        self.present(editCustomDetailVC!, animated: true, completion: nil)

    }
    
    
}
