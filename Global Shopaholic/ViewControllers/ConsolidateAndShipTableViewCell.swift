//
//  ConsolidateAndShipTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 15/03/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

class ConsolidateAndShipTableViewCell: UITableViewCell {

    @IBOutlet weak var customValueLabel: UILabel!
    @IBOutlet weak var totalPackagesConsolidatedLabel: UILabel!
    @IBOutlet weak var specialServicesTextView: UITextView!
    @IBOutlet weak var addressDropDownField: DropDown!
    @IBOutlet weak var detailView: UIView!
//    @IBOutlet weak var additionalInfoTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        detailView.layer.cornerRadius = 10
        addressDropDownField.layer.cornerRadius = 10
//        additionalInfoTableView.backgroundColor = .clear
        detailView.DropShadowView()
        specialServicesTextView.layer.cornerRadius = 10
        specialServicesTextView.setRightPaddingPoints(10)
        specialServicesTextView.setLeftPaddingPoints(10)
        addressDropDownField.setRightPaddingPoints(20)
        addressDropDownField.setLeftPaddingPoints(10)
//        loadTable()
    }
    
//    func loadTable() {
//        additionalInfoTableView.register(UINib(nibName: "AdditionalInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "AdditionalInfoTableViewCell")
//        additionalInfoTableView.delegate = self
//        additionalInfoTableView.separatorStyle = .none
//        additionalInfoTableView.dataSource = self
//        additionalInfoTableView.alwaysBounceVertical = false
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//extension ConsolidateAndShipTableViewCell: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AdditionalInfoTableViewCell") as? AdditionalInfoTableViewCell
//        cell!.configureCell(description: "sakjdhsajkhdkjsahjdkashkjsakdhjkshadjkshakjdhsjkahdkjshakj")
//        return cell!
//    }
//
//
//}
