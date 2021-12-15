//
//  BeginPurchaseVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/17/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import StepIndicator
class BeginPurchaseVC: UIViewController {
    
    

    var ContinueItemData: NSDictionary?
    var addedItems = false
    var isPurchaseCountinueMode = false
    var promoType = ["fixed","percentile"]
    var aspRequestId: String?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stepIndicatorView: StepIndicatorView!
    var categoryData: NSArray!
    var SummaryData: NSDictionary!
    var Categorykeys = [String]()
    var categoriesTitles = [String]()
    var serviceType = [String]()
    var servicesData: NSArray!
    var ActionOnMissingData: NSArray!
    var QuestionsForMissingItems = [String]()
    var missingItemsKeys = [String]()
    var user_data:UserDataClass!
    let userDefaults = UserDefaults()
    var itemdata: itemsData!
    var shippingData: shippingDataModel!
    var missingData: missingItemAction!
    var itemsDatasource = [itemsData]()
    var DataForSummary: ASPCombineData!
    var ASPSummaryData: ASPSummaryModel!
    var NumberOfitems = 1
    enum Steps {
        case Item
        case Shipping
        case Questions
        case Review
       
    }
    
 
    
    var CurrentStep: Steps!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = false
        self.tableView.estimatedRowHeight = 10;
        self.tableView.rowHeight = UITableView.automaticDimension
        CurrentStep = Steps.Item
        setupStepperIndicator()
        
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            var ASPVM = BeginAspVM()
            ASPVM.delegate = self
            ASPVM.GetAspView(token: user_data.token)
        }
       
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    private func setupStepperIndicator()
    {
            self.stepIndicatorView.numberOfSteps = 4
            self.stepIndicatorView.currentStep = 0
            self.stepIndicatorView.circleColor = hexStringToUIColor(hex: "00BCA3")
            self.stepIndicatorView.circleTintColor = hexStringToUIColor(hex: "00BCA3")
            self.stepIndicatorView.circleStrokeWidth = 2.0
            self.stepIndicatorView.circleRadius = 15.0
            self.stepIndicatorView.lineColor = hexStringToUIColor(hex: "#A1A1A1")
            self.stepIndicatorView.lineTintColor = hexStringToUIColor(hex: "#A1A1A1")
            self.stepIndicatorView.lineMargin = 0
            self.stepIndicatorView.lineStrokeWidth = 2.0
            self.stepIndicatorView.displayNumbers = false
            self.stepIndicatorView.direction = .leftToRight
    }
   

}




extension BeginPurchaseVC: BeginAspDelegate{
    func didSaveTillQuestion(response: NSDictionary) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didFailToSaveTillQuestion(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didSaveItemSuccessfully(response: NSDictionary) {
        print(response)
        self.navigationController?.popViewController(animated: true)
    }
    
    func didFailedToSaveItem(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    
    func didCreateASPRequestSuccessfully(response: NSDictionary) {
        print(response)
        let data = response["data"] as! NSDictionary
        aspRequestId = (data["asp_request_id"] as! String)
    }
    
    func DidFailedToCreateASPRequest(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didGetSummary(response: NSDictionary) {
        print(response)
        SummaryData = (response["data"] as! NSDictionary)
        var ASPVM = BeginAspVM()
        ASPVM.delegate = self
        
        ASPVM.CreateASPRequest(token: user_data.token!, SummaryData: ASPSummaryData, isCountinue: isPurchaseCountinueMode)
        self.tableView.reloadData()
    }
    
    func DidFailedToGetSummary(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didGetAspView(response: NSDictionary) {
        print(response)
        let data = (response["data"] as! NSDictionary)
        servicesData = (data["services"] as! NSArray)
        categoryData = (data["categories"] as! NSArray)
        ActionOnMissingData = (data["actions_on_missing_item"] as! NSArray)
      
       
        for candidate in (categoryData as! [[String:Any]])
        {
            categoriesTitles.append(candidate["title"] as! String)
            Categorykeys.append(candidate["key"] as! String)
        }
        for data in (servicesData as! [[String:Any]])
        {
            serviceType.append(data["title"] as! String)
        }
        for data in (ActionOnMissingData as! [[String:Any]])
        {
            QuestionsForMissingItems.append(data["title"] as! String)
            missingItemsKeys.append(data["key"] as! String)
        }

        if isPurchaseCountinueMode
        {
            let data = (ContinueItemData!["items"] as! NSArray)
            data.forEach{value in
                let tmpData = value as! NSDictionary
                print(tmpData)
                let categoryData = (tmpData["category"] as! NSDictionary)
                let category = (categoryData["title"] as! String)
                itemsDatasource.append(itemsData(itemLink: (tmpData["url"] as! String), itemCategory: category, itemName: (tmpData["name"] as! String), itemQuantity: (tmpData["quantity"] as! NSNumber).stringValue, itemSize: (tmpData["size"] as! String), itemColor: (tmpData["color"] as! String), itemPrice: (tmpData["price"] as! NSNumber).stringValue))
            }
            
                NumberOfitems = itemsDatasource.count
            shippingData = shippingDataModel(ShippingCharges: (ContinueItemData!["shipping_charges"] as? NSNumber)?.stringValue, Service: (ContinueItemData!["shipping_service"] as? String), promocode: (ContinueItemData!["promocode"] as? String), Amount: (ContinueItemData!["promocode_amount"] as? NSNumber)?.stringValue, promoCodeType: (ContinueItemData!["type_of_promocode"] as? String))
            
           // missingData = missingItemAction(missingItemOpt: <#T##String?#>, detail: <#T##String?#>)
        }
        else{
            itemsDatasource.append(itemsData())
            print(itemsDatasource.count)
        }
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    func failedToGetAspView(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    
    
}
