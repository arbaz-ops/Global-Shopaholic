//
//  ConsolidateAndShipViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 15/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class ConsolidateAndShipViewController: UIViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var consolidateAndShipView: UIView!
    @IBOutlet weak var consolidateTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        upperView.roundTopCorners(radius: 25)
        // Do any additional setup after loading the view.
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
    
}
