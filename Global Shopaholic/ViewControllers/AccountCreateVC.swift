//
//  AccountCreateVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 04/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class AccountCreateVC: UIViewController {

    @IBOutlet var VerifyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        VerifyBtn.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    @IBAction func LoadOTP(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
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
