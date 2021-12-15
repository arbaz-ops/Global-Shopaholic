//
//  itemReviewVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/9/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class itemReviewVC: UIViewController {
    var headers = ["Item","Shipping Info","Additional Info","Payment","Summary"]
    @IBOutlet weak var tableView: UITableView!
    var itemData: NSDictionary!
    var itemDetail: NSArray!
    var shippingdata: shippingDataModel?
    var missingData: missingItemAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(itemData!)
        sortData()
        self.tableView.allowsSelection = false
    }
    func sortData()
    {
        itemDetail = (itemData["items"] as! NSArray)
        let missing = itemData["missed_item_action"] as? NSDictionary
        self.missingData = missingItemAction(missingItemOpt: (missing?["title"] as? String), detail: "")
        print(itemDetail)
        shippingdata = shippingDataModel(ShippingCharges: (itemData["shipping_charges"] as? NSNumber)?.stringValue, Service: (itemData["shipping_service"] as! String), promocode: (itemData["promocode"] as? String), Amount: (itemData["promocode_amount"] as? NSNumber)?.stringValue, promoCodeType: (itemData["type_of_promocode"] as? String))
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension itemReviewVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return itemDetail.count
            
        }
        return 1
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let nib1 = UINib(nibName: "itemCell", bundle: nil)
                                   
            tableView.register(nib1, forCellReuseIdentifier: "itemCell")
                                   
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! itemCell
            let data = (itemDetail[indexPath.row] as! NSDictionary)
            cell.ItemNoLbl.text = "\(indexPath.row + 1)"
            cell.NameLbl.text = (data["name"] as! String)
            cell.QuantityLbl.text = (data["quantity"] as! NSNumber).stringValue
            cell.ColoLbl.text = (data["color"] as! String)
            cell.SizeLbl.text = (data["size"] as! String)
            let category = (data["category"] as! NSDictionary)
            cell.CategoryLbl.text = (category["title"] as! String)
            cell.openLinkBtn.addTarget(self, action:#selector(self.openLink), for: .touchUpInside)
            return cell
        }
        if indexPath.section == 1
        {
            let nib1 = UINib(nibName: "ShippingInfoCell", bundle: nil)
                                   
            tableView.register(nib1, forCellReuseIdentifier: "ShippingInfoCell")
                                   
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingInfoCell") as! ShippingInfoCell
            cell.ShippingChargesLbl.text = (itemData["shipping_charges"] as? String)
            cell.ShippingServiceLbl.text = (itemData["shipping_service"] as? String)
            return cell
        }
        if indexPath.section == 2
        {
            let nib1 = UINib(nibName: "infoCell", bundle: nil)
                                   
            tableView.register(nib1, forCellReuseIdentifier: "infoCell")
            
                                   
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! infoCell
            cell.DHeaderLbl.text = "In case of Missing item"
            let miss = itemData["missed_item_action"] as? NSDictionary
            
            cell.detailLbl.text = (miss?["title"] as? String)
            return cell
        }
        if indexPath.section == 3
        {
            let nib1 = UINib(nibName: "infoCell", bundle: nil)
                                   
            tableView.register(nib1, forCellReuseIdentifier: "infoCell")
                                   
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! infoCell
            cell.DHeaderLbl.text = "Payment Method"
            
            return cell
        }
        else
        {
            let nib1 = UINib(nibName: "ReviewSummaryCell", bundle: nil)
            
            tableView.register(nib1, forCellReuseIdentifier: "ReviewSummaryCell")
                                   
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewSummaryCell") as! ReviewSummaryCell
            return cell
        }
        
        
        
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = Bundle.main.loadNibNamed("ReviewHeader", owner: self, options: nil)?.first as! ReviewHeader
        headerView.HeaderLbl.text = headers[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    @objc func openLink(sender: UIButton)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
         let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let link = itemDetail[indexPath!.row] as! NSDictionary
        let url = (link["url"] as! String)
        let validUrlString = url.hasPrefix("http") ? url : "http://\(url)"

        if let url = URL(string: validUrlString) {
            UIApplication.shared.open(url)
        }
    }
    
    
}
