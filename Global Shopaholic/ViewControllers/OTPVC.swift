//
//  OTPVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class OTPVC: UIViewController {
    
    @IBOutlet var OTPField: UITextField!
    @IBOutlet var VerifyBtn: UIButton!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var SixDigitView: UIView!
    @IBOutlet var SelectSubView: UIView!
    @IBOutlet var viaEmailBtn: UIButton!
    @IBOutlet var viaSmsBtn: UIButton!

    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(OTPVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
             NotificationCenter.default.addObserver(self, selector: #selector(OTPVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        SetupUI()
    }
    
    func SetupUI()
    {
        OTPField.delegate = self
        OTPField.layer.cornerRadius = 10
        OTPField.layer.borderWidth = 0.8
        OTPField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        VerifyBtn.layer.cornerRadius = 10
        viaSmsBtn.layer.cornerRadius = 10
        viaEmailBtn.layer.cornerRadius = 10
        view.addSubview(SelectSubView)
        
        SelectSubView.translatesAutoresizingMaskIntoConstraints = false
        SelectSubView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 35).isActive = true
        SelectSubView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        SelectSubView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
        //SelectSubView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        SelectSubView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.48).isActive = true
        SelectSubView.isHidden = false
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func SMSActi(_ sender: Any) {
        print("Same")
        LoadOTP()
    }
    func LoadOTP()
    {
        
        SelectSubView.isHidden = true
        view.addSubview(SixDigitView)
        
        SixDigitView.translatesAutoresizingMaskIntoConstraints = false
        SixDigitView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 35).isActive = true
        SixDigitView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        SixDigitView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
        SixDigitView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.55).isActive = true
        
    }
    
    @IBAction func VerifyOTPAct(_ sender: Any) {
        
        print(1)
 let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
   let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
        
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
