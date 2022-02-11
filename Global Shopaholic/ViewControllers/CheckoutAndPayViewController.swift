//
//  CheckoutAndPayViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 04/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CheckoutAndPayViewController: UIViewController {

    @IBOutlet weak var checkoutAndPayTableView: UITableView!
    @IBOutlet weak var backButtonView: UIView!
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
        
        checkoutAndPayTableView.allowsSelection = false
        checkoutAndPayTableView.showsVerticalScrollIndicator = false
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
