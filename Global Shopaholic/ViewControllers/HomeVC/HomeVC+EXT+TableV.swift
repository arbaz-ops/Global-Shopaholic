//
//  HomeVC+EXT+TableV.swift
//  Global Shopaholic
//
//  Created by Ahsan on 07/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let celll = UITableViewCell()
       
        if indexPath.section == 0
        {
           let nib1 = UINib(nibName: "WarehouseAddressCell", bundle: nil)
                   
                   tableView.register(nib1, forCellReuseIdentifier: "WarehouseAddressCell")
                   
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "WarehouseAddressCell") as! WarehouseAddressCell
            cell.UserName.text = "\(user_data.userData["first_name"] as! String) \(user_data.userData["last_name"] as! String)"
            cell.CompanyName.text = (user_data.warehouseAddress!["company"] as! String)
            cell.Address.text = (user_data.warehouseAddress!["street"] as! String)
            cell.City.text = (user_data.warehouseAddress!["city"] as! String)
            cell.State.text = (user_data.warehouseAddress!["state"] as! String)
            cell.ZipCode.text = (user_data.warehouseAddress!["zip_code"] as! String)
            cell.Howto.addTarget(self, action:#selector(self.showShippingAddress), for: .touchUpInside)
            
            
        return cell
        }
        if indexPath.section == 1
        {
            let nib1 = UINib(nibName: "IncomingPackageCell", bundle: nil)
                             
                             tableView.register(nib1, forCellReuseIdentifier: "IncomingPackageCell")
                             
                             
            let    cell = tableView.dequeueReusableCell(withIdentifier: "IncomingPackageCell") as! IncomingPackageCell
            cell.SpecialInsturctionsField.delegate = self
            cell.TrackNumberField.delegate = self
                  return cell
        }
      
        celll.selectionStyle = UITableViewCell.SelectionStyle.none
        return celll
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
    footerView.backgroundColor = .clear
    
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @objc func showShippingAddress()
    {
        let vc = self.storyboard?.instantiateViewController(identifier: "ShippingAddressVC") as! ShippingAddressVC
        self.present(vc, animated: true, completion: nil)
    }
    
    

    
    
    
    
}




extension HomeVC: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("HomeVC")
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    @objc func HomeVCkeyboardWillShow(notification: NSNotification) {
      print("keyboardWillShow")
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        print(activeTextField?.tag)
        if(shouldMoveViewUp) {
            
            self.view.frame.origin.y = 0 - 250
        }
    }

   
    @objc func HomeVCkeyboardWillHide(notification: NSNotification) {
          self.view.frame.origin.y = 0
      }
    
}
