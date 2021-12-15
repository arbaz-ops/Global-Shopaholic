//
//  RequestFormViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 06/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class RequestFormViewController: UIViewController {
    
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var requestFormTableView: UITableView!
    var atIndex: IndexPath?
    var packageList: [[String:Any]]?
    
    var requestID: String?
    var consolidatedPackages: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upperView.roundTopCorners(radius: 35)
        requestFormTableView.backgroundColor = .clear

        loadTable()
        
    }
    
    private func loadTable() {
        requestFormTableView.register(UINib(nibName: "RequestFormTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestFormTableViewCell")
        requestFormTableView.delegate = self
        requestFormTableView.dataSource = self
    }
    
    

    @IBAction func closeFormTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


