//
//  ForgotPasswordVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
import RappleProgressHUD
class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var SendOTPBTN: UIButton!
    
    @IBOutlet weak var EmailField: UITextField!
    
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        EmailField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ForgotPasswordVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ForgotPasswordVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func SendOTPAction(_ sender: Any) {
        if EmailField.text! == ""
            {
            COMMON_ALERT.showAlert(msg: "Please enter Email address")
            }
        else if !isValidEmail(testStr: EmailField.text!){
            COMMON_ALERT.showAlert(msg: "Please enter a valid email address")
        }
        else{
            getOTP()
        }
    }
    func getOTP()
    {
        print("EmailVerification API is getting called here")
     let loginep = endpoints()
        let param = ["email":EmailField.text!]
     RappleActivityIndicatorView.startAnimating()
     WebService.requestPostUrlWithJSONDictionaryParameters(strURL: loginep.forgotPasswardEP, is_loader_required: false, params: param) { (response) in
         if (response["success"] as! Bool) == true
         {
             RappleActivityIndicatorView.stopAnimation()
            COMMON_ALERT.showAlert(msg: "Please check your Email")
            self.navigationController?.popViewController(animated: true)
         }
         else{
             RappleActivityIndicatorView.stopAnimation()

            COMMON_ALERT.showAlert(msg: (response["message"] as! String))
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }
    }
    private func setupUI()
    {
        EmailField.layer.cornerRadius = 10
        EmailField.layer.borderWidth = 0.8
        EmailField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        EmailField.setLeftPaddingPoints(20)
        EmailField.DropShadowTextField()
        SendOTPBTN.layer.cornerRadius = 10
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
