//
//  CreditCardViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 11/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController {

    @IBOutlet weak var creditCardView: UIView!
    @IBOutlet weak var creditCardTableView: UITableView!
    @IBOutlet weak var upperView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        upperView.roundTopCorners(radius: 25)
        creditCardTableView.roundTopCorners(radius: 25)
        loadTableView()
        // Do any additional setup after loading the view.
    }
    
    private func loadTableView() {
        creditCardTableView.backgroundColor = .clear
        creditCardTableView.separatorStyle = .none
        creditCardTableView.delegate = self
        creditCardTableView.dataSource = self
        creditCardTableView.allowsSelection = false
        creditCardTableView.showsVerticalScrollIndicator = false
        creditCardTableView.roundTopCorners(radius: 25)
        creditCardTableView.register(UINib(nibName: "CreditCardTableViewCell", bundle: nil), forCellReuseIdentifier: "CreditCardTableViewCell")
    }
  
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
