//
//  MyStorageCollectionViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class MyStorageCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionCellText: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var myStorageCellView: UIView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                containerView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            }
            else {
                containerView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")

            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
        myStorageCellView.backgroundColor = .clear
        containerView.DropShadowView()
        

        // shadow
        
        
        // Initialization code
    }

}
