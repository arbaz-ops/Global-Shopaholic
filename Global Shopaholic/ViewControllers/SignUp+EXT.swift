//
//  SignUp+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation


import UIKit

extension SignupVC: RegistrationRequestDelegate
{
    func DidFailtoRequest(RegisterResponse: RegisterRequestResponse?) {
        COMMON_ALERT.showAlert(msg: (RegisterResponse?.message)!)
    }
    
    func DidFinishedHTTPRequest(response: NSDictionary) {
        
        let viewController = (self.storyboard?.instantiateViewController(withIdentifier: "AccountCreateVC"))!
        self.navigationController?.fadeTo(viewController)
        
        print("DONE DONE DONE")
    }
    
    
}
