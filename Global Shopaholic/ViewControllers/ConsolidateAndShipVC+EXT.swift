//
//  ConsolidateAndShipVC+EXT.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import Foundation

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
    
    
}
