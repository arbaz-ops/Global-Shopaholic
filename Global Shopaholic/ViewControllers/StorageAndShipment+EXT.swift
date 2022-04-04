//
//  StorageAndShipment+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit
import RappleProgressHUD

extension StorageAndShipmentViewController: ReturnPackageVCDelegate {
    
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
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
             storageAndShipmentCollectionView.isHidden = false
             storageAndShipmentTableView?.isHidden = true
            
             storageAndShipmentCollectionView.register(UINib(nibName: "MyStorageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyStorageCollectionViewCell")
             DispatchQueue.main.async { [self] in
                 collectionViewUpperConstraint.constant = 43
//                 consolidateAndShipButton.isHidden = true
                 enableConsolidateAndShip()
//                 storageAndShipmentCollectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)

             }
             
             storageAndShipmentCollectionView.reloadData()
             storageAndShipmentCollectionView.layoutIfNeeded()
             filterButton.isHidden = true
             itemsSelectedLabel.isHidden = false
             selectAllLabel.isHidden = false
             selectAllButton.isHidden = false
             

         case .Outgoing:
             self.selectedSection = 1
             consolidateAndShipButton.isHidden = true
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
             storageAndShipmentTableView!.register(UINib(nibName: "OutgoingTableViewCell", bundle: nil), forCellReuseIdentifier: "OutgoingTableViewCell")
             
             storageAndShipmentTableView?.scrollsToTop = true
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             DispatchQueue.main.async { [self] in
                 consolidateAndShipButton.isHidden = true

             storageAndShipmentTableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
             }

             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()

//             storageAndShipTableView.reloadData()

         case .Shipped:
             self.selectedSection = 2
             consolidateAndShipButton.isHidden = true
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
             storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             storageAndShipmentTableView?.scrollsToTop = true
             DispatchQueue.main.async { [self] in
                 consolidateAndShipButton.isHidden = true

             storageAndShipmentTableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
             }
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()


         case .Delivered:
             
             self.selectedSection = 3
             consolidateAndShipButton.isHidden = true
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
             storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             storageAndShipmentTableView?.scrollsToTop = true
             DispatchQueue.main.async { [self] in
                 consolidateAndShipButton.isHidden = true

             storageAndShipmentTableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
             }
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
             consolidateAndShipButton.isHidden = true
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
            storageAndShipmentTableView!.register(UINib(nibName: "ShippedTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippedTableViewCell")
             activateTableViewConstraint(topConstraint: 5)
             DispatchQueue.main.async { [self] in
                 consolidateAndShipButton.isHidden = true

             storageAndShipmentTableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
             }
             storageAndShipmentCollectionView.isHidden = true
             storageAndShipmentTableView?.isHidden = false
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentTableView!.reloadData()

         case .Return:
             self.selectedSection = 0
             isSearchEnabled = false
             searchTextField.resignFirstResponder()
             storageAndShipmentCollectionView.isHidden = false
             storageAndShipmentTableView?.isHidden = true

             storageAndShipmentCollectionView.register(UINib(nibName: "ReturnCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReturnCollectionViewCell")
             DispatchQueue.main.async { [self] in
                 collectionViewUpperConstraint.constant = 10
                 consolidateAndShipButton.isHidden = true

                 storageAndShipmentCollectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)

             }
             
             
             filterButton.isHidden = false
             itemsSelectedLabel.isHidden = true
             selectAllLabel.isHidden = true
             selectAllButton.isHidden = true
             storageAndShipmentCollectionView.reloadData()
             storageAndShipmentCollectionView.layoutIfNeeded()
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
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all", success: {[self] response in
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
                   changeUI(status: currentSelection)

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
               storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all", success: {[self] response in
                   let data = response["data"] as? [String: [[String: Any]]]
                  let list = data!["list"]!
                  self.packagesList = list
                  print(self.packagesList)
                  changeUI(status: currentSelection)

                  self.storageAndShipmentCollectionView!.reloadData()
               }, failure: { str in
                   COMMON_ALERT.showAlert(msg: str)
               })
           
           } catch let error {
               COMMON_ALERT.showAlert(msg: error.localizedDescription)
           }
  
      
       }
    }
    
}

extension StorageAndShipmentViewController: StorageCollectionViewCellDelegate, FilterViewControllerDelegate, OutgoingTableViewCellDelegate, ShippedTableViewCellDelegate, SpecialServicesViewControllerDelegate {
    
    
    func updateFilteredList(list: [[String : Any]], subStatus: String) {
        self.packagesList = list
        self.subStatus = subStatus
        print(self.subStatus)
        
        self.storageAndShipmentTableView!.reloadData()
    }
    
    func openShippedRequestForm(cell: UITableViewCell) {
        let requestFormVC = self.storyboard!.instantiateViewController(withIdentifier: "RequestFormViewController") as? RequestFormViewController
        let shippedCell = cell as? ShippedTableViewCell
        shippedCell?.hideOptions(frame: (shippedCell?.optionButton.frame)!)
        requestFormVC?.atIndex = shippedCell!.indexPath
        requestFormVC?.packageList = self.packagesList
        requestFormVC?.modalPresentationStyle = .overFullScreen
        requestFormVC?.isModalInPresentation = true
        self.present(requestFormVC!, animated: true)
    }
    
    func openShippedCustomDeclaration(cell: UITableViewCell) {
        let customDeclarationVC = self.storyboard!.instantiateViewController(withIdentifier: "CustomDeclarationFormViewController") as? CustomDeclarationFormViewController
        let shippedCell = cell as? ShippedTableViewCell
        shippedCell?.hideOptions(frame: (shippedCell?.optionButton.frame)!)
        customDeclarationVC?.atIndex = shippedCell!.indexPath
        customDeclarationVC?.packageList = self.packagesList
        customDeclarationVC?.modalPresentationStyle = .overFullScreen
        customDeclarationVC?.isModalInPresentation = true
        self.present(customDeclarationVC!, animated: true)
    }
    
    func openShippedShowPackageDetails(cell: UITableViewCell) {
        let packageDetailVC = self.storyboard!.instantiateViewController(withIdentifier: "PackageDetailsViewController") as? PackageDetailsViewController
        packageDetailVC?.modalPresentationStyle = .overFullScreen
        packageDetailVC?.isModalInPresentation = true
        let shippedCell = cell as? ShippedTableViewCell
        shippedCell?.hideOptions(frame: (shippedCell?.optionButton.frame)!)
        
        let requestId = packagesList[shippedCell!.indexPath!.row]["id"] as? Int
        packageDetailVC?.requestID = requestId
//        packageDetailVC?.requestID = []
        self.present(packageDetailVC!, animated: true)
    }
    
    func checkoutAndPayTapped(cell: UITableViewCell) {
        let checkOutAndPay = storyboard?.instantiateViewController(withIdentifier: "CheckoutAndPayViewController") as? CheckoutAndPayViewController
        checkOutAndPay?.modalPresentationStyle = .overFullScreen
        present(checkOutAndPay!, animated: true, completion: nil)
    }
    
    func shippedOptionButtonTapped(atIndex: IndexPath) {
        let shippedCell = storageAndShipmentTableView!.cellForRow(at: atIndex) as? ShippedTableViewCell
       
        if shippedCell!.isShowing!  {

            shippedCell?.hideOptions(frame: shippedCell!.optionButton!.frame)
        }
        if !shippedCell!.isShowing! {

            shippedCell?.openOptionsView(currentSelection: currentSelection, frame: shippedCell!.optionButton!.frame)
        }
    }
    
   
    
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
    
    func openShowPackageDetails(cell: UITableViewCell) {
        let packageDetailVC = self.storyboard!.instantiateViewController(withIdentifier: "PackageDetailsViewController") as? PackageDetailsViewController
        packageDetailVC?.modalPresentationStyle = .overFullScreen
        packageDetailVC?.isModalInPresentation = true
        let outgoingCell = cell as? OutgoingTableViewCell
        outgoingCell?.hideOptions(frame: (outgoingCell?.optionButton.frame)!)
        
        let requestId = packagesList[outgoingCell!.indexPath!.row]["id"] as? Int
        packageDetailVC?.requestID = requestId
//        packageDetailVC?.requestID = []
        self.present(packageDetailVC!, animated: true)

    }
    
//    func updateFilteredList(list: [[String : Any]]) {
//
//    }
    
    func returnPackageTapped(indexPath: IndexPath) {
        print(indexPath.row)
        let returnPackageVC = storyboard?.instantiateViewController(withIdentifier: "ReturnPackageViewController") as? ReturnPackageViewController
        returnPackageVC?.returnPackageVCDelegate = self
        guard let packageId = packagesList[indexPath.row]["package_id"] as? String else {
            return
        }
        returnPackageVC?.packageId = packageId
        returnPackageVC?.modalPresentationStyle = .overFullScreen

        present(returnPackageVC!, animated: true, completion: nil)
    }
    
    func addCustomDetailTapped(indexPath: IndexPath) {
        let customDetailVC = storyboard?.instantiateViewController(withIdentifier: "CustomDetailViewController") as? CustomDetailViewController
        print(indexPath.row)
//        customDetailVC?.indexPath = indexPath
        let package = packagesList[indexPath.row] as? [String: Any]
        customDetailVC?.package = package
        customDetailVC?.modalPresentationStyle = .overFullScreen
//        customDetailVC?.packagesList = packagesList
        present(customDetailVC!, animated: true, completion: nil)

    }
    
    func specialServiceTapped(indexPath: IndexPath) {
        let specialServicesVC = storyboard?.instantiateViewController(withIdentifier: "SpecialServicesViewController") as? SpecialServicesViewController
        print(indexPath.row)
        guard let packageId = packagesList[indexPath.row]["package_id"] as? String else {
            COMMON_ALERT.showAlert(msg: "Invalid ID")
            return
        }
         let paidServices = packagesList[indexPath.row]["paid_services"] as? [String]
//        let freeServices = packagesList[indexPath.row]["free_services"]
        
        
        specialServicesVC?.paidServices = paidServices
//        specialServicesVC?.freeServices = freeServices
        specialServicesVC?.packageId = packageId
        specialServicesVC?.modalPresentationStyle = .overFullScreen
        specialServicesVC?.specialServicesVCDelegate = self
        present(specialServicesVC!, animated: true, completion: nil)

    }
    
    func checkBoxTapped(indexPath: IndexPath) {
        
        if selectedIndex.contains(indexPath.row) {
          let containedIndex = selectedIndex.firstIndex{ $0 == indexPath.row }
            selectedIndex.remove(at: containedIndex!)
            itemsSelectedLabel.text = "\(selectedIndex.count) items selected"
            print(selectedIndex)
            storageAndShipmentCollectionView.reloadData()
            enableConsolidateAndShip()
        }
        else if selectedIndex.contains(indexPath.row) == false {
            
            self.selectedIndex.append(indexPath.row)
            print(selectedIndex)

            itemsSelectedLabel.text = "\(selectedIndex.count) items selected"
            storageAndShipmentCollectionView.reloadData()
            enableConsolidateAndShip()

        }

    }
    
    func enableConsolidateAndShip() {
        if selectedIndex.count > 0 {
            
            DispatchQueue.main.async { [self] in
                consolidateAndShipButton.isHidden = false
//                storageAndShipmentCollectionView.bottomAnchor.constraint(equalTo: self.consolidateAndShipButton.topAnchor, constant: 8).isActive = true
////                storageAndShipmentCollectionView.reloadData()
//                self.view.layoutSubviews()
                
            }
        }
        else if selectedIndex.count < 1 {
            
            DispatchQueue.main.async { [self] in
                consolidateAndShipButton.isHidden = true
//                storageAndShipmentCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
//                self.view.layoutSubviews()

            }
            

        }
    }
    
    func updateUI(completion: @escaping (Bool) -> Void) {
       
//               self.changeUI(status: currentSelection)
        let userToken = getCurrentUserToken()
           storageVM = StorageVM()
        
            storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all", success: {[self] response in
                let data = response["data"] as? [String: [[String: Any]]]
                let list = data!["list"]!
                self.packagesList = list
                self.changeUI(status: self.currentSelection)
                completion(true)
            
                DispatchQueue.main.async {
                    self.storageAndShipmentCollectionView.reloadData()
                }

            }, failure: { str in
                completion(false)

                COMMON_ALERT.showAlert(msg: str)
            })
            
        }
      
    

    
    func updateMyStorage() {
        let userToken = getCurrentUserToken()
           storageVM = StorageVM()
            storageVM?.getPackagesList(token: userToken, status: currentSelection.rawValue, subStatus: "all", success: {[self] response in
            
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
    }
    
    
}

extension StorageAndShipmentViewController: ConsolidateAndShipVCDelegate, SuccessAlertVCDelegate {
    
    
    func showSuccessVC(uniquqKey: String) {
        DispatchQueue.main.async {
            self.updateUI { [self] success in
                if success {
                    let successVC = storyboard?.instantiateViewController(withIdentifier: "SuccessAlertViewController") as? SuccessAlertViewController
                    successVC?.modalPresentationStyle = .overFullScreen
                    successVC?.uniqueKey = uniquqKey
                    successVC?.successAlertVCDelegate = self
                    self.present(successVC!, animated: false, completion: nil)
                }
            }
        }
        
    }
    
    func dismissedAlertController() {
        selectedIndex.removeAll()
        self.updateMyStorage()
    }
    
    
}


