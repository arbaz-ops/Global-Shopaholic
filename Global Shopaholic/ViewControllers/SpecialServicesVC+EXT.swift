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
        insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "delete")

    }
    
    func packageConsolidationDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "delete")


    }
    
    func repackingDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "delete")


    }
    
    func removeItemBoxesDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "delete")


    }
    
    func removeAllProtectivePackagingDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete")
    }
    
    func removeShipperBoxesDeSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete")

    }
    
    func removeInvoicesAndPricesTagsDeSelected() {
        insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "delete")

    }
    
    func doNotRemoveShipperBoxesDeSelected() {
        insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "delete")

    }
    
    func doNotRemoveItemBoxesDeSelected() {
        insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "delete")

    }
    
    
    
    
    func packageContentPhotoSelected() {
        insertFreeServices(freeServices: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "insert")

    }
    
    func packageConsolidationSelected() {
        
        insertFreeServices(freeServices: FreeServices.PackageConsolidation.rawValue, flag: "insert")
    }
    
    func repackingSelected() {
        
        insertFreeServices(freeServices: FreeServices.Repacking.rawValue, flag: "insert")
    }
    
    func removeItemBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveItemsBoxes.rawValue, flag: "insert")
    }
    
    func removeAllProtectivePackagingSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveProtectivePackaging.rawValue, flag: "insert")
    }
    
    func removeShipperBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveShipperBoxes.rawValue, flag: "insert")
    }
    
    func removeInvoicesAndPricesTagsSelected() {
        
        insertFreeServices(freeServices: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "insert")
    }
    
    func doNotRemoveShipperBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "insert")
    }
    
    func doNotRemoveItemBoxesSelected() {
        
        insertFreeServices(freeServices: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "insert")
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
    
    func insertFreeServices(freeServices: FreeServices.RawValue, flag: String?) {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: freeServices, flag: flag!, description: "", success: { response in
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
