//
//  SettingsVC.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 12/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import BetterSegmentedControl
class SettingsVC: BaseViewController {
   
    @IBOutlet weak var CurrentPasswordField: UITextField!
    @IBOutlet weak var NewPasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    
    
    
    
    @IBOutlet var PrimaryInfoView: UIView!
    @IBOutlet weak var UserProfilePicture: UIImageView!
    @IBOutlet weak var UserNamelbl: UILabel!
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PhoneNumberField: UITextField!
    @IBOutlet weak var UserEmailField: UITextField!
    @IBOutlet weak var UserGenderField: UITextField!
    @IBOutlet weak var DOBField: UITextField!

    var activeTextField : UITextField? = nil

    
    
    
    
    
    @IBOutlet weak var BackButtonView: UIView!
    @IBOutlet weak var SideMenuView: UIView!
    @IBOutlet weak var SegmentOutlet: UISegmentedControl!
    @IBOutlet weak var MainContainerView: UIView!
    @IBOutlet var addressesView: UIView!
    @IBOutlet weak var AddAddressBtn: UIButton!
   // @IBOutlet weak var MainSegment: BetterSegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var user_data:UserDataClass!
    let userDefaults = UserDefaults.standard
    var CountryArrayData: NSArray!
    var ShopaholicAddress: NSArray!
    var getaddressVModel = GetAddressesVM()

    @IBOutlet weak var btnShowMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        getaddressVModel.delegate = self
        self.tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            
            
            var getcountry = CountriesVM()
            getcountry.delegate = self
            print(user_data.userData!)
            getcountry.GetCountry(accessToken: user_data.token)
            getAddresses()
            setupUserData()
            
            

        }
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.callUpdate), name: NSNotification.Name(rawValue: "Update"), object: nil)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "00BCA3")], for: .selected)
        print("SettingsVC viewWillAppear")
        
        NotificationCenter.default.addObserver(self, selector: #selector(SettingsVC.SettingsVCkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(SettingsVC.SettingsVCkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("SettingsVC viewWillDisappear")
        
       
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.callUpdate), name: NSNotification.Name(rawValue: "Update"), object: nil)
    }
   
   func setupConstraints()
   {
    PrimaryInfoView.translatesAutoresizingMaskIntoConstraints = false
    PrimaryInfoView.topAnchor.constraint(equalTo: MainContainerView.topAnchor, constant: 0).isActive = true
    PrimaryInfoView.leftAnchor.constraint(equalTo: MainContainerView.leftAnchor, constant: 0).isActive = true
    PrimaryInfoView.rightAnchor.constraint(equalTo: MainContainerView.rightAnchor, constant: 0).isActive = true
    PrimaryInfoView.bottomAnchor.constraint(equalTo: MainContainerView.bottomAnchor, constant: 0).isActive = true
    
    addressesView.translatesAutoresizingMaskIntoConstraints = false
    addressesView.topAnchor.constraint(equalTo: MainContainerView.topAnchor, constant: 0).isActive = true
    addressesView.leftAnchor.constraint(equalTo: MainContainerView.leftAnchor, constant: 0).isActive = true
    addressesView.rightAnchor.constraint(equalTo: MainContainerView.rightAnchor, constant: 0).isActive = true
    addressesView.bottomAnchor.constraint(equalTo: MainContainerView.bottomAnchor, constant: 0).isActive = true
   }
    func setUI()
    {
        MainContainerView.addSubview(PrimaryInfoView)
        MainContainerView.addSubview(addressesView)
        addressesView.isHidden = true
        SegmentOutlet.addUnderlineForSelectedSegment()
        
        AddAddressBtn.layer.cornerRadius = AddAddressBtn.frame.height / 2
        SideMenuView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        SideMenuView.layer.cornerRadius = SideMenuView.frame.height / 2
        BackButtonView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        BackButtonView.layer.cornerRadius = BackButtonView.frame.height / 2
        setupConstraints()
    }
    func setupUserData()
    {
        self.UserNamelbl.text = (user_data.userData["first_name"] as! String)
        self.UserNameField.text = (user_data.userData["first_name"] as! String)
        self.UserEmailField.text = (user_data.userData["email"] as! String)
        self.PhoneNumberField.text = (user_data.userData["phone_number"] as! String)
        self.UserGenderField.text = (user_data.userData["gender"] as! String)
        self.DOBField.text = (user_data.userData["dob"] as? String)
        
    }
    @IBAction func SegmentContoller(_ sender: UISegmentedControl) {
        SegmentOutlet.changeUnderlinePosition()
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0
        {
            addressesView.isHidden = true
            PrimaryInfoView.isHidden = false
        }
        else{
            addressesView.isHidden = false
            PrimaryInfoView.isHidden = true
        }
    }
   
    @IBAction func AddAddressAction(_ sender: UIButton) {

        let vc = self.storyboard?.instantiateViewController(identifier: "AddAddressVC") as! AddAddressVC
        vc.CountryData = self.CountryArrayData
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
    }
    
    func getAddresses(){
        print("getAddresses")
        getaddressVModel.getAddress(accessToken: user_data.token)
        
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func UpdateUserAction(_ sender: UIButton) {
        print("UpdateUserAction")
        let request = InforUpdateRequest(FirstName: self.UserNameField.text!, PhoneNumber: self.PhoneNumberField.text!, DOB: self.DOBField.text!, Gender: self.UserGenderField.text!)
        var infoVM = InfoUpdateVM()
        infoVM.delegate = self
        infoVM.UpdateUser(request: request, token: user_data.token!)
    }
    
    @IBAction func UpdatePasswordAction(_ sender: UIButton) {
        print("UpdatePasswordAction")

        let request = ChangePasswordRequest(OldPassword: self.CurrentPasswordField.text!, NewPassword: self.NewPasswordField.text!, ConfirmPassword: self.ConfirmPasswordField.text!)
        var PasswordVM = ChangePasswordVM()
        PasswordVM.delegate = self
        PasswordVM.ChangePassword(request: request, token: user_data.token!)
    }
    
    
    
}
extension SettingsVC: getAddressesDelegate{
    func didFailToGetAddress(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didFinishedGettingAddress(response: NSDictionary) {
        print("didFinishedGettingAddress")
        print(response)
        let data = response["data"] as! NSDictionary
        
        
        ShopaholicAddress = data["addreses"] as? NSArray
        self.tableView.reloadData()
    }
    
    
}

extension SettingsVC: CountriesVMDelegate
{
    func didFailtoRequest(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didFinished(response: NSDictionary) {
        let Data = response["data"] as! NSDictionary
         CountryArrayData = (Data["countries"] as! NSArray)
        
        print("CountryData")
    }
    @objc func callUpdate() {
        print("callUpdate")
       
        NotificationCenter.default.addObserver(self, selector: #selector(SettingsVC.SettingsVCkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(SettingsVC.SettingsVCkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.getAddresses()
    }
    
}




extension SettingsVC: ChangePasswordDelegate{
    func DidFinishedChanging(response: NSDictionary) {
        COMMON_ALERT.showAlert(msg: (response["message"] as! String))
    }
    
    func DidFailtoRequest(Response: ChangePasswordResponse?) {
        COMMON_ALERT.showAlert(msg: (Response?.message)!)
    }
    
    
}


extension SettingsVC: InfoUpdateDelegate{
    func DidFailtoRequest(Response: InfoUpdateResponse?) {
        COMMON_ALERT.showAlert(msg: (Response?.message)!)
    }
    
    func DidFinishedHTTPRequest(response: NSDictionary) {
        let data = response["data"] as! NSDictionary
        let userData = data["user"] as! NSDictionary
        self.user_data = UserDataClass(token: user_data.token!, userData: userData, warehouseAddress: user_data.warehouseAddress!)
        do {
        let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: user_data!, requiringSecureCoding: false)
        
          userDefaults.set(encodedData, forKey: "user_data")
          userDefaults.synchronize()
            setupUserData()
        }catch let error{
            print(error.localizedDescription)
        }
        
        COMMON_ALERT.showAlert(msg: "Updated")
        
        
        print(response)
    }
    
    
}


extension SettingsVC: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("SettingsVC")
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    
    @objc func SettingsVCkeyboardWillShow(notification: NSNotification) {
      print("SettingsVCkeyboardWillShow")
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        //print(activeTextField!.tag)
        let tag = activeTextField!.tag
        if(shouldMoveViewUp) {
            if tag == 3
            {
            self.view.frame.origin.y = 0 - 60
            }
            else if tag == 4{
                self.view.frame.origin.y = 0 - 80
            }
            else if tag == 5{
                self.view.frame.origin.y = 0 - 170
            }
            else if tag == 6{
                self.view.frame.origin.y = 0 - 250
            }
            else if tag == 7{
                self.view.frame.origin.y = 0 - 300
            }
        }
    }

   
    @objc func SettingsVCkeyboardWillHide(notification: NSNotification) {
          self.view.frame.origin.y = 0
      }
}


