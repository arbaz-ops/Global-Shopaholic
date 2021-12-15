//
//  AddCardVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

import RappleProgressHUD

protocol addCardDelegate {
    func didAddedCard(response:NSDictionary)
    func didfailedToAddCard(errorResponse: AddCreditCardResponse)
}

struct addCardVM{
    var delegate: addCardDelegate?
    
    
    func addCard(token: String,cardRequest: AddCreditCardRequest)
    {
        let validationResult = cardValidation().Validation(registerRequest: cardRequest)
        if validationResult.success{
            
            
         self.addCardFinal(cardRequest: cardRequest, token: token)
        }
        else{
         self.delegate?.didfailedToAddCard(errorResponse: AddCreditCardResponse(message: validationResult.error))
        }

    }
    private func addCardFinal(cardRequest:AddCreditCardRequest,token: String)
    {
        print("Updating")
        var type = ""
        if cardRequest.cardNumber?.prefix(1) == "4"
        {
            type = "visa"
        }
        else if cardRequest.cardNumber?.prefix(1) == "5"
        {
            type = "mastercard"

        }
        
        let loginep = endpoints()
        let param = ["number":cardRequest.cardNumber!,"name":cardRequest.accountHolderName!,"expiry":"\(cardRequest.expDate!)/\(cardRequest.expYear!)","cvc":cardRequest.cvcNumber!,"type":type]
        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrl(Token: token, strURL: loginep.addcardEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                
                self.delegate?.didAddedCard(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didfailedToAddCard(errorResponse: AddCreditCardResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
}
