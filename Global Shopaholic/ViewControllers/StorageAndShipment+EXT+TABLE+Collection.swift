//
//  StorageAndShipment+EXT+COLLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension StorageAndShipmentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upperCollectionView {
            return upperCollection.count
        }
        if collectionView == storageAndShipmentCollectionView  {
            return packagesList.count
        }
        else {
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upperCollectionView  {
            
            let upperCollectionViewCell = upperCollectionView.dequeueReusableCell(withReuseIdentifier: "UpperCollectionViewCell", for: indexPath) as? UpperCollectionViewCell
                upperCollectionViewCell!.containerView.DropShadowView()
                upperCollectionViewCell!.collectionImageView.image = upperCollection[indexPath.item].image
                upperCollectionViewCell!.collectionCellText.text = upperCollection[indexPath.item].text
            
            return upperCollectionViewCell!
            
        }
        
        else if collectionView == storageAndShipmentCollectionView {
            switch currentSelection {
            case .Storage:
                let myStorageCell = storageAndShipmentCollectionView.dequeueReusableCell(withReuseIdentifier: "MyStorageCollectionViewCell", for: indexPath) as? MyStorageCollectionViewCell
                let width = calculateWidth()
                if selectedIndex.contains(indexPath.row) {
                    print("yes it contains")
                    myStorageCell?.checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
                }
                else if !selectedIndex.contains(indexPath.row) {
                    myStorageCell?.checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                }
                myStorageCell?.indexPath = indexPath
                myStorageCell?.storageRemainingLabel.text = "\(packagesList[indexPath.row]["storageLeft"] ?? "NAN")"
                myStorageCell!.storageCollectionViewCellDelegate = self
               myStorageCell!.myStorageImageView.frame.size.width = width
                myStorageCell?.trackingNumber.text = "TN: \(packagesList[indexPath.row]["tracking_number"] as! String)"
                let primaryFullImage = packagesList[indexPath.row]["primary_full_image"] as? [String: Any]
                if let imageName = primaryFullImage?["image_name"] as? String {
                    myStorageCell?.myStorageImageView.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage())
                }
               
                return myStorageCell!
                
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
            }
            
           
  
        }
            
        else {
            return UICollectionViewCell()
        }
    }
   
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == upperCollectionView {
            return 20
        }
        
        else {
            return CGFloat()
        }
    }
    
    
    
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            
            if collectionView == upperCollectionView {
     
            let cellWidth: CGFloat = 170.0

            let numberOfCells = floor(view.frame.size.width / cellWidth)
            let edgeInsets = (view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

            return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
                
            }
            else if collectionView == storageAndShipmentCollectionView {
                switch currentSelection {
                case .Storage:
                    return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
                
                default:
                    return UIEdgeInsets()
                }
            }
            
            else {
                return UIEdgeInsets()
            }
        }

    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == storageAndShipmentCollectionView {
            
            
            switch currentSelection {
            case .Storage:
                let lay = collectionViewLayout as! UICollectionViewFlowLayout
                /// 5
                let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
                /// 6
                return CGSize(width: widthPerItem - 5, height: 320)
         
            default:
                return CGSize()
            }
                
               
           
            
        }
        
        else if collectionView == upperCollectionView {
            return CGSize()
        }
        else {
          return  CGSize()
        }
        }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == upperCollectionView {
        if indexPath.item == 0 {
            self.currentSelection = .Storage
            setCurrentSelection()
        }
        if indexPath.item == 1 {
            self.currentSelection = .Outgoing
            setCurrentSelection()
        }
        if indexPath.item == 2 {
            self.currentSelection = .Shipped
            setCurrentSelection()
        }
        if indexPath.item == 3 {
            self.currentSelection = .Delivered
            setCurrentSelection()
        }
        if indexPath.item == 4 {
            self.currentSelection = .Cancelled
            setCurrentSelection()
        }
        if indexPath.item == 5 {
            self.currentSelection = .Return
            setCurrentSelection()
        }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        if collectionView == upperCollectionView {
            guard let upperCollectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCollectionViewCell", for: indexPath) as? UpperCollectionViewCell else {
                return
            }
            upperCollectionView.containerView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        }
        if collectionView == storageAndShipmentCollectionView {
            if currentSelection == .Storage {
              
               
            }
        }
    
    }
    
    
    // Storage and shippment table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentSelection {
        case .Outgoing:
            
            return packagesList.count
        case .Shipped:
           
            return packagesList.count
        case .Delivered:
            
            return packagesList.count
        case .Cancelled:
           
            return packagesList.count
        default:
            return 0

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch currentSelection {
        case .Outgoing:
            let outgoingCell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTableViewCell") as? OutgoingTableViewCell
            DispatchQueue.main.async {[self] in
                outgoingCell?.indexPath = indexPath
                outgoingCell?.outgoingTableViewCellDelegate = self
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                outgoingCell?.requestId.text = packagesList[indexPath.row]["unique_key"] as? String
                outgoingCell?.createdDate.text = formattedDate
               
                if packagesList[indexPath.row]["status"] as? String == "preparing" {
                    tableView.beginUpdates()
                    outgoingCell?.checkStatus(status: .Preparing)
                    tableView.endUpdates()
                }
                else if packagesList[indexPath.row]["status"] as? String == "payment_pending" {
                    tableView.beginUpdates()
                    outgoingCell?.checkStatus(status: .PendingPayment)

                    tableView.endUpdates()

                }
                else if packagesList[indexPath.row]["status"] as? String == "processing" {
                    tableView.beginUpdates()
                    outgoingCell?.checkStatus(status: .Processing)

                    tableView.endUpdates()

                }
                else if packagesList[indexPath.row]["status"] as? String == "payment_done" {
                    tableView.beginUpdates()
                    outgoingCell?.checkStatus(status: .PaymentDone)
                    tableView.endUpdates()

                }
            }
            return outgoingCell!
        case .Shipped:
            let shippedCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            shippedCell?.markAsDeliveredButton.isHidden = false
            shippedCell?.shippedViewHeightConstraint.constant = 174.98
            DispatchQueue.main.async {[self] in
                print(indexPath.row)
                shippedCell?.trackingIdNumber.text = self.packagesList[indexPath.row]["tracking_number"] as? String ?? "NUN"
                
                shippedCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                shippedCell?.createdDate.text = formattedDate
//                shippedCell?.trackingIdNumber.text = packages?[0]["tracking_number"] as? String ?? "NUN"
            }
            return shippedCell!
            
        case .Delivered:
            let delieverdCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            delieverdCell?.markAsDeliveredButton.isHidden = true
            delieverdCell?.shippedViewHeightConstraint.constant = 140
            delieverdCell?.trackingIdLabel.isHidden = false
            delieverdCell?.trackingIdNumber.isHidden = false
            DispatchQueue.main.async { [self] in
//                let packages = self.packagesList[indexPath.row]["packages"] as? [[String: Any]]
                delieverdCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                delieverdCell?.createdDate.text = formattedDate
                delieverdCell?.trackingIdNumber.text = self.packagesList[indexPath.row]["tracking_number"] as? String ?? "NUN"
                
            }
            return delieverdCell!
        case .Cancelled:
            let cancelledCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            cancelledCell?.markAsDeliveredButton.isHidden = true
            cancelledCell?.trackingIdLabel.isHidden = true
            cancelledCell?.trackingIdNumber.isHidden = true
            cancelledCell?.shippedViewHeightConstraint.constant = 105
            DispatchQueue.main.async {[self] in
                cancelledCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                cancelledCell?.createdDate.text = formattedDate
            }
            return cancelledCell!
        default:
            return UITableViewCell()

        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
