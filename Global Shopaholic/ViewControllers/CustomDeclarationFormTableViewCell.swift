//
//  CustomDeclarationFormTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormTableViewCell: UITableViewCell {
    var arrayValues = [Int]() {
        didSet {

            if arrayValues.count > 0 {
            let sum = arrayValues.reduce(0) { $0 + $1}
            self.totalPackageValueLabel.text = "$ \(sum)"
            }
            else {
                totalPackageValueLabel.text = "$ 0"
            }
        }
    }

  
    @IBOutlet weak var totalPackageValueLabel: UILabel!
    @IBOutlet weak var customDescriptionTableView: UITableView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var totalView: UIView!
    var customDeclarationList: [[String: Any]] = [[String : Any]]() {
        didSet {
            loadTable()
            calculateTotalPackageValue()

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customDescriptionTableView.layer.cornerRadius = 10
        totalView.layer.cornerRadius = 10
        loadTable()
    }
    
    func calculateTotalPackageValue() {
//        print("sadsa")
        for custom in customDeclarationList {
            let value = custom["value"] as? String
            let doubleValue = Double.init(value!)
            let intValue = Int.init(doubleValue!)
            self.arrayValues.append(intValue)
        }
    }
    
   func loadTable() {
       customDescriptionTableView.register(UINib(nibName: "CustomDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDescriptionTableViewCell")
       customDescriptionTableView.delegate = self
       customDescriptionTableView.dataSource = self
       customDescriptionTableView.separatorStyle = .none
       customDescriptionTableView.backgroundColor = .white
       customDescriptionTableView.allowsSelection = false
       customDescriptionTableView.reloadData()
       customDescriptionTableView.alwaysBounceVertical = false
//
//       customDescriptionTableView.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        customDescriptionTableView.heightAnchor.constraint(equalToConstant: customDescriptionTableView.contentSize.height).isActive = true
//        customDescriptionTableView.translatesAutoresizingMaskIntoConstraints = false
//    }
    
}

extension CustomDeclarationFormTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customDeclarationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CustomDescriptionTableViewCell") as? CustomDescriptionTableViewCell
        let category = customDeclarationList[indexPath.row]["category"] as? [String: Any]
        customDescriptionCell?.categoryLabel.text = category!["title"] as? String
        customDescriptionCell?.descriptionLabel.text = customDeclarationList[indexPath.row]["description"] as? String
        customDescriptionCell?.quantityLabel.text = "\(customDeclarationList[indexPath.row]["quantity"] ?? 0)"
        customDescriptionCell?.valueLabel.text = customDeclarationList[indexPath.row]["value"] as? String
//        let value = customDeclarationList[indexPath.row]["value"] as? String
//        let doubleValue = Double.init(value!)
//        let intValue = Int.init(doubleValue!)
//        self.arrayValues.append(intValue)
       
        
        return customDescriptionCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
}
