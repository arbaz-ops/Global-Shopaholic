//
//  CustomDeclaration+EXT+TABLE.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import UIKit

extension CustomDeclarationFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customDeclarationFormCell = tableView.dequeueReusableCell(withIdentifier: "CustomDeclarationFormTableViewCell", for: indexPath) as? CustomDeclarationFormTableViewCell
        return customDeclarationFormCell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
