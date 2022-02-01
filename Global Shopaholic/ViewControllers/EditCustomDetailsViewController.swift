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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editCustomDetailsView.roundTopCorners(radius: 25)
        upperView.roundTopCorners(radius: 25)
        // Do any additional setup after loading the view.
    }
    

   

}
