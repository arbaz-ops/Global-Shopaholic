//
//  CustomDetailViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDetailViewController: UIViewController {

    @IBOutlet weak var customDetailTableView: UITableView!
    @IBOutlet weak var upperView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        upperView.roundTopCorners(radius: 35)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func loadTable() {
        customDetailTableView.separatorStyle = .none
        customDetailTableView.alwaysBounceVertical = false
        customDetailTableView.dataSource = self
        customDetailTableView.delegate = self
        customDetailTableView.register(UINib(nibName: "CustomDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDetailTableViewCell")
    }

  

}
