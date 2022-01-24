//
//  CustomDeclarationFormTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormTableViewCell: UITableViewCell {

    @IBOutlet weak var customDescriptionTableView: UITableView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var totalView: UIView!
    var customDeclarationList: [[String: Any]] = [[String : Any]]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customDescriptionTableView.layer.cornerRadius = 10
        totalView.layer.cornerRadius = 10
        
    }
    
   func loadTable() {
       customDescriptionTableView.register(UINib(nibName: "CustomDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDescriptionTableViewCell")
       customDescriptionTableView.delegate = self
       customDescriptionTableView.dataSource = self
       customDescriptionTableView.separatorStyle = .none
       customDescriptionTableView.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension CustomDeclarationFormTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customDeclarationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CustomDescriptionTableViewCell") as? CustomDescriptionTableViewCell
        return customDescriptionCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}
