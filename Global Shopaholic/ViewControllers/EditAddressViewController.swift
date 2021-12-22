//
//  EditAddressViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class EditAddressViewController: UIViewController {

    var atIndex: IndexPath?
    var packageList: [[String: Any]]?
    @IBOutlet weak var editAddressTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        // Do any additional setup after loading the view.
    }
    private func loadTable() {
        editAddressTableView.backgroundColor = .clear
        editAddressTableView.alwaysBounceVertical = false
        editAddressTableView.delegate = self
        editAddressTableView.dataSource = self
        editAddressTableView.register(UINib(nibName: "EditAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "EditAddressTableViewCell")
    }

  

}
