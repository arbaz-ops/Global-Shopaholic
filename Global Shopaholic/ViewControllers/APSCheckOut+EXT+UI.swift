//
//  APSCheckOut+EXT+UI.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/30/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


extension ASPCheckOut{
    func setupUI(){
        SummaryView.DropShadowView()
        payBtn.layer.cornerRadius = 5
        paypalBtn.layer.cornerRadius = 5
        cardBtn.layer.cornerRadius = 5
        BankTransferBtn.layer.cornerRadius = 5
        bitCoinBtn.layer.cornerRadius = 5
        
        view.addSubview(bankTransferView)
        bankTransferView.DropShadowView()
        bankTransferView.layer.masksToBounds = true
        bankTransferView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        bankTransferView.layer.cornerRadius = 20
        
        bankTransferView.translatesAutoresizingMaskIntoConstraints = false
        BottomConstraintWhenToShowBankTransferView = bankTransferView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        BottomConstraintWhenToHideBankTransferView = bankTransferView.topAnchor.constraint(equalTo: view.bottomAnchor)
        bankTransferView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        bankTransferView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        bankTransferView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.88).isActive = true
        BottomConstraintWhenToShowBankTransferView?.isActive = false
        BottomConstraintWhenToHideBankTransferView?.isActive = true
        
        
        view.addSubview(CreditCardView)
        CreditCardView.translatesAutoresizingMaskIntoConstraints = false
        BottomConstraintWhenToShowDepositeCardView = CreditCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        BottomConstraintWhenToHideDepositeCardView = CreditCardView.topAnchor.constraint(equalTo: view.bottomAnchor)
        CreditCardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        CreditCardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        CreditCardView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.58).isActive = true
        BottomConstraintWhenToShowDepositeCardView?.isActive = false
        BottomConstraintWhenToHideDepositeCardView?.isActive = true
        
        
        
        
    }
    
    
    func validateBankData() -> Bool
    {
        
        if bankNameField.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "Please enter Bank name")
            return false
        }
        if transactionIDField.text!.isEmpty
        {
            COMMON_ALERT.showAlert(msg: "Please enter transaction ID")

            return false
        }
        if term == false{
            COMMON_ALERT.showAlert(msg: "Please certify the given data")
            return false
        }
        if (self.bankModelData?.bankRecieptImage) == nil{
            COMMON_ALERT.showAlert(msg: "please select the image")
            
            return false
        }
        print(self.bankModelData?.bankRecieptImage as Any)

        return true
    }
    
    
    
    
    func validateCC() -> Bool
    {
        
        if CreditCardAmountField.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "Please enter Amount")
            return false
        }
        if CreditCardNumberField.text!.isEmpty
        {
            COMMON_ALERT.showAlert(msg: "Please enter credit card number")

            return false
        }
        if CreditCardHolderName.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "Please enter card holder name")
            return false
        }
        if CreditCardExpMonthField.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "Please enter card expiry month")
            
            return false
        }
        if CreditCardExpYearField.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "Please enter card expiry year")
            return false
        }
        if CreditCardCVCField.text!.isEmpty{
            COMMON_ALERT.showAlert(msg: "please enter CVC number")
            return false
        }

        return true
    }
}
