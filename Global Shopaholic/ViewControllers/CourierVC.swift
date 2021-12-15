//
//  CourierVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/9/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import SDWebImage
class CourierVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var data: NSArray!
    var dataSource: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = (dataSource["log"] as! NSArray)
        print(data)
        if (dataSource["status"] as! String) == "approved"
        {
            headerLabel.text = "Approved"
        }
        else{
            headerLabel.text = "Unapproved"
        }
        self.tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib1 = UINib(nibName: "CouriersCell", bundle: nil)
                               
        tableView.register(nib1, forCellReuseIdentifier: "CouriersCell")
                               
        let cell = tableView.dequeueReusableCell(withIdentifier: "CouriersCell") as! CouriersCell
        let tmpdata = (data[indexPath.row] as! NSDictionary)
        
        cell.cellImg.sd_setImage(with: URL(string: (tmpdata["img_url"] as! String)), placeholderImage: UIImage(named: "placeHolder.png"))
        if tmpdata["is_validated"] as! String == "not_validated"
        {
            cell.cellLbl.text = "Not Validated"
            cell.cellLbl.backgroundColor = hexStringToUIColor(hex: "#FF8087")
        }
        else
        {
            cell.cellLbl.text = "Validated"
        }
        return cell

    }

}
