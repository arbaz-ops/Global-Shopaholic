//
//  EditCustomDetailsViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 31/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class EditCustomDetailsViewController: UIViewController {

    @IBOutlet weak var editCustomDetailsView: UIView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var editCustomDetailTableView: UITableView!
    var trackingNumber: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        editCustomDetailsView.roundTopCorners(radius: 25)
        upperView.roundTopCorners(radius: 25)
        // Do any additional setup after loading the view.
    }
    private func loadTable() {
        editCustomDetailTableView.backgroundColor = .clear
        editCustomDetailTableView.allowsSelection = false
        
        editCustomDetailTableView.separatorStyle = .none
        editCustomDetailTableView.alwaysBounceVertical = false
        editCustomDetailTableView.register(UINib(nibName: "EditCustomDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "EditCustomDetailsTableViewCell")
        editCustomDetailTableView.delegate = self
        editCustomDetailTableView.dataSource = self
    }

    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
