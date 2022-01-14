//
//  StorageAndShipment+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension StorageAndShipmentViewController {
    func InitUI()
    {
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.layer.borderColor = hexStringToUIColor(hex: "#A1A1A1").cgColor
        searchTextField.layer.borderWidth = 0.5
        searchTextField.placeholder = "Search"
        searchTextField.setLeftPaddingPoints(10)
        searchTextField.setRightPaddingPoints(10)
        searchTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 11.24, height: 11.24))

        let image = UIImage(named: "search")
        imageView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
            iconContainerView.addSubview(imageView)
        searchTextField.rightView = iconContainerView
        searchTextField.rightViewMode = .always

        filterButton.setTitle("", for: .normal)

    }
    
    
     func changeUI(status: MainSelection) {
         switch currentSelection {
         case .Storage:
             self.selectedSection = 0
//             storageAndShipTableView.register(UINib(nibName: "StorageTableViewCell", bundle: nil), forCellReuseIdentifier: "StorageTableViewCell")
//             storageAndShipTableView.isScrollEnabled = false
//             filterButton.isHidden = true
//             itemsSelectedLabel.isHidden = false
//             selectAllLabel.isHidden = false
//             selectAllButton.isHidden = false
//             storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
//             tableViewTopConstraint.constant = 43
//             tableViewTopConstraint.isActive = true
//             storageAndShipTableView.reloadData()
         case .Outgoing:
             self.selectedSection = 1
//             storageAndShipTableView.register(UINib(nibName: "OutgoingTableViewCell", bundle: nil), forCellReuseIdentifier: "OutgoingTableViewCell")
//
//             filterButton.isHidden = false
//             itemsSelectedLabel.isHidden = true
//             selectAllLabel.isHidden = true
//             selectAllButton.isHidden = true
//             storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
//             tableViewTopConstraint.constant = 5
//             tableViewTopConstraint.isActive = true
//             storageAndShipTableView.reloadData()

         case .Shipped:
             self.selectedSection = 2
//             storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
//             filterButton.isHidden = false
//             itemsSelectedLabel.isHidden = true
//             selectAllLabel.isHidden = true
//             selectAllButton.isHidden = true
//             storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
//             tableViewTopConstraint.constant = 5
//             tableViewTopConstraint.isActive = true
//             storageAndShipTableView.reloadData()

         case .Delivered:
             
             self.selectedSection = 3
//             storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
//             filterButton.isHidden = false
//             itemsSelectedLabel.isHidden = true
//             selectAllLabel.isHidden = true
//             selectAllButton.isHidden = true
//             storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
//             tableViewTopConstraint.constant = 5
//             tableViewTopConstraint.isActive = true
//             storageAndShipTableView.reloadData()

         case .Cancelled:
             self.selectedSection = 4
//             storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
//             filterButton.isHidden = false
//             itemsSelectedLabel.isHidden = true
//             selectAllLabel.isHidden = true
//             selectAllButton.isHidden = true
//             storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
//             tableViewTopConstraint.constant = 5
//             tableViewTopConstraint.isActive = true
//             storageAndShipTableView.reloadData()

         case .Return:
             print("pending UI")
         }
     }
     
    
    
    func setCurrentSelection()
    {
       switch currentSelection
       {
       case .Storage:
          
           do {
               self.changeUI(status: currentSelection)
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
              storageVM = StorageVM()
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all", success: { response in
                   let data = response["data"] as? [String: [[String: Any]]]
                   let list = data!["list"]!
                   self.packagesList = list
                   self.changeUI(status: self.currentSelection)
                   let indexPath = IndexPath(row: 0, section: 0)
                   
//                   guard let myStorageCell = self.storageAndShipTableView.cellForRow(at: indexPath) as? StorageTableViewCell else {
//                       return
//                   }
//                   DispatchQueue.main.async {
//                       self.storageAndShipTableView.reloadWithAnimation()
//                       myStorageCell.reloadCollectionViewWithData(myStorageList: list)
//                   }
                   
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })
               
           } catch let error {
               if error != nil {
                   COMMON_ALERT.showAlert(msg: error.localizedDescription)

               }
           }
     
       case .Outgoing:
         
           do {
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
               storageVM = StorageVM()
               
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all" ,success: {[self] response in
                   let data = response["data"] as? [String: [[String: Any]]]
                   let list = data!["list"]!
                   self.packagesList = list
                   changeUI(status: currentSelection)

//                   self.storageAndShipTableView.reloadWithAnimation()
                   
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: error.localizedDescription)
           }

           
       case .Shipped:
          
           do {
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               print("Failed to get user Data")
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
               storageVM = StorageVM()
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue,subStatus: "all" ,success: {[self] response in
                   let data = response["data"] as? [String: [[String: Any]]]
                   let list = data!["list"]!
                   self.packagesList = list
                   changeUI(status: currentSelection)

//                   self.storageAndShipTableView.reloadWithAnimation()
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })
          

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: error.localizedDescription)
           }

           

       case .Delivered:
  
           do {
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
               storageVM = StorageVM()
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all" ,success: {[self] response in
                   let data = response["data"] as? [String: [[String: Any]]]
                   let list = data!["list"]!
                   self.packagesList = list
                   changeUI(status: currentSelection)
                   print(self.packagesList)
//                   self.storageAndShipTableView.reloadWithAnimation()

               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })

           } catch let error {
               COMMON_ALERT.showAlert(msg: error.localizedDescription)
           }
           
           
       case .Cancelled:
           

           do {
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
               storageVM = StorageVM()
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all" ,success: {[self] response in
                   let data = response["data"] as? [String: [[String: Any]]]
                   let list = data!["list"]!
                   self.packagesList = list
                   print(self.packagesList)
                   changeUI(status: currentSelection)

//                   self.storageAndShipTableView.reloadWithAnimation()

               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: error.localizedDescription)
           }
           
       case .Return:
           do {
           let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
           guard let userData = encodedUserData else {
               return
           }
           let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
               
               guard let userToken = unarchivedData?.token else {
                   print("Failed to get the token")
                   return
               }
              
               print(currentSelection.rawValue)
//               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, success: { response in
//                   print(response)
//               }, failure: { str in
//                   print(str)
//               })
           
           } catch let error {
               print(error.localizedDescription)
           }
  
      
       }
    }
    
}
