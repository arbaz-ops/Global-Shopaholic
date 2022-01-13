//
//  AppDelegate.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true

//        PayPalMobile.initializeWithClientIds(forEnvironments: [PayPalEnvironmentProduction: "APP-AfX6acn7XdfKIlR26WVwM29qU8Oaw9w7i65Ihli6h_EYYdcM9p4Yizl9X7ZYIsUoB9zWilQxKpfvi7O9", PayPalEnvironmentSandbox: ""])
        
//        PayPalMobile.initializeWithClientIds(forEnvironments: [PayPalEnvironmentProduction: "AaXZTE36s-gLWOeJCFNJ-Dfu7i5Qpq8PWYLqJmh-A9L3dAyb3xXtuiBlCoK8HU4kN0G22PE81wgzPMXp", PayPalEnvironmentSandbox: "AaXZTE36s-gLWOeJCFNJ-Dfu7i5Qpq8PWYLqJmh-A9L3dAyb3xXtuiBlCoK8HU4kN0G22PE81wgzPMXp"])
        return true
    }

    
  

}

