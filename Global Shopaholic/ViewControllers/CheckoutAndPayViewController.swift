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

    @IBOutlet weak var checkoutAndPayTableView: UITableView!
    @IBOutlet weak var backButtonView: UIView!
    
    var walletVM: WalletVM?
    override func viewDidLoad() {
        super.viewDidLoad()
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
        do {
        
        let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
        guard let userData = encodedUserData else {
            return
        }
        let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
            
            guard let userToken = unarchivedData?.token else {
                print("Failed to get the token")
                return
            }
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
            
        } catch let error {
            print(error)
        }
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
