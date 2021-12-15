//
//  FAQsVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class FAQsVC: BaseViewController {
    var faqData = NSDictionary()
    var FaqArrayData = NSArray()
    @IBOutlet weak var SideMenuView: UIView!
    let itemNames = ["About Us","Payments","Shipping", "Return policies", "Dangerous Goods"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnShowMenu: UIButton!
    var FAQdataSource = [FAQModel]()
     let imgOpen = UIImage(systemName: "cross" )
       let imgClose = UIImage(systemName: "cross.fill" )
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        SideMenuView.layer.cornerRadius = SideMenuView.frame.height / 2
        self.tableView.estimatedRowHeight = 100;
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
       btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        getFaq()
    }
    
    func getFaq()
    {
        var FAQVM = FaqVM()
        FAQVM.delegate = self
        FAQVM.GetFaq()
    }
    
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FAQsVC: FaqVMDelegate{
    func didGetFaq(response: NSDictionary) {
       
        self.setupFAQData(response: response)
    }
    
    func didFailedToGetFAQ(msg: String) {
       // print(response)
        COMMON_ALERT.showAlert(msg: msg)
    }
    func setupFAQData(response: NSDictionary)
    {
        faqData = response["data"] as! NSDictionary
        print("faqData")
        
      
        FaqArrayData = (faqData["list"] as! NSArray)
        print(FaqArrayData)
//        let list = data["list"] as! NSArray
//        var tmpFAQ: NSDictionary!
//        
//        for listofData in list{
//            tmpFAQ = (listofData as! NSDictionary)
//            let HeaderName = tmpFAQ["name"] as! String
//            let faqArray = tmpFAQ["faqs"] as! [[String:Any]]
//            var titlelist = [String]()
//            var desList = [String]()
//                    for json in faqArray
//                    {
//                        titlelist.append(json["title"] as! String)
//                        desList.append(json["description"] as! String)
//                    }
//            FAQdataSource.append(FAQModel(titlelist, items: desList, Header: HeaderName))
//        }
//        
//        let HeaderName = tmpFAQ["name"] as! String
//        let faqArray = tmpFAQ["faqs"] as! [[String:Any]]
//        var titlelist = [String]()
//        var desList = [String]()
//        for json in faqArray
//        {
//            titlelist.append(json["title"] as! String)
//            desList.append(json["description"] as! String)
//        }
        
//        FAQdataSource.append(FAQModel(titlelist, items: desList, Header: HeaderName))
        self.tableView.reloadData()
    }
    
    
}



