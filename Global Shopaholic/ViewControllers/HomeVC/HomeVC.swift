//
//  HomeVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
import AKSideMenu
import RappleProgressHUD
class HomeVC: BaseViewController {
    @IBOutlet weak var SideMenuView: UIView!
    @IBOutlet weak var NotificationView: UIView!
    @IBOutlet weak var StorageShippingView: UIView!
    @IBOutlet weak var AssistedPurchaseView: UIView!
    
    @IBOutlet weak var DeliveredLblCount: UILabel!
    @IBOutlet weak var ShippedLblCount: UILabel!
    @IBOutlet weak var OutGoindLblCount: UILabel!
    @IBOutlet weak var StorageLblCount: UILabel!
    @IBOutlet weak var ShippingCalculatorView: UIView!
    @IBOutlet weak var TopConstraints: NSLayoutConstraint!
    @IBOutlet weak var TrailingConstraints: NSLayoutConstraint!
    @IBOutlet weak var BottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var LeadingConstaints: NSLayoutConstraint!
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    let userDefaults = UserDefaults.standard
    var user_data:UserDataClass!
    @IBOutlet weak var UserImage: UIImageView!
    var activeTextField : UITextField? = nil

    
    @IBOutlet weak var btnShowMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
          
            GetInits()
        }
       
        NotificationView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        NotificationView.layer.cornerRadius = NotificationView.frame.height / 2
        SideMenuView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        SideMenuView.layer.cornerRadius = SideMenuView.frame.height / 2
        
        ShippingCalculatorView.layer.cornerRadius = 10
        StorageShippingView.layer.cornerRadius = 10
        AssistedPurchaseView.layer.cornerRadius = 10
        ShippingCalculatorView.DropShadowView()
        StorageShippingView.DropShadowView()
        AssistedPurchaseView.DropShadowView()
        setGestures()
        
    }
    func setGestures()
    {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.openShippingCalculator))
        self.ShippingCalculatorView.addGestureRecognizer(gesture)

        
    }
    @objc func openShippingCalculator(sender : UITapGestureRecognizer) {
        let viewController = (self.storyboard?.instantiateViewController(withIdentifier: "ShippingCalculatorVC"))!
        self.navigationController?.fadeTo(viewController)
    }
    override func viewWillAppear(_ animated: Bool) {
        TopConstraints.constant = 0
        BottomConstraints.constant = 0
        LeadingConstaints.constant = 0
        NotificationCenter.default.addObserver(self, selector: #selector(HomeVC.HomeVCkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(HomeVC.HomeVCkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func SideMenu(_ sender: UIButton) {
     
        self.onSlide(sender: sender)
        
        
    }
    @IBAction func TmpOnboarding(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "onBoardingRoot") as! onBoardingRoot
                self.navigationController?.pushViewController(vc, animated: true)


    }
    
    
    func GetInits()
    {
     let loginep = endpoints()
        WebService.GetRequestWithoutToken(Token: user_data.token!, strURL: loginep.StorageInfoEP, is_loader_required: false, params: ["":""]) { (response) in
         if (response["success"] as! Bool) == true
         {
            print(response)
            let data = response["data"] as! NSDictionary
            let warehouseAddress = data["warehouseAddress"] as! NSDictionary
            let StatusData = data["status"] as! NSDictionary
            self.UpdateCounts(data: StatusData)
            self.user_data = UserDataClass(token: self.user_data.token!, userData: self.user_data.userData!, warehouseAddress: warehouseAddress)
            do {
                let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self.user_data!, requiringSecureCoding: false)
            print("GetInits")
                self.userDefaults.set(encodedData, forKey: "user_data")
                self.userDefaults.synchronize()
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.allowsSelection = false
                self.tableView.estimatedRowHeight = 10;
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.reloadData()
                
            }catch let error{
                print(error.localizedDescription)
            }
             
           
         }
         else{
            
            COMMON_ALERT.showAlert(msg: (response["message"] as! String))
            
         }
     } failure: { (error) in
         RappleActivityIndicatorView.stopAnimation()

         print("something bad happend")
     }

     //self.delegate?.didFinished()
        //self.delegate?.DidReceiveResponse()
    }
    func UpdateCounts(data: NSDictionary)
    {
        StorageLblCount.text = (data["unassigned_package_count"] as! NSNumber).stringValue
        OutGoindLblCount.text = (data["outgoing_request_count"] as! NSNumber).stringValue
        ShippedLblCount.text = (data["shipped_request_count"] as! NSNumber).stringValue
        DeliveredLblCount.text = (data["delivered_request_count"] as! NSNumber).stringValue

    }
}
