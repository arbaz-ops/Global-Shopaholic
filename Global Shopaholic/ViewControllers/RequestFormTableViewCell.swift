//
//  RequestFormTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 06/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class RequestFormTableViewCell: UITableViewCell {

   
    @IBOutlet weak var shipmentBoxInformationTableView: UITableView!
    @IBOutlet weak var specialServices: UILabel!
    @IBOutlet weak var destinationAddress
    : UILabel!
    @IBOutlet weak var customValue: UILabel!
    @IBOutlet weak var consolidatedPackages: UILabel!
    @IBOutlet weak var requestId: UILabel!
    @IBOutlet weak var shipmentInvoiceViewBox: UIView!
    @IBOutlet weak var speacialServiceViewBox: UIView!
    @IBOutlet weak var destinationAddressViewBox: UIView!
    @IBOutlet weak var viewBox1: UIView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    var boxeDetail: [[String: Any]] = [[String: Any]]() {
        didSet {
            print("sadsadsadas")
      shipmentBoxInformationTableView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        viewBox1.layer.cornerRadius = 12
        destinationAddressViewBox.layer.cornerRadius = 10
        speacialServiceViewBox.layer.cornerRadius = 12
        shipmentInvoiceViewBox.layer.cornerRadius = 10
        loadTableView()
        
    }
    func loadTableView() {
        shipmentBoxInformationTableView.backgroundColor = .clear
        shipmentBoxInformationTableView.separatorStyle = .none
        shipmentBoxInformationTableView.layer.cornerRadius = 10
        shipmentBoxInformationTableView.register(UINib(nibName: "BoxDimensionsTableViewCell", bundle: nil), forCellReuseIdentifier: "BoxDimensionsTableViewCell")
        shipmentBoxInformationTableView.dataSource = self
        shipmentBoxInformationTableView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension RequestFormTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxeDetail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boxDimensionCell = tableView.dequeueReusableCell(withIdentifier: "BoxDimensionsTableViewCell") as? BoxDimensionsTableViewCell
        return boxDimensionCell!
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async {[self] in
            self.tableViewHeightConstraint.constant = self.shipmentBoxInformationTableView.contentSize.height
            shipmentBoxInformationTableView.reloadData()
        }
            
        
        }
    
}
