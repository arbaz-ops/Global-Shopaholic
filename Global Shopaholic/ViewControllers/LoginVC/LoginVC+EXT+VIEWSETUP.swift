//
//  LoginVC+EXT+VIEWSETUP.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import BetterSegmentedControl
import UIKit
extension LoginVC
{
    
    
    
//    
//    
     func LoginViewSetup()
     {
        self.RegistrationSubView.isHidden = true
        
        LoginNRegSegment.segments = LabelSegment.segments(withTitles: ["Login", "Register"],
                                                          normalTextColor: .gray,selectedTextColor: hexStringToUIColor(hex: "00BBA3"))
        RegisterButton.layer.cornerRadius = 10.0
        UISetup()
        view.addSubview(LoginSubView)
        LoginSubView.isHidden = true
        //TopConstraints = logo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80)
        showloginForm()
    }
    func UISetup()
    {
        RegTermsAndConditionBtn.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        RegTermsAndConditionBtn.layer.borderWidth = 0.2
        RegTermsAndConditionBtn.layer.cornerRadius = 2
        SignInBtn.layer.cornerRadius = 10.0
        SignUpBtn.layer.cornerRadius = 10.0
         EmailSnField.layer.cornerRadius = 10
        PasswordField.layer.cornerRadius = 10
        EmailSnField.DropShadowTextField()
        PasswordField.DropShadowTextField()
       // EmailSnField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        EmailSnField.setLeftPaddingPoints(20)
        PasswordField.setLeftPaddingPoints(20)
        
        
        RegFirstNameField.layer.cornerRadius = 10
        RegFirstNameField.DropShadowTextField()
        
        genderField.layer.cornerRadius = 10
        genderField.DropShadowTextField()
        RegLastNameField.layer.cornerRadius = 10
        RegLastNameField.DropShadowTextField()
        RegEmailField.layer.cornerRadius = 10
        RegEmailField.DropShadowTextField()
        RegPhoneNumberField.layer.cornerRadius = 10
        RegPhoneNumberField.DropShadowTextField()
        RegPasswordField.layer.cornerRadius = 10
        RegPasswordField.DropShadowTextField()
        RegConfirmPasswordField.layer.cornerRadius = 10
        RegConfirmPasswordField.DropShadowTextField()
        
        
        
        genderField.setLeftPaddingPoints(20)
        RegFirstNameField.setLeftPaddingPoints(20)
        RegLastNameField.setLeftPaddingPoints(20)
        RegEmailField.setLeftPaddingPoints(20)
        RegPhoneNumberField.setLeftPaddingPoints(20)
        RegPasswordField.setLeftPaddingPoints(20)
        RegConfirmPasswordField.setLeftPaddingPoints(20)
        
        
    }

    
    
    
    //
//    @IBOutlet weak var RegTermsAndConditionBtn: UIButton!
//    @IBOutlet weak var RegFirstNameField: UITextField!
//    @IBOutlet weak var RegLastNameField: UITextField!
//    @IBOutlet weak var RegEmailField: UITextField!
//    @IBOutlet weak var RegPhoneNumberField: UITextField!
//    @IBOutlet weak var RegPasswordField: UITextField!
//    @IBOutlet weak var RegConfirmPasswordField: UITextField!
//    func LogoAnimation()
//    {
//        Width.constant = 155
//        Height.constant = 59
//
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: {finish in
//            self.Width.constant = 250
//            self.Height.constant = 95
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }, completion: {fini in
//                self.Width.constant = 155
//                self.Height.constant = 59
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//                               self.view.layoutIfNeeded()
//                }, completion: {fini in
//                    self.Width.constant = 250
//                    self.Height.constant = 95
//                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//                                   self.view.layoutIfNeeded()
//                    }, completion: {fin in
//                        self.MoveUP()
//                    })
//
//                })
//            })
//        })
//    }
//
//
//
//    func MoveUP()
//       {
//
//           self.Horizontal.isActive = false
//           TopConstraints?.isActive = true
//           UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//
//               self.view.layoutIfNeeded()
//           }, completion: {finished in
//            let userDefaults = UserDefaults()
//            if  userDefaults.object(forKey: "user_data") != nil {
//
//                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
//                let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
//
//                       UIApplication.shared.windows.first?.rootViewController = viewController
//                       UIApplication.shared.windows.first?.makeKeyAndVisible()
////                let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
////                user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
////                print(user_data.token!)
//
//            }else{
//                self.showloginForm()
//            }
//
//
//           })
//       }
       func showloginForm()
       {
        LoginSubView.translatesAutoresizingMaskIntoConstraints = false
               LoginSubView.topAnchor.constraint(equalTo: LoginNRegSegment.bottomAnchor, constant: 25).isActive = true
            LoginSubView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
            LoginSubView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
                //loginSubView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        LoginSubView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        LoginSubView.isHidden = false

        self.view.addSubview(BottomImage)
        BottomImage.translatesAutoresizingMaskIntoConstraints = false
        BottomImage.topAnchor.constraint(equalTo: LoginSubView.bottomAnchor, constant: 10).isActive = true
        BottomImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        BottomImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
                //loginSubView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        BottomImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        BottomImage.isHidden = false
        
        self.view.addSubview(RegistrationSubView)
        RegistrationSubView.translatesAutoresizingMaskIntoConstraints = false
        RegistrationSubView.topAnchor.constraint(equalTo: LoginNRegSegment.bottomAnchor, constant: 10).isActive = true
        RegistrationSubView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        RegistrationSubView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
                //loginSubView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        RegistrationSubView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.77).isActive = true

        RegistrationSubView.isHidden = true
        
        UIView.animate(withDuration: 0.5) {
        self.LoginSubView.alpha = 1.0
         }
    }
}
