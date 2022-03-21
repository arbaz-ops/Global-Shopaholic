//
//  ConsolidateAndShipViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 15/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

class ConsolidateAndShipViewController: UIViewController, getAddressesDelegate {
    
    var addresses:  [[String: Any]]? = [[String: Any]]()
    var getAddressVM: GetAddressesVM?
    var packagesList: [[String: Any]]? = [[String: Any]]()
    var selectedIndex: [Int]? = [Int]()
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var consolidateAndShipView: UIView!
    @IBOutlet weak var consolidateTableView: UITableView!
    var selectedPackages: [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        getAddressVM = GetAddressesVM()
        getAddressVM?.delegate = self
        upperView.roundTopCorners(radius: 25)
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
        for address in addresses! {
            
            let street = address["street"] as? String
            let  city = address["city"] as? String
            let state = address["state"] as? String
            let zipCode = address["zip_code"] as? String
            let country = address["country"] as? String
           
            let completeAddress = street!  + city!  + state! + zipCode!  + country!
            print(completeAddress)
            
         
        }
        
        consolidateAndShipCell!.totalPackagesConsolidatedLabel.text = "\(selectedIndex!.count)"
        
     }
//    func configureDropDown(addresses: [[String: Any]]) {
//        let
//    }
    
}
