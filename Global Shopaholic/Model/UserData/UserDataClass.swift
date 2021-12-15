//
//  UserDataClass.swift
//  Dry Clean City
//
//  Created by Kishore on 26/06/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
class UserDataClass: NSObject, NSCoding{
    
    var token:String!
    var userData: NSDictionary!
    var warehouseAddress:NSDictionary?
    
    
    init(token:String,userData:NSDictionary,warehouseAddress:NSDictionary?) {
         
        self.token = token
        self.userData = userData
        print("warehouseAddressss")
   
        self.warehouseAddress = warehouseAddress
     }
         required convenience init(coder aDecoder: NSCoder) {
             let token = aDecoder.decodeObject(forKey: "token") as! String
             let userData = aDecoder.decodeObject(forKey: "userData") as! NSDictionary
             let warehouseAddress = aDecoder.decodeObject(forKey: "warehouseAddress") as? NSDictionary
            self.init(token:token,userData:userData,warehouseAddress:warehouseAddress)
     }
         func encode(with aCoder: NSCoder) {
            aCoder.encode(token, forKey: "token")
            aCoder.encode(userData, forKey: "userData")
            aCoder.encode(warehouseAddress, forKey: "warehouseAddress")
    }

}

