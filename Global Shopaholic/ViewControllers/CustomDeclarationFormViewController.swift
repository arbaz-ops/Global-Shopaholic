//
//  CustomDeclarationFormViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormViewController: UIViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var customDeclarationFormTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        upperView.roundTopCorners(radius: 25)
        
    }
    
    private func loadTable() {
        
        customDeclarationFormTableView.separatorStyle = .none
        customDeclarationFormTableView.backgroundColor = .clear
        customDeclarationFormTableView.dataSource = self
        customDeclarationFormTableView.delegate = self
        customDeclarationFormTableView.register(UINib(nibName: "CustomDeclarationFormTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDeclarationFormTableViewCell")
        customDeclarationFormTableView.alwaysBounceVertical = true
    }

   
}
