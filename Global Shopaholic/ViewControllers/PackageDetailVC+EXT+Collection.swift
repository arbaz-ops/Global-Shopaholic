//
//  PackageDetailVC+EXT+Collection.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 27/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension PackageDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return packages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let packageDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PackageDetailCollectionViewCell", for: indexPath) as? PackageDetailCollectionViewCell
        packageDetailCell?.indexPath = indexPath
        print(indexPath.row)
        
        print(packages[indexPath.row])
        
        packageDetailCell?.packageDetailCollectionViewCellDelegate = self
        if let primaryThumbnail = packages[indexPath.row]["primary_thumbnail"] as? [String: Any],
        let thumbnailImage = primaryThumbnail["image_name"] as? String,
           let trackingNumber = packages[indexPath.row]["tracking_number"] as? String,
           let storageRemaining = packages[indexPath.row]["storageLeft"] as? Int
           {
            
            packageDetailCell?.storageRemainingLabel.text = "\(storageRemaining)"
            packageDetailCell?.packageImageView.sd_setImage(with: URL(string: thumbnailImage), placeholderImage: UIImage())
            print(trackingNumber)
            packageDetailCell?.trackingNumberLabel.text = "TN: \(trackingNumber)"
            packageDetailCell?.changeUI(status: packageStatus)
        }
        else {
            print(requestList)
            
            if let fullImages = packages[indexPath.row]["full_images"] as? [[String: Any]],
               
               let trackingNumber = packages[indexPath.row]["tracking_number"] as? String,
               let storageRemaining = packages[indexPath.row]["storageLeft"] as? Int
               {
                if  let imageName = fullImages[indexPath.row]["image_name"] as? String{
                    packageDetailCell?.packageImageView.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage())
                } else {
                    packageDetailCell?.packageImageView.sd_setImage(with: URL(string: ""), placeholderImage: UIImage())
                }
                packageDetailCell?.storageRemainingLabel.text = "\(storageRemaining)"
               
                packageDetailCell?.trackingNumberLabel.text = "TN: \(trackingNumber)"

                packageDetailCell?.changeUI(status: packageStatus)

            }
               
        }
        return packageDetailCell!
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
          
                return UIEdgeInsets(top: 1.0, left: 10.0, bottom: 1.0, right: 10.0)
            
          
    }
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
                let lay = collectionViewLayout as! UICollectionViewFlowLayout
                /// 5
                let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
                /// 6
                return CGSize(width: widthPerItem - 5, height: 240)
        }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
}
