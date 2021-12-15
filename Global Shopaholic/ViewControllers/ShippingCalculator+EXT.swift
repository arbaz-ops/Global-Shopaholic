//
//  ShippingCalculator+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 10/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation


import UIKit

extension ShippingCalculatorVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Boxes.count + 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section < Boxes.count
        {

             let nib1 = UINib(nibName: "BoxCell", bundle: nil)
                     
             tableView.register(nib1, forCellReuseIdentifier: "BoxCell")
                     
                     
            let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell") as! BoxCell
            cell.HeigthLbl.text = String(self.Boxes[indexPath.section].Heigth!)
            cell.WidthLbl.text  = String(self.Boxes[indexPath.section].Width!)
            cell.LengthLbl.text = String(self.Boxes[indexPath.section].Length!)
            cell.WeightLbl.text = String(self.Boxes[indexPath.section].Weight!)
            return cell
        }
        else
        {
              let nib1 = UINib(nibName: "AddBoxCell", bundle: nil)
                      
              tableView.register(nib1, forCellReuseIdentifier: "AddBoxCell")
                      
                      
             let cell = tableView.dequeueReusableCell(withIdentifier: "AddBoxCell") as! AddBoxCell
        cell.AddboxBtn.addTarget(self, action: #selector(ShippingCalculatorVC.addBox), for: .touchUpInside)
            cell.ShippingRatesBtn.addTarget(self, action: #selector(ShippingCalculatorVC.GetShippingRates), for: .touchUpInside)
            return cell
        }
        
    
        
    }
    func tableView(_ tableView: UITableView,
    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if Boxes.count > 0
        {
            if indexPath.section != Boxes.count
                  {
                  let deleteAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, handler) in
                   
                       }
                       deleteAction.backgroundColor = hexStringToUIColor(hex: "00BBA3")
                       let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
                       configuration.performsFirstActionWithFullSwipe = true
                       return configuration
                  }
        }
      
        return nil
    }

    func tableView(_ tableView: UITableView,
    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
         if Boxes.count > 0
             {
                 if indexPath.section != Boxes.count
                       {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.deleteCellSection(Index: indexPath)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
        }
        }
        return nil
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    
    func deleteCellSection(Index:IndexPath)
    {
        Boxes.remove(at: Index.section)
        tableView.reloadData()
        tableView.reloadRows(at: [Index], with: .left)
    }
    
    
    func editAdddress(Index:IndexPath)
    {
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
             let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
         footerView.backgroundColor = .clear
         
             return footerView
         }

         func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
             return 10
         }
   
    @objc func addBox()
    {
        TopAnch?.isActive = false
        CenteredVerticallyConstraint?.isActive = true
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion:  nil)
        
    }
    
    @objc func GetShippingRates()
    {
        let request = CalculatorRequest(Country: iSO, City: self.CityField.text!, ZipCode: self.ZipCodeField.text!, length: self.LengthArray, width: self.WidthArray, height: self.HeigthArray, weight: self.WeigthArray, Unit: measurement_unit)
        var calVM = CalculatorVM()
        calVM.delegate = self
        
        calVM.getCalculation(request: request, token: user_data.token)
    }
}
extension UITableView {

    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
