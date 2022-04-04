//
//  SpecialServicesViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol SpecialServicesViewControllerDelegate {
    func updateMyStorage()
}

class SpecialServicesViewController: UIViewController {

    var packageId: String?
    var paidServices: [String]? = []
    var freeServices: [String]? = []
    var serviceDescription: String?
    var specialServicesVCDelegate: SpecialServicesViewControllerDelegate?
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
        let specialServiceCell = specialServicesTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? SpecialServicesTableViewCell
        if specialServiceCell!.other!  {
            if specialServiceCell!.descriptionTextView.text.isEmpty {
                showAlert(message: "Please add description.")
            }
            else if !specialServiceCell!.descriptionTextView.text.isEmpty  {
                guard let description = specialServiceCell!.descriptionTextView.text else {
                    return
                }
                insertFreeServices(freeServices: FreeServices.Other.rawValue, flag: "insert", description: description)
                self.dismiss(animated: true) {[self] in
                    specialServicesVCDelegate?.updateMyStorage()
                }
            }
        }
        else {
            self.dismiss(animated: true) {[self] in
                specialServicesVCDelegate?.updateMyStorage()
            }
        }
        
    }
}
