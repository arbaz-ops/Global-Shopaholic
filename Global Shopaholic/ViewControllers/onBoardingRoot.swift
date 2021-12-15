//
//  onBoardingRoot.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 23/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import liquid_swipe

class ColoredController: UIViewController {
    var viewColor: UIColor = .white {
        didSet {
            viewIfLoaded?.backgroundColor = viewColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor
    }
    
}

class onBoardingRoot: LiquidSwipeContainerController, LiquidSwipeContainerDataSource {
    
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "onBoardingOne")
        let secondPageVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "onBoardingTwo")
        let thirdPageVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "onBoardingThree")
        
       
     //  let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "View2")
        var controllers: [UIViewController] = [firstPageVC, secondPageVC,thirdPageVC]

        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
        return viewControllers[index]
    }
    

}









//
//class onBoardingRoot: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
