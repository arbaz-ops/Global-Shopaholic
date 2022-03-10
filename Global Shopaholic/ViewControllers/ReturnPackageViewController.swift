//
//  ReturnPackageViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 07/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol ReturnPackageVCDelegate {
    func updateUI(completion: @escaping (Bool) -> Void)
}

class ReturnPackageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var packageId: String? {
        didSet {
            print(packageId)
            
        }
    }
    var returnPackageVCDelegate: ReturnPackageVCDelegate?
    var storageVM: StorageVM?
    var fileImage: UIImage?
    @IBOutlet weak var returnPackageView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var returnPackageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        InitUI()
        returnPackageView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        returnPackageView.roundTopCorners(radius: 25)
        returnPackageTableView.roundTopCorners(radius: 25)
    }
    
    private func InitUI() {
        upperView.roundTopCorners(radius: 25)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    private func loadTable() {
        returnPackageTableView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
        returnPackageTableView.allowsSelection = false
        
        returnPackageTableView.separatorStyle = .none
        returnPackageTableView.alwaysBounceVertical = false
        returnPackageTableView.register(UINib(nibName: "ReturnPackageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReturnPackageTableViewCell")
        returnPackageTableView.delegate = self
        returnPackageTableView.dataSource = self
    }
   

}
