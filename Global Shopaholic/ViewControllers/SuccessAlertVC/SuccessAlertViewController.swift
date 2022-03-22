//
//  SuccessAlertViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class SuccessAlertViewController: UIViewController {

    @IBOutlet weak var cancelImageView: UIImageView!
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
        cancelImageView.isUserInteractionEnabled = true
        uniqueKeyLabel.text = "sadshjaghjdgsjha"
        cancelImageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismissController)))
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissController() {
        self.dismissController()
    }
    
    func configureVC(uniqueKey: String) {
        self.uniqueKeyLabel?.text = uniqueKey
    }
    
   

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.view.transform = CGAffineTransform.identity
            })
        }


}
