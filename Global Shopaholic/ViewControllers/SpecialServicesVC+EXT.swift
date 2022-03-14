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
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachPaidServices(token: token, packageId: packageId, paidService: PaidServices.TestDevice.rawValue, success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
  
    func detailedPictureSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()
        storageVM?.attachPaidServices(token: token, packageId: packageId, paidService: PaidServices.DetailedPhoto.rawValue, success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    
    
    func splitBoxesSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachPaidServices(token: token, packageId: packageId, paidService: PaidServices.Split.rawValue, success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    
    
    func packageContentPhotoDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func packageConsolidationDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.PackageConsolidation.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func repackingDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.Repacking.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeItemBoxesDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveItemsBoxes.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeAllProtectivePackagingDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveProtectivePackaging.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeShipperBoxesDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveShipperBoxes.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeInvoicesAndPricesTagsDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func doNotRemoveShipperBoxesDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func doNotRemoveItemBoxesDeSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        storageVM = StorageVM()

        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "delete", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    
    
    
    func packageContentPhotoSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.PackageContentPhotoDuringCosolidation.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func packageConsolidationSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.PackageConsolidation.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func repackingSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.Repacking.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeItemBoxesSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveItemsBoxes.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeAllProtectivePackagingSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveProtectivePackaging.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeShipperBoxesSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveShipperBoxes.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func removeInvoicesAndPricesTagsSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.RemoveInvoicesPricingTags.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func doNotRemoveShipperBoxesSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.DoNotRemoveShipperBoxes.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func doNotRemoveItemBoxesSelected() {
        let token = getCurrentUserToken()
        guard let packageId = packageId else {
            return
        }
        print(token)
        storageVM = StorageVM()
        storageVM?.attachFreeServices(token: token, packageId: packageId, freeService: FreeServices.DoNotRemoveItemsBoxes.rawValue, flag: "insert", description: "", success: { response in
            print(response["message"])
        }, failure: { str in
            let alert = UIAlertController(title: "", message: str, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    
}
