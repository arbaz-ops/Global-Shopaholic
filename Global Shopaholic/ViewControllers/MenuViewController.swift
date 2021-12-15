//
//  MenuViewController.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
var ViewName = ""

class MenuViewController: UIViewController {
    let userdef = UserDefaults()
    @IBOutlet var SideMenuBtns: [UIButton]!
    //    @IBOutlet weak var LogoutBtn: UIButton!
    //    @IBOutlet weak var FAQBtn: UIButton!
    //    @IBOutlet weak var SettingsBtn: UIButton!
    //    @IBOutlet weak var HowItWorksBtn: UIButton!
    //    @IBOutlet weak var StorageBtn: UIButton!
    //    @IBOutlet weak var AssistantPurchaseBtn: UIButton!
    //    @IBOutlet weak var WalletBtn: UIButton!
    //    @IBOutlet weak var ShippingCalBtn: UIButton!
    //    @IBOutlet weak var HomeButton: UIButton!
    var btnMenu: UIButton!
    var delegate: SlideMenuDelegate?
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuBtns.forEach { (btn) in
            btn.layer.cornerRadius = 10
            
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        CurrentSelection()
        
    }
    @IBAction func buttonaction(_ sender: UIButton) {
        
        
        
        
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if(sender == self.btnCloseMenuOverlay){
                index = -1
                
                print("sender")
            }
            delegate?.SlideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    @IBAction func HomeAction(_ sender: UIButton) {
        if sender.tag != btnMenu.tag
        {
            print("")
            setUI(sender: sender)
            hide(withIdentifier: "HomeVCC")
        }
        else{
            print("Idher ha")
           justHide()
        }
        
        
        
    }
    @IBAction func ShipAction(_ sender: UIButton) {
        print("ShipAction")
        if sender.tag != btnMenu.tag
        {
            setUI(sender: sender)
            
            hide(withIdentifier: "ShippingCalculatorVC")
        }
        else{
            print("Idher ha \(sender.tag)")
            
            justHide()
        }
    }
    @IBAction func WalletAction(_ sender: UIButton) {
      if sender.tag != btnMenu.tag
        {
            setUI(sender: sender)
            
            hide(withIdentifier: "WalletVC")
        }
        else{
            print("Idher ha")
            justHide()
        }
        //WalletVC
    }
    @IBAction func AssistantPurAction(_ sender: UIButton) {
        if sender.tag != btnMenu.tag
            {
                setUI(sender: sender)
                
                hide(withIdentifier: "AssistedPurchaseVC")
            }
            else{
                print("Idher ha")
                justHide()
            }
        
    }
    @IBAction func StorageAction(_ sender: UIButton) {
        if sender.tag != btnMenu.tag
            {
                setUI(sender: sender)
                hide(withIdentifier: "StorageShipmentVC")
            
            }
            else{
                print("Idher ha")
                justHide()
            }
      
        //StorageShipmentVC
    }
    @IBAction func HowAction(_ sender: UIButton) {
        setUI(sender: sender)
        
    }
    @IBAction func SettingsAction(_ sender: UIButton) {
        if sender.tag != btnMenu.tag
            {
                setUI(sender: sender)
                
                hide(withIdentifier: "SettingsVC")
            }
            else{
                print("Idher ha")
                justHide()
            }
      
    }
    @IBAction func FAQAction(_ sender: UIButton) {
          if sender.tag != btnMenu.tag
              {
                  setUI(sender: sender)
                  
                  hide(withIdentifier: "FAQsVC")
              }
              else{
                  print("Idher ha")
                    // defaultView(sender:sender)
                justHide()
              }
        
    }
    @IBAction func NewsUpdates(_ sender: UIButton) {
        if sender.tag != btnMenu.tag
            {
                setUI(sender: sender)
                
                hide(withIdentifier: "NewsAndUpdatesVC")
            }
            else{
                print("Idher ha")
                  // defaultView(sender:sender)
              justHide()
            }
    }
    
    
    
    @IBAction func LogoutAction(_ sender: UIButton) {
        setUI(sender: sender)
        
        
        userdef.removeObject(forKey: "user_data")
        userdef.removeObject(forKey: "event_data")
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! UINavigationController
               
               UIApplication.shared.windows.first?.rootViewController = viewController
               UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
    func CurrentSelection()
    {
        SideMenuBtns.forEach { (btn) in
            if btn.tag == btnMenu.tag{
                btn.tintColor = .white
                btn.backgroundColor = hexStringToUIColor(hex: "00BBA3")
                btn.setTitleColor(.white, for: .normal)
            }else{
                btn.tintColor = .white
                btn.backgroundColor = .clear
                btn.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    func setUI(sender: UIButton){
        //    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        SideMenuBtns.forEach { (btn) in
            if btn == sender{
                btn.backgroundColor = hexStringToUIColor(hex: "00BBA3")
                btn.setTitleColor(.white, for: .normal)
                btn.tintColor = .white
            }else{
                btn.backgroundColor = .clear
                btn.setTitleColor(.black, for: .normal)
                btn.tintColor = .black
            }
        }
    }
    func hide(withIdentifier: String)
    {
        if (self.delegate != nil) {
            let index = Int32(-1)
            print(index)
            delegate?.SlideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            
            
            
            if withIdentifier == "HomeVCC"
            {
                self.navigationController?.popToRootViewController(animated: true)
            }
            else{
                let viewController = (self.storyboard?.instantiateViewController(withIdentifier: withIdentifier))!
                self.navigationController?.fadeTo(viewController)
                
            }
            
            
        })
    }
    
    func defaultView(sender:UIButton)
    {
        
        
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if(sender == self.btnCloseMenuOverlay){
                index = -1
                
                print("sender")
            }
            delegate?.SlideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    func justHide(){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    
}
