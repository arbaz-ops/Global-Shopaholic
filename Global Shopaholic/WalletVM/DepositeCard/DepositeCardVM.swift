//
//  DepositeCardVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 5/18/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD


protocol DepositeCardDelegate {
    func didCardDepositeSuccessfully(response:NSDictionary)
    func didCardfailedToDeposite(errorResponse: DepositeCreditCardResponse)
}


struct DepositeCardVM{
    var delegate: DepositeCardDelegate?
    
    func addCard(token: String,cardRequest: DepositeCreditCardRequest)
    {
        let validationResult = DespositeCardValidation().Validation(registerRequest: cardRequest)
        if validationResult.success{
            
            
         self.depositeAmount(cardRequest: cardRequest, token: token)
        }
        else{
         self.delegate?.didCardfailedToDeposite(errorResponse: DepositeCreditCardResponse(message: validationResult.error))
        }

    }
    private func depositeAmount(cardRequest:DepositeCreditCardRequest,token: String){
        let EP = endpoints()
        let param = ["number":cardRequest.cardNumber!,"name":cardRequest.accountHolderName!,"expiry":cardRequest.expDate!,"cvc":cardRequest.cvcNumber!,"amount":cardRequest.amount!]
        RappleActivityIndicatorView.startAnimating()
        WebService.requestPostUrl(Token: token, strURL: EP.cardDepositeEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                
                self.delegate?.didCardDepositeSuccessfully(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.didCardfailedToDeposite(errorResponse: DepositeCreditCardResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
    
    
}
