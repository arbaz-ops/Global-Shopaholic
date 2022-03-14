//
//  SpecialServicesViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class SpecialServicesViewController: UIViewController {

    var packageId: String? {
        didSet {
            print(packageId)
        }
    }
    var paidServices: [String]? {
        didSet {
            print(paidServices)
        }
    }
    @IBOutlet weak var specialServicesView: UIView!
    @IBOutlet weak var upperView: UIView!
    var storageVM: StorageVM?
    @IBOutlet weak var specialServicesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        upperView.roundTopCorners(radius: 25)
        
        loadTable()
    }
    
    private func loadTable() {
        specialServicesTableView.register(UINib(nibName: "SpecialServicesTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialServicesTableViewCell")
        specialServicesTableView.backgroundColor = .clear
        specialServicesTableView.delegate = self
        specialServicesTableView.dataSource = self
        specialServicesTableView.separatorStyle = .none
        specialServicesTableView.alwaysBounceVertical = false
        specialServicesView.roundTopCorners(radius: 25)
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
