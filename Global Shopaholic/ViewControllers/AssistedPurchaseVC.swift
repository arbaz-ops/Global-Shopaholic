//
//  AssistedPurchaseVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/17/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class AssistedPurchaseVC: UIViewController {
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    enum CurrentTableViewData {
        case Active
        case Saved
        case PendingPayment
        case Cancelled
        case Completed
    }
    
    var currentSelection: CurrentTableViewData!
    
    
    var UserAspData: NSDictionary!
    var savedItemData: NSArray!
    var ProcessingData: NSArray!
    var processingFilterdData: NSArray!
    var savedFilteredData: NSArray!
    var cancelledFilteredData: NSArray!
    var CancelledData: NSArray!
    var completedData: NSArray!
    var PaymentPendingData: NSArray!
    
    
    
    
    //var SavedItems: SavedItemsModel!
    
    @IBOutlet weak var APBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var CompletedBtn: UIButton!
    @IBOutlet weak var CancelledBtn: UIButton!
    @IBOutlet weak var PaymentPendingBtn: UIButton!
    @IBOutlet weak var SavedBtn: UIButton!
    @IBOutlet weak var Activebtn: UIButton!
    var user_data:UserDataClass!
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        tableView.allowsSelection = false
        currentSelection = CurrentTableViewData.Active
       
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            var ASPVM = AspVMP()
            ASPVM.delegate = self
            ASPVM.getSavedItemsData(token: user_data.token)
        }
    }
    func setupUI(){
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        
        Activebtn.layer.cornerRadius = 10
        Activebtn.DropShadowView()
        
        SavedBtn.layer.cornerRadius = 10
        SavedBtn.DropShadowView()
        
        PaymentPendingBtn.layer.cornerRadius = 10
        PaymentPendingBtn.DropShadowView()
        
        CancelledBtn.layer.cornerRadius = 10
        CancelledBtn.DropShadowView()
        
        CompletedBtn.layer.cornerRadius = 10
        CompletedBtn.DropShadowView()
        
    }
    @IBAction func BackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ActiveAction(_ sender: UIButton) {
        currentSelection = CurrentTableViewData.Active
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        Activebtn.RemoveShadow()
        
        SavedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        SavedBtn.DropShadowView()
        
        PaymentPendingBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        PaymentPendingBtn.DropShadowView()
        
        CancelledBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CancelledBtn.DropShadowView()
        
        CompletedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CompletedBtn.DropShadowView()
       animateBuddy()
        
        
    }
    @IBAction func SavedAction(_ sender: UIButton) {
        currentSelection = CurrentTableViewData.Saved
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        Activebtn.DropShadowView()
        
        SavedBtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        SavedBtn.RemoveShadow()
        
        PaymentPendingBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        PaymentPendingBtn.DropShadowView()
        
        CancelledBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CancelledBtn.DropShadowView()
        
        CompletedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CompletedBtn.DropShadowView()
        animateBuddy()
    }
    @IBAction func PaymentPending(_ sender: UIButton) {
        currentSelection = CurrentTableViewData.PendingPayment
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        Activebtn.DropShadowView()
        
        SavedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        SavedBtn.DropShadowView()
        
        PaymentPendingBtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        PaymentPendingBtn.RemoveShadow()
        
        CancelledBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CancelledBtn.DropShadowView()
        
        CompletedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CompletedBtn.DropShadowView()
        
    }
    @IBAction func CancelledAction(_ sender: UIButton) {
        currentSelection = CurrentTableViewData.Cancelled
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        Activebtn.DropShadowView()
        
        SavedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        SavedBtn.DropShadowView()
        
        PaymentPendingBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        PaymentPendingBtn.DropShadowView()
        
        CancelledBtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        CancelledBtn.RemoveShadow()
        
        CompletedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CompletedBtn.DropShadowView()
        animateBuddy()
    }
    @IBAction func CompletedAction(_ sender: UIButton) {
        currentSelection = CurrentTableViewData.Completed
        Activebtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        Activebtn.DropShadowView()
        
        SavedBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        SavedBtn.DropShadowView()
        
        PaymentPendingBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        PaymentPendingBtn.DropShadowView()
        
        CancelledBtn.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        CancelledBtn.DropShadowView()
        
        CompletedBtn.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
        CompletedBtn.RemoveShadow()
        
    }
    
    @IBAction func APAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "BeginPurchaseVC") as! BeginPurchaseVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}




extension AssistedPurchaseVC: AspDelegate{
    func didGetSavedItemsData(response: NSDictionary) {
        let data = response["data"] as! NSDictionary
       
        let list = data["list"] as! NSDictionary
        print(list)
        if let _ = list["saved"]
        {
            savedItemData = (list["saved"] as! NSArray)
            savedFilteredData = savedItemData
        }
        if let _ = list["cancelled"]
        {
            CancelledData = (list["cancelled"] as! NSArray)
            cancelledFilteredData = CancelledData
        }
        if let _ = list["payment_pending"]
        {
            PaymentPendingData = (list["payment_pending"] as! NSArray)
        }
        if let _ = list["processing"]
        {
            ProcessingData = (list["processing"] as! NSArray)
            processingFilterdData = ProcessingData
        }
//        if let _ = list["saved"]
//        {
//            savedItemData = (list["saved"] as! NSArray)
//        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        
        
    }
    
    func didFailedTogetSavedItemData(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    
}







extension AssistedPurchaseVC: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        switch currentSelection {
        case .Active:
            if searchText.isEmpty{
                 processingFilterdData = ProcessingData
             print(processingFilterdData)
             self.animateBuddy()
             return
             }
             
             let predicate = NSPredicate(format: "asp_id contains[c] %@", searchText)
             processingFilterdData = (ProcessingData.filtered(using: predicate) as NSArray)

        case .Cancelled:
            if searchText.isEmpty{
                 cancelledFilteredData = CancelledData
            
             self.animateBuddy()
             return
             }
             
             let predicate = NSPredicate(format: "asp_id contains[c] %@", searchText)
            cancelledFilteredData = (CancelledData.filtered(using: predicate) as NSArray)

        case .Saved:
            if searchText.isEmpty{
                 savedFilteredData = savedItemData
             
             self.animateBuddy()
             return
             }
             
             let predicate = NSPredicate(format: "asp_id contains[c] %@", searchText)
            savedFilteredData = (savedItemData.filtered(using: predicate) as NSArray)

        case .PendingPayment:
            break
        case .Completed:
            break
        default:
            break
        }
        
        

        self.animateBuddy()

    }
}
