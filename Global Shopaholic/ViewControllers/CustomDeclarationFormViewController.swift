//
//  CustomDeclarationFormViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormViewController: UIViewController {

    @IBOutlet weak var customDeclarationFormTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        // Do any additional setup after loading the view.
    }
    
    private func loadTable() {
        customDeclarationFormTableView.separatorStyle = .none
        customDeclarationFormTableView.backgroundColor = .clear
        
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
