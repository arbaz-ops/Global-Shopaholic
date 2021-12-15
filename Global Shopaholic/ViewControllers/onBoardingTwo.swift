//
//  onBoardingTwo.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 23/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class onBoardingTwo: UIViewController {

    @IBOutlet weak var PagerThree: UIView!
    @IBOutlet weak var PagerTwo: UIView!
    @IBOutlet weak var PagerOne: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        PagerOne.layer.cornerRadius = PagerOne.frame.height / 2
        PagerTwo.layer.cornerRadius = PagerTwo.frame.height / 2
        PagerThree.layer.cornerRadius = PagerThree.frame.height / 2
        // Do any additional setup after loading the view.
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
