//
//  CheckoutAndPayViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import RappleProgressHUD

class CheckoutAndPayViewController: UIViewController {

    
    var checkoutVM: CheckoutVM?
    @IBOutlet weak var checkoutAndPayTableView: UITableView!
    @IBOutlet weak var backButtonView: UIView!
    
    var packageDetail: [String: Any]?
    var walletVM: WalletVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutVM = CheckoutVM()

        InitUI()
        loadTable()
    }
    
    
    private func InitUI() {
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
        backButtonView.DropShadowView()
        
    }
    
    func loadTable() {
        checkoutAndPayTableView.backgroundColor = .clear
        checkoutAndPayTableView.separatorStyle = .none
        checkoutAndPayTableView.register(UINib(nibName: "CheckoutAndPayTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutAndPayTableViewCell")
        checkoutAndPayTableView.delegate = self
        checkoutAndPayTableView.dataSource = self
        checkoutAndPayTableView.alwaysBounceVertical = false
        checkoutAndPayTableView.allowsSelection = false
        checkoutAndPayTableView.showsVerticalScrollIndicator = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
          super.viewDidAppear(animated)
            getWalletData()
            getCheckOutSummary()
    }
    
    
    func getCheckOutSummary() {
        let userToken = getCurrentUserToken()
        checkoutVM = CheckoutVM()
        
        guard let packageId = packageDetail!["unique_key"] as? String else {
            showAlert(message: "Failed to get package ID.")
            return
        }
        checkoutVM?.getCheckoutSummaryOutgoing(token: userToken, requestId: packageId,courier_service: "", payment_gateway: "",is_wallet: "" ,success: {[self] response in
            completion(response: response)
            
        }, failure: {[self] msg  in
            print(msg)
            showAlert(message: msg)
        })
    }
    
    func getWalletData() {
        let userToken = getCurrentUserToken()
        walletVM = WalletVM()
        RappleActivityIndicatorView.startAnimating()

        walletVM?.getWalletInfo(token: userToken, success: {[self] response in
            let data = response["data"] as? [String: Any]
            
            guard let currentBalance = data!["current_wallet_balance"] as? Double else {
                print("Failed to get the current balance")

                return
            }
            
           let cell = checkoutAndPayTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CheckoutAndPayTableViewCell
            cell?.walletCurrentBalance.text = "$ \(currentBalance)"
            RappleActivityIndicatorView.stopAnimation()

        }, failure: { str in
            print(str)
            RappleActivityIndicatorView.stopAnimation()

        })
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
    func completion(response: NSDictionary) {
        
        let data = response["data"] as? [String: Any]
        let checkoutAndPayCell = checkoutAndPayTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? CheckoutAndPayTableViewCell
        guard let address = data?["address"] as? [String: Any] ,
                let street = address["street"],
                let city = address["city"],
                let state = address["state"],
                let country = address["country"],
                let name = address["name"],
                let phone = address["phone"],
                let rates = data?["rates"] as? [[String: Any]],
                let totalCharges = data?["total"]
                 else {
            showAlert(message: "No Destination Address.")
            return
        }
        guard let packageId = packageDetail!["unique_key"] as? String else {
            showAlert(message: "Failed to get package ID.")
            return
        }
        guard  let chargesSummary = data?["charges_summary"] as? [String: Any] else {
            return
        }
        
        checkoutAndPayCell?.requestID = packageId
        checkoutAndPayCell?.updateChargesSummary(chargesSummary: chargesSummary, totalCharges: totalCharges as! Double)
        
        checkoutAndPayCell?.rates = rates
        checkoutAndPayCell?.shipToAddressLabel.text = "Ship To Address: \(name)"
        checkoutAndPayCell?.addressLabel.text = "\(street), \(city), \(state), \(country)"
        checkoutAndPayCell?.phoneNumberLabel.text = "Phone Number: \(phone)"
        
    }
}
