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
        print(packageDetail)
        
        guard let packageId = packageDetail!["unique_key"] as? String else {
            showAlert(message: "Failed to get package ID.")
            return
        }
        checkoutVM?.getCheckoutSummaryOutgoing(token: userToken, requestId: packageId,success: {[self] response in
            completion(response: response)
            
        }, failure: {[self] msg  in
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
        print(type(of: response))
        
        let data = response["data"] as? [String: Any]
        print(data!["shipment_id"] as! String)
//        let checkoutPackageDetail = data!["data"]
        
//        print(checkoutPackageDetail)
        
//        let checkoutPackageData = data!["data"]
//        print(checkoutPackageData)
        
    }
}
