//
//  SuccessAlertViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class SuccessAlertViewController: UIViewController {

    @IBOutlet weak var uniqueKeyLabel: UILabel!
    @IBOutlet weak var uniqueKeyView: UIView!
    @IBOutlet weak var successAlertView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        successAlertView.layer.cornerRadius = 10
        uniqueKeyView.layer.cornerRadius = 10
        successAlertView.isUserInteractionEnabled = true
        uniqueKeyView.isUserInteractionEnabled = true
        self.view.superview?.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
        uniqueKeyLabel.text = "sadshjaghjdgsjha"
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func configureVC(uniqueKey: String) {
        self.uniqueKeyLabel?.text = uniqueKey
    }
    
   

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    }


}
