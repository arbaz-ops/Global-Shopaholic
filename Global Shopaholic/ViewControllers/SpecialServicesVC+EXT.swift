//
//  SpecialServicesVC+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit


extension SpecialServicesViewController: SpecialServicesTableViewCellDelegate {
   
    func itemTestingSelected() {
        
        insertPaidService(paidService: PaidServices.TestDevice.rawValue)

    }
    
  
    func detailedPictureSelected() {
        
        insertPaidService(paidService: PaidServices.DetailedPhoto.rawValue)

    }
    
    
    
    func splitBoxesSelected() {
        
        insertPaidService(paidService: PaidServices.Split.rawValue)
    }
    
  
    func packageContentPhotoSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "delete", description: "")
        }

    }
    
    func packageConsolidationSelected(selected: Bool?) {
        
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "delete", description: "")
            
        }
        
    }
    
    func repackingSelected(selected: Bool?) {
        
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "delete", description: "")
        }
    }
    
    func removeItemBoxesSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "delete", description: "")
        }
       

    }
    
    func removeAllProtectivePackagingSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.RemoveProtectivePackaging.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.RemoveProtectivePackaging.rawValue, flag: "delete", description: "")
        }
//        insertFreeServices(freeServices: FreeServices.RemoveProtectivePackaging.rawValue, flag: "insert", description: "")
    }
    
    func removeShipperBoxesSelected(selected: Bool?) {
        
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete", description: "")
        }
       
    }
    
    func removeInvoicesAndPricesTagsSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "insert", description: "")
           
        case false:
            
            insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "delete", description: "")
        
        }
    }
    
    func doNotRemoveShipperBoxesSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "delete", description: "")
        }
       

    }
    
    func doNotRemoveItemBoxesSelected(selected: Bool?) {
        switch selected! {
        case true:
            insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "insert", description: "")
        case false:
            insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "delete", description: "")
        }
        
    }
    
    func submitButtonTapped(description: String?, other: Bool?) {
        if other!  {
            if description!.isEmpty {
                showAlert(message: "Please add description.")
            }
            else if !description!.isEmpty  {
                guard let description = description else {
                    return
                }
                insertFreeServices(freeServices: FreeServices.Other.rawValue, flag: "insert", description: description)
                self.dismiss(animated: true) {[self] in
                    specialServicesVCDelegate?.updateMyStorage()
                }
            }
        }
        else {
            self.dismiss(animated: true) {[self] in
                specialServicesVCDelegate?.updateMyStorage()
            }
        }
    }
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func insertFreeServices(freeServices: FreeServices.RawValue, flag: String?, description: String) {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: freeServices, flag: flag!, description: description, success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func insertPaidService(paidService: PaidServices.RawValue) {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachPaidServices(token: token, packageId: packageId, paidService: paidService, success: { response in
            print(response["message"])
            
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
