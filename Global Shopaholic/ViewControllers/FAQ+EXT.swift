//
//  FAQ+EXT.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation

import UIKit

extension FAQsVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      

        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let nib1 = UINib(nibName: "FAQCell", bundle: nil)
                      
        tableView.register(nib1, forCellReuseIdentifier: "FAQCell")
                      
                      
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCell") as! FAQCell
        let Data = FaqArrayData[indexPath.section] as! NSDictionary
        
        cell.FAQlbl.text = (Data["name"] as! String)
////        var imageView: UIImageView?
//        if indexPath.row > 0, let title = item.title?[indexPath.row - 1], let Des = item.description?[indexPath.row - 1] {
//            let nib1 = UINib(nibName: "SubRow", bundle: nil)
//
//            tableView.register(nib1, forCellReuseIdentifier: "SubRow")
//
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "SubRow") as! SubRow
//            cell.QuestionsLbl.text = title
//            cell.AnswerLbl.text = Des
//            return cell
//        }else {
           
//            if item.Header != nil {
//                imageView = UIImageView(image: item.isExpanded ? self.imgClose : self.imgOpen)
//            }
        
        
        
        
        
        
           return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return FaqArrayData.count
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
        
        let data = FaqArrayData[indexPath.section] as! NSDictionary
        let ArraySubData = data["faqs"] as! NSArray
        let header = data["name"] as! String
        print(ArraySubData)
        let vc = self.storyboard?.instantiateViewController(identifier: "ShowSubFaqsVC") as! ShowSubFaqsVC
        vc.SubFAQ_QA = ArraySubData
        vc.headerText = header
       self.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
//        let item = self.FAQdataSource[indexPath.section]
//        print(item)
//       
//        
//        let vc = self.storyboard?.instantiateViewController(identifier: "ShowSubFaqsVC") as! ShowSubFaqsVC
//        if indexPath.row == 0 && item.title != nil {
//                  self.FAQdataSource[indexPath.section].isExpanded = !item.isExpanded
//                  let indexSet = IndexSet(integer: indexPath.section)
//                  tableView.reloadSections(indexSet, with: .automatic)
//              } else {
//                  // non-expandable menu item tapped
//              }
//        
//        vc.FAQdataSource = [FAQdataSource[indexPath.section]]
//        self.present(vc, animated: true, completion: nil)
//        if indexPath.row == 0 && item.title != nil {
//            self.FAQdataSource[indexPath.section].isExpanded = !item.isExpanded
//            let indexSet = IndexSet(integer: indexPath.section)
//            tableView.reloadSections(indexSet, with: .automatic)
//        } else {
//            // non-expandable menu item tapped
//        }
    }
    
}
