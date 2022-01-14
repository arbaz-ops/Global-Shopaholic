//
//  StorageAndShipment+EXT+COLLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension StorageAndShipmentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upperCollectionView {
            return upperCollection.count
        }
        if collectionView == storageAndShipmentCollectionView  {
            return 1
        }
        else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upperCollectionView {
        let upperCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCollectionViewCell", for: indexPath) as? UpperCollectionViewCell
            upperCollectionViewCell!.containerView.DropShadowView()
            upperCollectionViewCell!.collectionImageView.image = upperCollection[indexPath.item].image
            upperCollectionViewCell!.collectionCellText.text = upperCollection[indexPath.item].text
        return upperCollectionViewCell!
        }
        if collectionView == storageAndShipmentCollectionView  {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)

        }
        else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)

        }

    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == upperCollectionView {
            return 20
        }
        else {
            return 0
        }
    }
    
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            let cellWidth: CGFloat = 170.0

            let numberOfCells = floor(view.frame.size.width / cellWidth)
            let edgeInsets = (view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

            return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
        }

   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let upperCollectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCollectionViewCell", for: indexPath) as? UpperCollectionViewCell else {
            return
        }
        upperCollectionView.containerView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
    }
    
    
    
}
