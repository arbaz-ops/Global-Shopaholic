//
//  walletcv+CollectionView+Ext.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

extension WalletVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cardList != nil{
            
            if cardList.count > 0 {
                CollectionViewHeightConstraint.constant = 170
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }else{
                
                CollectionViewHeightConstraint.constant = 0
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
            return cardList.count
        }
        return 0
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nib1 = UINib(nibName: "CreditCardsCell", bundle: nil)
               collectionView.register(nib1, forCellWithReuseIdentifier: "CreditCardsCell")
        let cell: CreditCardsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditCardsCell", for: indexPath) as! CreditCardsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

            //Briefly fade the cell on selection
            UIView.animate(withDuration: 0.1,
                           animations: {
                            //Fade-out
                            cell?.alpha = 0.5
            }) { (completed) in
                UIView.animate(withDuration: 0.1,
                               animations: {
                                //Fade-out
                                cell?.alpha = 1
                })
            }
    }
}
