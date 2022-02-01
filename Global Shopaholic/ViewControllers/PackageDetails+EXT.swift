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
    func editCustomDetailTapped(cell: UICollectionViewCell) {
        let cell = cell as! PackageDetailCollectionViewCell
        let editCustomDetailVC = storyboard?.instantiateViewController(withIdentifier: "EditCustomDetailsViewController") as? EditCustomDetailsViewController
        editCustomDetailVC?.modalPresentationStyle = .overFullScreen
        self.present(editCustomDetailVC!, animated: true, completion: nil)

    }
    
    
}
