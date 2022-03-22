//
//  ConsolidateAndShipVC+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation

import UIKit

extension ConsolidateAndShipViewController: ConsolidateAndShipTableViewCellDelegate {
    
    
   
    
    func insurePackage(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.Do_you_want_to_Insure_this_Package.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.Do_you_want_to_Insure_this_Package.rawValue)

        }
    }
    
    func packageContainsBattery(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.Does_this_Package_contain_Batteries.rawValue)

        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.Does_this_Package_contain_Batteries.rawValue)

        }
    }
    
    func sendAsGift(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.Send_as_Gift.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.Send_as_Gift.rawValue)
            
        }
    }
    
    func isDangerous(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.Is_dangerous_goods.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.Is_dangerous_goods.rawValue)
        }
    }
    
    func expressProcessing(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.express_processing.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.express_processing.rawValue)
        }
    }
    
    func prepareInOneBox(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.prepare_in_one_box.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.prepare_in_one_box.rawValue)
        }
    }
    
    func addFragile(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.add_fragile_sticker.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.add_fragile_sticker.rawValue)
        }
    }
    
    func useSmallestBox(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.use_the_smallest_box.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.use_the_smallest_box.rawValue)
        }
    }
    
    func packWithoutBubbleWrap(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.pack_without_bubble_wrap.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.pack_without_bubble_wrap.rawValue)
        }
    }
    
    func addExtraPaddingAndBubble(selected: Bool?) {
        if selected == true {
            self.additionalInfo?.append(AdditionalInfo.add_extra_padding_and_bubble_wrap.rawValue)
        }
        else if selected == false {
            removeAddtionalInfo(addtionalInfo: AdditionalInfo.add_extra_padding_and_bubble_wrap.rawValue)
        }
    }
    
    func acceptTermsAndCondition(selected: Bool?) {
        if selected == true {
            print("accepted")
        }
        else if selected == false {
            print("not accepted")
        }
    }
    
    
    func removeAddtionalInfo(addtionalInfo: String?) {
        if additionalInfo!.contains(addtionalInfo!) {
          let index =  additionalInfo?.firstIndex(of: addtionalInfo!)
            additionalInfo?.remove(at: index!)
            print("Removed")
        }
        else {
            print("Already Removed")
        }
    }
    
    
    func submitButtonTapped(selectedAddressIndex: Int?, specialService: String?) {
        
        guard let index = selectedAddressIndex else {
            let alert = UIAlertController(title: "", message: "Please select Destination Address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if  specialService!.count > 0 {
            guard let addressID = addresses![index]["address_id"] as? String else {
                return
            }
            storageVM = StorageVM()
            let userToken = getCurrentUserToken()
            storageVM?.createConsolidationRequest(token: userToken, packages: packages!, destinationAddress: addressID , specialRequestInfo: specialService, additionalInfo: additionalInfo, success: {[self] response in
                print(response)
                
                
                self.completion(response: response)
                
                
            }, failure: { error in
                let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
        }
        else {
            let alert = UIAlertController(title: "", message: "Special Service is required.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//        guard let serviceInfo = specialService else {
//
//            return
//        }
       
        
//

    }
    
    func completion(response: NSDictionary) {
        if response["message"] as! String == "The given data was invalid." {
            let alert = UIAlertController(title: "", message: response["message"] as? String, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if response["message"] as? String == "Server Error" {
            let alert = UIAlertController(title: "", message: "Server Error \n Please try again later.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let data = response["data"] as? [String: Any]
            let uniqueKey = data!["unique_key"] as? String
            self.dismiss(animated: true) {[self] in
                consolidateAndShipVCDelegate?.showSuccessVC(uniquqKey: uniqueKey!)
            }
        }
    }
    
    
}
