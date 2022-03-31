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
    
    
    
    func packageContentPhotoDeSelected() {
        insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "delete", description: "")

    }
    
    func packageConsolidationDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "delete", description: "")


    }
    
    func repackingDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "delete", description: "")


    }
    
    func removeItemBoxesDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "delete", description: "")


    }
    
    func removeAllProtectivePackagingDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete", description: "")
    }
    
    func removeShipperBoxesDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete", description: "")

    }
    
    func removeInvoicesAndPricesTagsDeSelected() {
        insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "delete", description: "")

    }
    
    func doNotRemoveShipperBoxesDeSelected() {
        insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "delete", description: "")

    }
    
    func doNotRemoveItemBoxesDeSelected() {
        insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "delete", description: "")

    }
    
    
    
    
    func packageContentPhotoSelected() {
        insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "insert", description: "")

    }
    
    func packageConsolidationSelected() {
        
        insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "insert", description: "")
    }
    
    func repackingSelected() {
        
        insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "insert", description: "")
    }
    
    func removeItemBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "insert", description: "")
    }
    
    func removeAllProtectivePackagingSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveProtectivePackaging.rawValue, flag: "insert", description: "")
    }
    
    func removeShipperBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "insert", description: "")
    }
    
    func removeInvoicesAndPricesTagsSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "insert", description: "")
    }
    
    func doNotRemoveShipperBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "insert", description: "")
    }
    
    func doNotRemoveItemBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "insert", description: "")
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
                self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            
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
