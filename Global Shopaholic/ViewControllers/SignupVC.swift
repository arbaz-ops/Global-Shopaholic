//
//  SignupVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    
    
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var TermsAndConditionBtn: UIButton!
    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PhoneNumberField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    var term = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func AlreadyAccountAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SignUpAction(_ sender: Any) {
        print("here")
        let Request = RegistrationRequest(FirstName: FirstNameField.text!, LastName: LastNameField.text!, userEmail: EmailField.text!, PhoneNumber: PhoneNumberField.text!, password: PasswordField.text!, confirmpassword: ConfirmPasswordField.text, TermsAndCondition: term)
        var RegVM = RegistrationViewModel()
        RegVM.delegate = self
        RegVM.RegisterUser(registerRequest: Request)
        
    }
    @IBAction func TermAction(_ sender: Any) {
        if term == false{
            term = true
            TermsAndConditionBtn.setImage(UIImage(named:"checked"), for: .normal)
            //"checked"
        }
        else{
            term = false
            TermsAndConditionBtn.setImage(nil, for: .normal)
        }
    }
    func setupOutlets()
    {
        TermsAndConditionBtn.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        SignUpBtn.layer.cornerRadius = 10
        FirstNameField.layer.cornerRadius = 10
        FirstNameField.layer.borderWidth = 0.8
        FirstNameField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        
        FirstNameField.setLeftPaddingPoints(10)
        LastNameField.layer.cornerRadius = 10
        LastNameField.layer.borderWidth = 0.8
        LastNameField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        LastNameField.setLeftPaddingPoints(10)
        
        EmailField.layer.cornerRadius = 10
        EmailField.layer.borderWidth = 0.8
        EmailField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        EmailField.setLeftPaddingPoints(10)
        
        PhoneNumberField.layer.cornerRadius = 10
        PhoneNumberField.layer.borderWidth = 0.8
        PhoneNumberField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        PhoneNumberField.setLeftPaddingPoints(10)
        
        PasswordField.layer.cornerRadius = 10
        PasswordField.layer.borderWidth = 0.8
        PasswordField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        PasswordField.setLeftPaddingPoints(10)
        
        ConfirmPasswordField.layer.cornerRadius = 10
        ConfirmPasswordField.layer.borderWidth = 0.8
        ConfirmPasswordField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        ConfirmPasswordField.setLeftPaddingPoints(10)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
