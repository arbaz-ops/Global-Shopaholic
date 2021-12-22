//
//  Storage+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 18/01/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


extension StorageShipmentVC: FilterViewControllerDelegate, OutgoingTableViewCellDelegate{
   
    
   
   
    func changeUI(status: MainSelection) {
        switch currentSelection {
        case .Storage:
            self.selectedSection = 0
            storageAndShipTableView.register(UINib(nibName: "StorageTableViewCell", bundle: nil), forCellReuseIdentifier: "StorageTableViewCell")
            filterButton.isHidden = true
            itemsSelectedLabel.isHidden = false
            selectAllLabel.isHidden = false
            selectAllButton.isHidden = false
            storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
            tableViewTopConstraint.constant = 43
            tableViewTopConstraint.isActive = true
            storageAndShipTableView.reloadData()
        case .Outgoing:
            self.selectedSection = 1
            storageAndShipTableView.register(UINib(nibName: "OutgoingTableViewCell", bundle: nil), forCellReuseIdentifier: "OutgoingTableViewCell")

            filterButton.isHidden = false
            itemsSelectedLabel.isHidden = true
            selectAllLabel.isHidden = true
            selectAllButton.isHidden = true
            storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
            tableViewTopConstraint.constant = 5
            tableViewTopConstraint.isActive = true
            storageAndShipTableView.reloadData()

        case .Shipped:
            self.selectedSection = 2
            storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
            filterButton.isHidden = false
            itemsSelectedLabel.isHidden = true
            selectAllLabel.isHidden = true
            selectAllButton.isHidden = true
            storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
            tableViewTopConstraint.constant = 5
            tableViewTopConstraint.isActive = true
            storageAndShipTableView.reloadData()

        case .Delivered:
            
            self.selectedSection = 3
            storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
            filterButton.isHidden = false
            itemsSelectedLabel.isHidden = true
            selectAllLabel.isHidden = true
            selectAllButton.isHidden = true
            storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
            tableViewTopConstraint.constant = 5
            tableViewTopConstraint.isActive = true
            storageAndShipTableView.reloadData()

        case .Cancelled:
            self.selectedSection = 4
            storageAndShipTableView.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
            filterButton.isHidden = false
            itemsSelectedLabel.isHidden = true
            selectAllLabel.isHidden = true
            selectAllButton.isHidden = true
            storageAndShipTableView.translatesAutoresizingMaskIntoConstraints = false
            tableViewTopConstraint.constant = 5
            tableViewTopConstraint.isActive = true
            storageAndShipTableView.reloadData()

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
                   
                   guard let myStorageCell = self.storageAndShipTableView.cellForRow(at: indexPath) as? StorageTableViewCell else {
                       return
                   }
                   DispatchQueue.main.async {
                       self.storageAndShipTableView.reloadWithAnimation()
                       myStorageCell.reloadCollectionViewWithData(myStorageList: list)
                   }
                   
               }, failure: { str in
                   print(str)
               })
               
           } catch let error {
               print(error.localizedDescription)
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

                   self.storageAndShipTableView.reloadWithAnimation()
                   
               }, failure: { str in
                   print(str)
               })

           
           } catch let error {
               print(error.localizedDescription)
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

                   self.storageAndShipTableView.reloadWithAnimation()
               }, failure: { str in
                   print(str)
               })
          

           
           } catch let error {
               print(error.localizedDescription)
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
                   self.storageAndShipTableView.reloadWithAnimation()

               }, failure: { str in
                   print(str)
               })

           } catch let error {
               print(error.localizedDescription)
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

                   self.storageAndShipTableView.reloadWithAnimation()

               }, failure: { str in
                   print(str)
               })

           
           } catch let error {
               print(error.localizedDescription)
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
    
    func updateFilteredList(list: [[String : Any]]) {
        self.packagesList = list
        self.storageAndShipTableView.reloadWithAnimation()
    }
    
    
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
    
    //OutgoingTableViewCellDelegate
    func outgoingOptionButtonTapped(atIndex: IndexPath) {
        print(atIndex)
        let outgoingCell = storageAndShipTableView.cellForRow(at: atIndex) as? OutgoingTableViewCell
       
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
    
    
    
}

extension StorageShipmentVC:  StorageTableViewCellDelegate {
    func addCustomDetailTapped() {
        let customDetailVC = storyboard?.instantiateViewController(withIdentifier: "CustomDetailViewController") as? CustomDetailViewController
        customDetailVC?.modalPresentationStyle = .overFullScreen

        present(customDetailVC!, animated: true, completion: nil)
    }
    
    func specialServiceTapped() {
        let specialServicesVC = storyboard?.instantiateViewController(withIdentifier: "SpecialServicesViewController") as? SpecialServicesViewController
        specialServicesVC?.modalPresentationStyle = .overFullScreen

        present(specialServicesVC!, animated: true, completion: nil)
    }
    
    func returnPackageTapped() {
        let returnPackageVC = storyboard?.instantiateViewController(withIdentifier: "ReturnPackageViewController") as? ReturnPackageViewController
        returnPackageVC?.modalPresentationStyle = .overFullScreen

        present(returnPackageVC!, animated: true, completion: nil)
    }
 
}
