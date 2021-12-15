//
//  ShippingAddressVC.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 27/01/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ShippingAddressVC: UIViewController {

    
    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var MainContainerView: UIView!
    @IBOutlet weak var PhoneNumberField: UITextField!
    @IBOutlet weak var ZipCodeField: UITextField!
    @IBOutlet weak var StateField: UITextField!
    @IBOutlet weak var CityField: UITextField!
    @IBOutlet weak var AddressFieldTwo: UITextField!
    @IBOutlet weak var AddressFieldOne: UITextField!
    @IBOutlet weak var FullNameField: UITextField!
    @IBOutlet weak var CountryField: UITextField!
    @IBOutlet weak var MainView: UIView!
    var user_data:UserDataClass!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults()
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
          
            updateUI()
        }
        
        
    }
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func updateUI()
    {
        
        
        self.MainView.layer.cornerRadius = 15
        self.MainView.DropShadowView()
        self.BackBtn.layer.cornerRadius = 10
        
//        cell.CompanyName.text = (user_data.warehouseAddress["company"] as! String)
//        cell.Address.text = (user_data.warehouseAddress["street"] as! String)
//        cell.City.text = (user_data.warehouseAddress["city"] as! String)
//        cell.State.text = (user_data.warehouseAddress["state"] as! String)
//        cell.ZipCode.text = (user_data.warehouseAddress["zip_code"] as! String)
        
        
        CountryField.text = (user_data.warehouseAddress!["country"] as! String)
        
        CountryField.layer.cornerRadius = 5
        
        CountryField.isEnabled = false
        CountryField.setLeftPaddingPoints(15)
        
        FullNameField.text = "\(user_data.userData["first_name"] as! String) \(user_data.userData["last_name"] as! String)"
        FullNameField.layer.cornerRadius = 5
        
        FullNameField.isEnabled = false
        FullNameField.setLeftPaddingPoints(15)
        
        AddressFieldOne.text = (user_data.warehouseAddress!["street"] as! String)
        AddressFieldOne.layer.cornerRadius = 5
        
        AddressFieldOne.isEnabled = false
        AddressFieldOne.setLeftPaddingPoints(15)
        
        AddressFieldTwo.text = (user_data.warehouseAddress!["company"] as! String)
        AddressFieldTwo.layer.cornerRadius = 5
       
        AddressFieldTwo.isEnabled = false
        AddressFieldTwo.setLeftPaddingPoints(15)
        
        CityField.text = (user_data.warehouseAddress!["city"] as! String)
        CityField.layer.cornerRadius = 5
    
        CityField.isEnabled = false
        CityField.setLeftPaddingPoints(15)
        
        StateField.text = (user_data.warehouseAddress!["state"] as! String)
        StateField.layer.cornerRadius = 5
        
        StateField.isEnabled = false
        StateField.setLeftPaddingPoints(15)
        
        
        ZipCodeField.text = (user_data.warehouseAddress!["zip_code"] as! String)
        ZipCodeField.layer.cornerRadius = 5
        
        ZipCodeField.isEnabled = false
        ZipCodeField.setLeftPaddingPoints(15)
        
        PhoneNumberField.text = (user_data.warehouseAddress!["phone"] as! String)
        PhoneNumberField.layer.cornerRadius = 5
        PhoneNumberField.setLeftPaddingPoints(15)
    }
   
}
