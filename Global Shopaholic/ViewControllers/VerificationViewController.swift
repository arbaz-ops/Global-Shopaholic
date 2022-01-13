//
//  VerificationViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 10/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {

    @IBOutlet weak var verificationTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        verificationTableView.register(UINib(nibName: "VerificationTableViewCell", bundle: nil), forCellReuseIdentifier: "VerificationTableViewCell")
        verificationTableView.delegate = self
        verificationTableView.dataSource = self
        verificationTableView.backgroundColor = .clear
        
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
