//
//  CardListVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/27/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

protocol cardListDelegate {
    func didGetlist(response: NSDictionary)
    func didFailToGetList(msg: String)
}


struct cardListVM{
    var delegate: cardListDelegate?
    
    func getList(token: String)
    {
        let loginep = endpoints()
        let param = ["":""]
      
        WebService.RequestWithTokenJson(Token: token, strURL: loginep.cardListEP, is_loader_required: false, params: param) { (response) in
            print(response)
            if (response["success"] as! Bool) == true
            {
                self.delegate?.didGetlist(response: response)
            }
            else{
                self.delegate?.didFailToGetList(msg: (response["message"] as! String))
            }
        } failure: { (error) in
            print("something bad happend")
        }
    }
}
