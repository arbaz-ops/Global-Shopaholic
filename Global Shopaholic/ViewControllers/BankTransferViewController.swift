//
//  BankTransferViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 21/02/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class BankTransferViewController: UIViewController {

    @IBOutlet weak var bankTransferTableView: UITableView!
    @IBOutlet weak var bankTransferView: UIView!
    @IBOutlet weak var upperView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        upperView.roundTopCorners(radius: 25)
        bankTransferView.roundTopCorners(radius: 25)
        loadTable()
        // Do any additional setup after loading the view.
    }
    

    private func loadTable() {
        bankTransferTableView.backgroundColor = .clear
        bankTransferView.roundTopCorners(radius: 25)
        bankTransferTableView.register(UINib(nibName: "BankTransferTableViewCell", bundle: nil), forCellReuseIdentifier: "BankTransferTableViewCell")
        bankTransferTableView.delegate = self
        bankTransferTableView.dataSource = self
        bankTransferTableView.allowsSelection = false
        bankTransferTableView.separatorStyle = .none
        
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
