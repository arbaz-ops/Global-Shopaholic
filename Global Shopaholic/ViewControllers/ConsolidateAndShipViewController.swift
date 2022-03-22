//
//  ConsolidateAndShipViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 15/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

protocol ConsolidateAndShipVCDelegate {
    func showSuccessVC(uniquqKey: String)
}

class ConsolidateAndShipViewController: UIViewController, getAddressesDelegate {
    
    
    var storageVM: StorageVM?
    var addresses:  [[String: Any]]? = [[String: Any]]()
    var getAddressVM: GetAddressesVM?
    var packagesList: [[String: Any]]? = [[String: Any]]()
    var selectedIndex: [Int]? = [Int]()
    var customValue = 0
    var packages: [String]? = [String]() 
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var consolidateAndShipView: UIView!
    @IBOutlet weak var consolidateTableView: UITableView!
    
    
    var consolidateAndShipVCDelegate: ConsolidateAndShipVCDelegate?
    var customValues = [Int]()
    var additionalInfo: [String]? = [String]()
    var selectedPackages: [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        getAddressVM = GetAddressesVM()
        getAddressVM?.delegate = self
        upperView.roundTopCorners(radius: 25)
        
        for index in selectedIndex! {
            guard let packagesID = packagesList![index]["package_id"] as? String else {
                let alert = UIAlertController(title: "", message: "Package Does not exist.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            packages?.append(packagesID)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         let userToken = getCurrentUserToken()
        
        getAddressVM?.getAddress(accessToken: userToken)
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
        
    private func loadTable() {
        consolidateTableView.register(UINib(nibName: "ConsolidateAndShipTableViewCell", bundle: nil), forCellReuseIdentifier: "ConsolidateAndShipTableViewCell")
        consolidateTableView.delegate = self
        consolidateTableView.dataSource = self
        consolidateTableView.alwaysBounceVertical = false
        consolidateTableView.separatorStyle = .none
    }
   
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func didFailToGetAddress(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didFinishedGettingAddress(response: NSDictionary) {
        guard let data = response["data"] as? [String: Any],let addresses = data["addreses"] as? [[String: Any]] else {
            COMMON_ALERT.showAlert(msg: "Some thing went wrong.")
            return
        }
        self.addresses = addresses
        configureCell()

    }
    
    func configureCell() {
        let consolidateAndShipCell = consolidateTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? ConsolidateAndShipTableViewCell
        calculateCustomValue()
        for address in addresses! {
            let street = address["street"] as? String
            let  city = address["city"] as? String
            let state = address["state"] as? String
            let zipCode = address["zip_code"] as? String
            let country = address["country"] as? String
           
            let completeAddress = "\(street!), "  + "\(city!), "  + "\(state!), " + "\(zipCode!), "  + "\(country!)"
            consolidateAndShipCell?.addressDropDownField.optionArray.append(completeAddress)
            
            
        }
        
        
        
        consolidateAndShipCell?.customValueLabel.text = "$ \(customValue)"
        consolidateAndShipCell!.totalPackagesConsolidatedLabel.text = "\(selectedIndex!.count)"
        
     }
//    func configureDropDown(addresses: [[String: Any]]) {
//        let
//    }
    
    
    func calculateCustomValue() {
        for index in selectedIndex! {
            let packageCustomDetail = packagesList![index]["package_custom_detail"] as? [[String: Any]]
            if packageCustomDetail!.count < 1 {
                print("no")
            }
           else if packageCustomDetail!.count > 0 {
                let valueString = packageCustomDetail![0]["value"] as? String
               let valueDouble = Double.init(valueString!)
               let valueInt = Int.init(valueDouble!)
               self.customValues.append(valueInt)
              
            }
            
        }
        
        for i in customValues {
            customValue += i
        }
        
    }
    
}
