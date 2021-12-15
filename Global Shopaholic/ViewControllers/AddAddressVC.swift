//
//  AddAddressVC.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 12/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
class AddAddressVC: UIViewController, UITextDropDelegate {
   
    var isEditMode = false
    var EditData: NSDictionary!
    @IBOutlet weak var CloseBtn: UIButton!
    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var ReceiverNameLbl: UITextField!
    @IBOutlet weak var ContactNumberLbl: UITextField!
    @IBOutlet weak var StreetAddressLbl: UITextField!
    @IBOutlet weak var CountryLbl: UITextField!
    @IBOutlet weak var StateLbl: UITextField!
    @IBOutlet weak var ZipCodeLbl: UITextField!
    @IBOutlet weak var CityLbl: DropDown!
    @IBOutlet weak var CountryField: DropDown!
    var activeTextField : UITextField? = nil

    
    var CountryData: NSArray!
    var user_data:UserDataClass!
    let userDefaults = UserDefaults.standard
    var CitiesData: NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isEditMode{
            setUI()
            SetupEditMode()
        }
        else{
        setUI()
        }
            GetcountryDataInOrder()
        CityLbl.didSelect{(selectedText , index , id) in
                    //self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"
                }
        
        CountryField.didSelect{(selectedText , index , id) in
            var citiesVM = getCitiesVM()
            citiesVM.delegate = self
            let Request = CountryCity(CountryName: selectedText)
            citiesVM.GetCities(accessToken: self.user_data.token, request: Request)
            print(selectedText)
                }
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            
            
        }
        NotificationCenter.default.addObserver(self, selector: #selector(AddAddressVC.AddAddressVCkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(AddAddressVC.AddAddressVCkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Update"), object: nil)
        NotificationCenter.default.removeObserver(self)
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func GetcountryDataInOrder()
    {
        CountryData.forEach { (value) in
            let val = value as! [String:Any]
            CountryField.optionArray.append(val["name"] as! String)
        }
    }
    func setUI()
    {
        ReceiverNameLbl.layer.cornerRadius = 5
        ReceiverNameLbl.layer.borderWidth = 0.8
        ReceiverNameLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        ReceiverNameLbl.setLeftPaddingPoints(10.0)
        
        ContactNumberLbl.layer.cornerRadius = 5
        ContactNumberLbl.layer.borderWidth = 0.8
        ContactNumberLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        ContactNumberLbl.setLeftPaddingPoints(10.0)
        
        StreetAddressLbl.layer.cornerRadius = 5
        StreetAddressLbl.layer.borderWidth = 0.8
        StreetAddressLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        StreetAddressLbl.setLeftPaddingPoints(10.0)
        
        CityLbl.layer.cornerRadius = 5
        CityLbl.layer.borderWidth = 0.8
        CityLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        CityLbl.setLeftPaddingPoints(10.0)
        
        StateLbl.layer.cornerRadius = 5
        StateLbl.layer.borderWidth = 0.8
        StateLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        StateLbl.setLeftPaddingPoints(10.0)
        
        ZipCodeLbl.layer.cornerRadius = 5
        ZipCodeLbl.layer.borderWidth = 0.8
        ZipCodeLbl.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        ZipCodeLbl.setLeftPaddingPoints(10.0)
        
        CountryField.layer.cornerRadius = 5
        CountryField.layer.borderWidth = 0.8
        CountryField.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
        CountryField.setLeftPaddingPoints(10.0)
        
        MainView.layer.cornerRadius = 5
        MainView.layer.borderWidth = 0.8
        MainView.layer.borderColor = hexStringToUIColor(hex: "#0BBAA3").cgColor
       
        
        SubmitBtn.layer.cornerRadius = 5
        CloseBtn.layer.cornerRadius = 5
    }

    
    func SetupEditMode()
    {
        SubmitBtn.setTitle("Update", for: .normal)
        self.ReceiverNameLbl.text = (EditData["name"] as! String)
        self.ContactNumberLbl.text = (EditData["phone"] as! String)
        self.StreetAddressLbl.text = (EditData["street"] as! String)
        self.CountryField.text = (EditData["country"] as! String)
        self.StateLbl.text = (EditData["state"] as! String)
        self.ZipCodeLbl.text = (EditData["zip_code"] as! String)
        self.CityLbl.text = (EditData["city"] as! String)
    }
    
    
    
    @IBAction func Close(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Update"), object: nil)
        NotificationCenter.default.removeObserver(self.AddAddressVCkeyboardWillShow, name: nil, object: nil)
        NotificationCenter.default.removeObserver(self.AddAddressVCkeyboardWillHide, name: nil, object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func SubmitAddress(_ sender: UIButton) {
        
        
        if isEditMode{
            print("editng")
            print((EditData["address_id"] as! String))
            let req = addressModelRequest(userName: self.ReceiverNameLbl.text!, contactNumber: self.ContactNumberLbl.text!, streetName: self.StreetAddressLbl.text!, countryName: self.CountryField.text!, stateName: self.StateLbl.text!, zipCode: self.ZipCodeLbl.text, cityName: self.CityLbl.text!,addressID: (EditData["address_id"] as! String))
            print(req)
            var AddressVM = addAddressVM()
            AddressVM.delegate = self
            AddressVM.addAddress(addressReq: req, accessToken: user_data.token, isEditing: isEditMode)
        }
        else{
        let req = addressModelRequest(userName: self.ReceiverNameLbl.text!, contactNumber: self.ContactNumberLbl.text!, streetName: self.StreetAddressLbl.text!, countryName: self.CountryField.text!, stateName: self.StateLbl.text!, zipCode: self.ZipCodeLbl.text, cityName: self.CityLbl.text!)
        var AddressVM = addAddressVM()
        AddressVM.delegate = self
        AddressVM.addAddress(addressReq: req, accessToken: user_data.token, isEditing: isEditMode)
        }
        
    }


}









extension AddAddressVC: addAddressVMDelegate{
    func didFinishedAddingAddress(response: NSDictionary) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Update"), object: nil)
        NotificationCenter.default.removeObserver(self)
        self.navigationController?.popViewController(animated: true)
    }
    
    func didFailtoRequest(LoginRequestResponse: addressModelRequestResponse) {
        
        self.showToast(controller: self, message: LoginRequestResponse.message!, seconds: 1)
        
        COMMON_ALERT.showAlert(msg: LoginRequestResponse.message!)
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true, completion: nil)
            
        }
    }
    
    
}
extension AddAddressVC: getCitiesVMDelegate
{
    func didFailtoGetCities(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didGetCities(response: NSDictionary) {
        //print(response)
        let data = response["data"] as! NSDictionary
        let cities = data["cities"] as! [String]
       print(cities)
        CityLbl.optionArray = cities
        print("didFinished")
    }
    
    
}
extension AddAddressVC: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("SettingsVC")
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}
extension AddAddressVC
{
    
    @objc func AddAddressVCkeyboardWillShow(notification: NSNotification) {
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
        if activeTextField?.tag == nil{
           
            self.view.frame.origin.y = 0 - 170
            
        }
        else{
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
           
        }
    }
    }

   
    @objc func AddAddressVCkeyboardWillHide(notification: NSNotification) {
          self.view.frame.origin.y = 0
      }
}
