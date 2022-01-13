//
//  ViewController.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//#00BBA3
//#3A525B
import UIKit
import BetterSegmentedControl
import iOSDropDown
class LoginVC: UIViewController {
   
    @IBOutlet weak var ConfirmPasswordShowBtn: UIButton!
    @IBOutlet weak var passwordShowBtn: UIButton!
    @IBOutlet weak var TopLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var TopLblHeightMultiplier: NSLayoutConstraint!
    @IBOutlet var RegistrationSubView: UIView!
    @IBOutlet var BottomImage: UIImageView!
    var user_data:UserDataClass!
    ///# UI Outlets
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var EmailSnField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var SignInBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
       
    @IBOutlet weak var LoginNRegSegment: BetterSegmentedControl!
    
    ///# Constraints Outlets

    @IBOutlet weak var Horizontal: NSLayoutConstraint!
    var TopConstraints: NSLayoutConstraint?
    @IBOutlet var LoginSubView: UIView!
//    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var Width: NSLayoutConstraint!
    @IBOutlet weak var Height: NSLayoutConstraint!
    var activeTextField : UITextField? = nil

    
    @IBOutlet weak var genderField: DropDown!
    
    
    
    
    //
    @IBOutlet weak var RegTermsAndConditionBtn: UIButton!
    @IBOutlet weak var RegFirstNameField: UITextField!
    @IBOutlet weak var RegLastNameField: UITextField!
    @IBOutlet weak var RegEmailField: UITextField!
    @IBOutlet weak var RegPhoneNumberField: UITextField!
    @IBOutlet weak var RegPasswordField: UITextField!
    var term = false
    @IBOutlet weak var RegConfirmPasswordField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     LoginViewSetup()
//     LogoAnimation()
        LoginNRegSegment.addTarget(self,
        action: #selector(LoginVC.navigationSegmentedControlValueChanged(_:)),
        for: .valueChanged)
        genderField.optionArray = ["male","female"]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults()
                  if  userDefaults.object(forKey: "user_data") != nil {
      
                      let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                      let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
      
                             UIApplication.shared.windows.first?.rootViewController = viewController
                             UIApplication.shared.windows.first?.makeKeyAndVisible()
      //                let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
      //                user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
      //                print(user_data.token!)
      
                  }else{
                      self.showloginForm()
                  }
    }

    @IBAction func SignInAction(_ sender: Any) {
        let request = LoginRequest(Email_SN: EmailSnField.text!, Password: PasswordField.text!)
        var loginViewM = LoginVM()
        loginViewM.delegate = self
        loginViewM.Loginuser(registerRequest: request)
        
    }
    @IBAction func SignUpAction(_ sender: Any) {
        

        LoginNRegSegment.setIndex(1)
        ShowRegister()
    }
    @IBAction func ForgotPasswordAction(_ sender: Any) {
        
        let viewController = (self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC"))!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
         print("The selected index is \(sender.index)")
        if sender.index == 0
        {
            ShowLogin()
        }
        else if sender.index == 1
        {
            ShowRegister()
        }
     }
    
    
    
    func ShowLogin()
    {
        
       
        self.RegistrationSubView.isHidden = true
        TopLabel.font = TopLabel.font.withSize(27)
        self.LoginSubView.isHidden = false
        self.BottomImage.isHidden = false
        self.TopLabelTopConstraint.constant = 25
        TopLabel.text = "Welcome"
        self.TopLblHeightMultiplier.constant = 0.0472264
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
               self.view.layoutIfNeeded()
                         
                     }, completion: nil)
        
    }
    func ShowRegister()
    {
        TopLabel.text = "Let's get started!"
        TopLabel.font = TopLabel.font.withSize(17)
        self.TopLabelTopConstraint.constant = 0
        self.TopLblHeightMultiplier.constant = 0.02
//        self.TopLblHeightMultiplier.isActive = true
//        self.TopLabelTopConstraint.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
               self.view.layoutIfNeeded()
                         
                     }, completion: nil)
        self.RegistrationSubView.isHidden = false
        self.LoginSubView.isHidden = true
        self.BottomImage.isHidden = true
    }
 
    @IBAction func Register(_ sender: UIButton) {
        let Request = RegistrationRequest(FirstName: RegFirstNameField.text!, LastName: RegLastNameField.text!, userEmail: RegEmailField.text!, PhoneNumber: RegPhoneNumberField.text!, password: RegPasswordField.text!, confirmpassword: RegConfirmPasswordField.text, gender: self.genderField.text!, TermsAndCondition: term)
        var RegVM = RegistrationViewModel()
        RegVM.delegate = self
        RegVM.RegisterUser(registerRequest: Request)
    }
    @IBAction func TermAction(_ sender: Any) {
        if term == false{
            term = true
            RegTermsAndConditionBtn.setImage(UIImage(named:"checked"), for: .normal)
            //"checked"
        }
        else{
            term = false
            RegTermsAndConditionBtn.setImage(nil, for: .normal)
        }
    }
    
    
    @IBAction func PasswordShowAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true) {
            RegPasswordField.isSecureTextEntry = false
            
            sender.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
                } else {
                    sender.setImage(nil, for: .normal)

                    RegPasswordField.isSecureTextEntry = true
                    sender.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
                }

                //iconClick = !iconClick
    }
    @IBAction func ConfirmPasswordShowAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true) {
            RegConfirmPasswordField.isSecureTextEntry = false
            sender.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
                } else {
                    RegConfirmPasswordField.isSecureTextEntry = true
                    sender.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
                }
    }
    
}




extension LoginVC: RegistrationRequestDelegate
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





