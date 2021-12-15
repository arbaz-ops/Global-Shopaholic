//
//  SettingsVC+EXT+Table.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


import UIKit

extension SettingsVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ShopaholicAddress != nil{
            return 1
        }
        else
        {
            return .zero
        }
        
    }
    @objc func approveBtnAction(sender:AnyObject)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
      let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
    
        let vc = self.storyboard?.instantiateViewController(identifier: "CourierVC") as! CourierVC
        vc.dataSource = (ShopaholicAddress[indexPath!.section] as! NSDictionary)
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    @objc func checkButtonTapped(sender:AnyObject) {
          let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        if indexPath != nil {
            let vc = self.storyboard?.instantiateViewController(identifier: "AddAddressVC") as! AddAddressVC
            vc.CountryData = self.CountryArrayData
            vc.isEditMode = true
            vc.EditData = (ShopaholicAddress[indexPath!.section] as! NSDictionary)
            
            print((ShopaholicAddress[indexPath!.section] as! NSDictionary))
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func DeleteButton(sender:AnyObject) {
          let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        print("DeleteButton")
       deleteAddress(indexPath: indexPath)
    }
    func deleteAddress(indexPath:IndexPath?){
        let currentAddress = (ShopaholicAddress[indexPath!.section] as! NSDictionary)
        if indexPath != nil {
            let alert = UIAlertController(title: "Alert !", message: "Are You sure you want to delete this address ?", preferredStyle: UIAlertController.Style.alert)

          
            alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive,handler: { (action) in
                self.tableView.reloadData()
                self.tableView.reloadRows(at: [indexPath!], with: .left)
                var deleteVM = DropAddressVM()
                deleteVM.delegate = self
                deleteVM.deleteAddress(accessToken: self.user_data.token, addressID: (currentAddress["address_id"] as! String))
                
            }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
           
            //vc.EditData = (ShopaholicAddress[indexPath!.section] as! NSDictionary)
           
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib1 = UINib(nibName: "AddressesCell", bundle: nil)
                
        tableView.register(nib1, forCellReuseIdentifier: "AddressesCell")
                
                
       let cell = tableView.dequeueReusableCell(withIdentifier: "AddressesCell") as! AddressesCell
        let tmpData = ShopaholicAddress[indexPath.section] as! NSDictionary
        
        
        if (tmpData["status"] as! String) != "approved"
        {
            cell.CellView.backgroundColor = hexStringToUIColor(hex: "#FF8087")
            cell.ApprovedAddressBtn.setTitle("Not Approved", for: .normal)
            cell.ApprovedAddressBtn.setTitleColor(.white, for: .normal)
            //cell.AddressApprovalLbl.text = "Not Approved"
                //cell.AddressApprovalLbl.textColor = .white
        }
        else{
            cell.ApprovedAddressBtn.setTitle("Approved", for: .normal)
        }
        
        
        cell.HeaderLabel.text = "Address # \(indexPath.section + 1)"
        
        cell.UserNameLabel.text = (tmpData["name"] as? String)
        cell.PhoneNumberLabel.text = (tmpData["phone"] as! String)
        cell.CompleteAddressLabel.text = "\(tmpData["street"] as! String), \(tmpData["country"] as! String)"
       cell.ApprovedAddressBtn.addTarget(self, action:#selector(self.approveBtnAction), for: .touchUpInside)
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
       footerView.backgroundColor = .clear
       
           return footerView
       }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     return true
   }
       func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 10
       }
    func numberOfSections(in tableView: UITableView) -> Int {
        if ShopaholicAddress != nil{
            self.tableView.restore()
            return ShopaholicAddress.count
        }
        else{
            self.tableView.setEmptyMessage("no address found")
            return .zero
        }
        
    }
    func tableView(_ tableView: UITableView,
    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.deleteCellSection(Index: indexPath)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView,
    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
                  let deleteAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, handler) in
                    self.editAdddress(indexPath: indexPath)
                    
                  }
                       deleteAction.backgroundColor = hexStringToUIColor(hex: "00BBA3")
                       let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
                       configuration.performsFirstActionWithFullSwipe = true
                       return configuration
       
    }
    func deleteCellSection(Index:IndexPath)
    {
       // Boxes.remove(at: Index.section)
        deleteAddress(indexPath: Index)
        
    }
    func editAdddress(indexPath:IndexPath)
    {
                    let vc = self.storyboard?.instantiateViewController(identifier: "AddAddressVC") as! AddAddressVC
            vc.CountryData = self.CountryArrayData
            vc.isEditMode = true
            vc.EditData = (ShopaholicAddress[indexPath.section] as! NSDictionary)
            
            print((ShopaholicAddress[indexPath.section] as! NSDictionary))
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
}


extension SettingsVC: DropAddressDelegate {
    func DidDeleteSuccessfully() {
        getAddresses()
    }
    
    func DidErrorOccuredWhileDeleting(error: String) {
        COMMON_ALERT.showAlert(msg: error)
    }
    
    
}
