//
//  ReturnPackageVC+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation
import UIKit
import RappleProgressHUD


extension ReturnPackageViewController: ReturnPackageTableViewCellDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func submitButtonTapped(type: String?, detail: String?) {
        guard let type = type else {
            let alert = UIAlertController(title: "", message: "Please select the type.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let image = fileImage else {
            let alert = UIAlertController(title: "", message: "Please select image Label.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if type == "yes" {
            storageVM = StorageVM()
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
                storageVM?.returnPackage(token: userToken, packageId: self.packageId!, type: type, detail: "", image: image, success: { response in
                    self.dismiss(animated: true) {
                        guard let message = response["message"] as? String else {
                            return
                        }
                        self.returnPackageVCDelegate?.updateUI(completion: { success in
                            if success {
                                COMMON_ALERT.showAlert(msg: message)
                            }
                            if !success {
                                
                            }
                        })
                       
                    }
                    
                }, failure: { str in
                    self.dismiss(animated: true) {
                        self.returnPackageVCDelegate?.updateUI(completion: { success in
                            if success {
                                COMMON_ALERT.showAlert(msg: str)
                            }
                            if !success {
                                
                            }
                        })

                        COMMON_ALERT.showAlert(msg: str)
                    }
                })
            
            } catch let error {
                COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
            }
            
        }
        else if type == "no" {
            
            if detail?.count == 0 {
                let alert = UIAlertController(title: "", message: "Please add the detail.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
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
                    storageVM?.returnPackage(token: userToken, packageId: self.packageId!, type: type, detail: detail!, image: image, success: { response in
                        self.dismiss(animated: true) {
                            guard let message = response["message"] as? String else {
                                return
                            }
                            self.returnPackageVCDelegate?.updateUI(completion: { success in
                                if success {
                                    COMMON_ALERT.showAlert(msg: message)
                                }
                                if !success {
                                    
                                }
                            })
                        }
                    }, failure: { str in
                        self.dismiss(animated: true) {
                            self.returnPackageVCDelegate?.updateUI(completion: { success in
                                if success {
                                    COMMON_ALERT.showAlert(msg: str)
                                }
                                if !success {
                                    
                                }
                            })
                        }
                    })
                } catch let error {
                    COMMON_ALERT.showAlert(msg: "Could not connect to server.\n Please try again later.")
                }
            }

        }
    }
    
    func chooseFileTapped(indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Attach Label Image.", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default, handler: {[self] _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction.init(title: "Capture", style: .default, handler: { [self] _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            print("Image Picked")
        self.fileImage = image
        guard let cell = returnPackageTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ReturnPackageTableViewCell else {
            return
        }
        RappleActivityIndicatorView.startAnimating()
        DispatchQueue.main.async {
            cell.chooseFileButton.setTitle("Attached", for: .normal)
        }
        RappleActivityIndicatorView.stopAnimation()

           self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
