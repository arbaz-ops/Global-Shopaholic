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
             storageAndShipmentCollectionView.isHidden = false
             storageAndShipmentTableView?.isHidden = true
             storageAndShipmentCollectionView.register(UINib(nibName: "MyStorageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyStorageCollectionViewCell")
           
             
             storageAndShipmentCollectionView.reloadData()
             storageAndShipmentCollectionView.layoutIfNeeded()
             filterButton.isHidden = true
             itemsSelectedLabel.isHidden = false
             selectAllLabel.isHidden = false
             selectAllButton.isHidden = false
             

         case .Outgoing:
             self.selectedSection = 1
             storageAndShipmentTableView!.register(UINib(nibName: "OutgoingTableViewCell", bundle: nil), forCellReuseIdentifier: "OutgoingTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
           

             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()

//             storageAndShipTableView.reloadData()

         case .Shipped:
             self.selectedSection = 2
             storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()


         case .Delivered:
             
             self.selectedSection = 3
             storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()


         case .Cancelled:
             self.selectedSection = 4
            storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()

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
//               self.changeUI(status: currentSelection)
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

               
                   DispatchQueue.main.async {
                       self.storageAndShipmentCollectionView.reloadData()
                   }

               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })
               
           } catch let error {
               
                   COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")

               
           }
     
       case .Outgoing:
         
           do {
//               changeUI(status: currentSelection)

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
                   self.viewDidAppear(true)
                   self.storageAndShipmentTableView!.reloadWithAnimation()
                   storageAndShipmentTableView?.layoutIfNeeded()
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
           }

           
       case .Shipped:
          
           do {
//          changeUI(status: currentSelection)
               changeUI(status: currentSelection)

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
                   print(packagesList.count)

                   self.storageAndShipmentTableView!.reloadWithAnimation()
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })
          

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
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
                   print(self.packagesList)
                   changeUI(status: currentSelection)

                   self.storageAndShipmentTableView!.reloadWithAnimation()

               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })

           } catch let error {
               COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
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

                  self.storageAndShipmentTableView!.reloadWithAnimation()

               }, failure: { str in
                  COMMON_ALERT.showAlert(msg: str)
               })

           
           } catch let error {
               COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
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
               print("Could not connect to server.\n Please try again later.")
           }
  
      
       }
    }
    
}

extension StorageAndShipmentViewController: StorageCollectionViewCellDelegate, FilterViewControllerDelegate, OutgoingTableViewCellDelegate {
    func outgoingOptionButtonTapped(atIndex: IndexPath) {
        print(atIndex)
        let outgoingCell = storageAndShipmentTableView!.cellForRow(at: atIndex) as? OutgoingTableViewCell
       
        if outgoingCell!.isShowing!  {

            outgoingCell?.hideOptions(frame: outgoingCell!.optionButton!.frame)
        }
        if !outgoingCell!.isShowing! {

        outgoingCell?.openOptionsView(frame: outgoingCell!.optionButton!.frame)
        }
    }
    
    func openRequestFormViewController(cell: UITableViewCell) {
        let requestFormVC = self.storyboard!.instantiateViewController(withIdentifier: "RequestFormViewController") as? RequestFormViewController
        let outgoingCell = cell as? OutgoingTableViewCell
        outgoingCell?.hideOptions(frame: (outgoingCell?.optionButton.frame)!)
        requestFormVC?.atIndex = outgoingCell!.indexPath
        requestFormVC?.packageList = self.packagesList
        requestFormVC?.modalPresentationStyle = .overFullScreen
        requestFormVC?.isModalInPresentation = true
        self.present(requestFormVC!, animated: true)
    }
    
    func openCustomDeclarationViewController(cell: UITableViewCell) {
        let customDeclarationVC = self.storyboard!.instantiateViewController(withIdentifier: "CustomDeclarationFormViewController") as? CustomDeclarationFormViewController
        let outgoingCell = cell as? OutgoingTableViewCell
        outgoingCell?.hideOptions(frame: (outgoingCell?.optionButton.frame)!)
        customDeclarationVC?.atIndex = outgoingCell!.indexPath
        customDeclarationVC?.packageList = self.packagesList
        customDeclarationVC?.modalPresentationStyle = .overFullScreen
        customDeclarationVC?.isModalInPresentation = true
        self.present(customDeclarationVC!, animated: true)
    }
    
    func openEditAddressViewController(cell: UITableViewCell) {
        let customDeclarationVC = self.storyboard!.instantiateViewController(withIdentifier: "EditAddressViewController") as? EditAddressViewController
        let outgoingCell = cell as? OutgoingTableViewCell
        outgoingCell?.hideOptions(frame: (outgoingCell?.optionButton.frame)!)
        customDeclarationVC?.atIndex = outgoingCell!.indexPath
        customDeclarationVC?.packageList = self.packagesList
        customDeclarationVC?.modalPresentationStyle = .overFullScreen
        customDeclarationVC?.isModalInPresentation = true
        self.present(customDeclarationVC!, animated: true)
    }
    
    func updateFilteredList(list: [[String : Any]]) {
        self.packagesList = list
        self.storageAndShipmentTableView!.reloadData()
    }
    
    func returnPackageTapped(indexPath: IndexPath) {
        print(indexPath.row)
        let returnPackageVC = storyboard?.instantiateViewController(withIdentifier: "ReturnPackageViewController") as? ReturnPackageViewController
        returnPackageVC?.modalPresentationStyle = .overFullScreen

        present(returnPackageVC!, animated: true, completion: nil)
    }
    
    func addCustomDetailTapped(indexPath: IndexPath) {
        let customDetailVC = storyboard?.instantiateViewController(withIdentifier: "CustomDetailViewController") as? CustomDetailViewController
        print(indexPath.row)

        customDetailVC?.modalPresentationStyle = .overFullScreen
        customDetailVC?.packagesList = packagesList
        present(customDetailVC!, animated: true, completion: nil)

    }
    
    func specialServiceTapped(indexPath: IndexPath) {
        let specialServicesVC = storyboard?.instantiateViewController(withIdentifier: "SpecialServicesViewController") as? SpecialServicesViewController
        print(indexPath.row)

        specialServicesVC?.modalPresentationStyle = .overFullScreen

        present(specialServicesVC!, animated: true, completion: nil)

    }
    
    func checkBoxTapped(indexPath: IndexPath) {
        self.selectedIndex.append(indexPath.row)
        print(selectedIndex)
        storageAndShipmentCollectionView.reloadData()

    }
    
    
    
}