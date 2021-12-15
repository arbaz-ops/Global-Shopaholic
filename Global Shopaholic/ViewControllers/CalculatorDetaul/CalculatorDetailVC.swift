//
//  CalculatorDetailVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/21/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CalculatorDetailVC: UIViewController {

    enum Services {
        case Aramex
        case UPS
        case FedEx
        case DHL
        case USPS
       
    }
    
    var CurrentService: Services!
    
    @IBOutlet weak var tableView: UITableView!
    var response: NSDictionary!
    var DataSource: NSMutableArray!
    var allkeys:[Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 10;
            self.tableView.rowHeight = UITableView.automaticDimension
            tableView.delegate = self
            tableView.dataSource = self
        tableView.allowsSelection = false
        GetDataSorted()
    }
    func GetDataSorted()
    {
        
        allkeys = response.allKeys as! [String]
print(allkeys)
    }

}


extension CalculatorDetailVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = response.value(forKey: allkeys[section] as! String) as! NSArray
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return response.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib1 = UINib(nibName: "CalculatorDetailCellTableViewCell", bundle: nil)
        
                               
        tableView.register(nib1, forCellReuseIdentifier: "CalculatorDetailCellTableViewCell")
                               
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatorDetailCellTableViewCell") as! CalculatorDetailCellTableViewCell
        let data = response.value(forKey: allkeys[indexPath.section] as! String) as! NSArray
        if data.count != 0
        {
            
            //  {
//            "carrier": "Aramex",
//            "service_image": "1589396101-20200513025501670.png",
//            "service": "Aramex Priority Parcel Express",
//            "rate": "122.67",
//            "actual_rate": "84.62"
//          }
            print()
            print("Key \(allkeys[indexPath.section] as! String) has \(data.count)'s" )
            let da = data[indexPath.row] as! NSDictionary
            cell.Rate.text = (da["rate"] as! String)
            cell.ServiceType.text = (da["service"] as! String)
            if (allkeys[indexPath.section] as! String) == "dhl"
            {
                cell.DetailView.backgroundColor = hexStringToUIColor(hex: "#CF002F")
                cell.Img.image = UIImage(named: "DHL")
                    
            }
            if (allkeys[indexPath.section] as! String) == "fedex"
            {
                cell.DetailView.backgroundColor = hexStringToUIColor(hex: "#FE6500")
                cell.Img.image = UIImage(named: "fedex")
            }
            if (allkeys[indexPath.section] as! String) == "usps"
            {
                cell.DetailView.backgroundColor = hexStringToUIColor(hex: "#00609D")
                cell.Img.image = UIImage(named: "USPS")

            }
            if (allkeys[indexPath.section] as! String) == "ups"
            {
                cell.DetailView.backgroundColor = hexStringToUIColor(hex: "#200100")
                cell.Img.image = UIImage(named: "ups")
            }
            if (allkeys[indexPath.section] as! String) == "aramax"
            {
                cell.DetailView.backgroundColor = hexStringToUIColor(hex: "#FF1105")
                cell.Img.image = UIImage(named: "aramex")
                
            }
            cell.DeliveryTime.text = (da["estimated_delivery_time"] as! String)
            return cell
        }
        
        return UITableViewCell(frame: CGRect.zero)
        
    }


}
