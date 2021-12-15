//
//  wallet+AddCard+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit



extension WalletVC: addCardDelegate{
    func didAddedCard(response: NSDictionary) {
        print("")
    }
    
    func didfailedToAddCard(errorResponse: AddCreditCardResponse) {
        COMMON_ALERT.showAlert(msg: "\(errorResponse.message!)")
    }
    
    
}

extension WalletVC: cardListDelegate{
    
    func didGetlist(response: NSDictionary) {
        print(response)
        let data = (response["data"] as! NSDictionary)
        cardList = (data["list"] as! NSArray)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    func didFailToGetList(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    
}


extension WalletVC{
    func setupPopUps()
    {
        view.addSubview(DepositeCardView)
        DepositeCardView.DropShadowView()
        DepositeCardView.layer.masksToBounds = true
        DepositeCardView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        DepositeCardView.layer.cornerRadius = 20
        
        DepositeCardView.translatesAutoresizingMaskIntoConstraints = false
        BottomConstraintWhenToShowDepositeCardView = DepositeCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        BottomConstraintWhenToHideDepositeCardView = DepositeCardView.topAnchor.constraint(equalTo: view.bottomAnchor)
        DepositeCardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        DepositeCardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        DepositeCardView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.58).isActive = true
        BottomConstraintWhenToShowDepositeCardView?.isActive = false
        BottomConstraintWhenToHideDepositeCardView?.isActive = true
        
        
        
        view.addSubview(BankTransferView)
        BankTransferView.DropShadowView()
        BankTransferView.layer.masksToBounds = true
        BankTransferView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        BankTransferView.layer.cornerRadius = 20
        
        BankTransferView.translatesAutoresizingMaskIntoConstraints = false
        BottomConstraintWhenToShowBankTransferView = BankTransferView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        BottomConstraintWhenToHideBankTransferView = BankTransferView.topAnchor.constraint(equalTo: view.bottomAnchor)
        BankTransferView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        BankTransferView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        BankTransferView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.88).isActive = true
        BottomConstraintWhenToShowBankTransferView?.isActive = false
        BottomConstraintWhenToHideBankTransferView?.isActive = true
        
        
    }
    
    
    
    func hideDepositeView()
    {
        BottomConstraintWhenToShowDepositeCardView?.isActive = false
        BottomConstraintWhenToHideDepositeCardView?.isActive = true
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    func hideBankTransferView()
    {
        BottomConstraintWhenToShowBankTransferView?.isActive = false
        BottomConstraintWhenToHideBankTransferView?.isActive = true
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
