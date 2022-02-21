//
//  ShippedTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 19/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

protocol ShippedTableViewCellDelegate {
    func shippedOptionButtonTapped(atIndex: IndexPath)
    func openShippedRequestForm(cell: UITableViewCell)
    func openShippedCustomDeclaration(cell: UITableViewCell)
    func openShippedShowPackageDetails(cell: UITableViewCell)


}

class ShippedTableViewCell: UITableViewCell {

    var dataSource = [String]()

    var shippedTableViewCellDelegate: ShippedTableViewCellDelegate?
    @IBOutlet weak var optionButton: UIButton!
    var optionsView = UITableView()
    var isShowing: Bool?
    var indexPath: IndexPath?
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var requestIdNumber: UILabel!
    @IBOutlet weak var trackingIdNumber: UILabel!
    @IBOutlet weak var trackingIdLabel: UILabel!
    @IBOutlet weak var shippedViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var markAsDeliveredButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        markAsDeliveredButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 10)
        markAsDeliveredButton.layer.cornerRadius = 8
        containerView.layer.cornerRadius = 8
        containerView.DropShadowView()
        self.addSubview(optionsView)
        isShowing = false
        optionsView.layer.cornerRadius = 6
        optionsView.delegate = self
        optionsView.dataSource = self
        optionsView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissOptionView)))
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        hideOptions(frame: optionButton.frame)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func dismissOptionView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.frame = CGRect(x: optionButton.frame.origin.x, y: optionButton.frame.origin.y + optionButton.frame.height, width: 0, height: 0)
        } completion: { [self] _ in
            isShowing = false
        }
    }
    
    func openOptionsView(currentSelection: MainSelection,frame: CGRect) {
        optionsView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.isHidden = false
            switch currentSelection {
            case .Storage:
                 print("no")
            case .Outgoing:
                print("no")
            case .Shipped:
                optionsView.frame = CGRect(x: (frame.origin.x / 3) * 2, y: frame.origin.y + 30, width: 200, height: 140)
                optionsView.layoutIfNeeded()

            case .Delivered:

                optionsView.frame = CGRect(x: (frame.origin.x / 3) * 2, y: frame.origin.y + 30, width: 200, height: 140)
                optionsView.layoutIfNeeded()

            case .Cancelled:
                optionsView.showsVerticalScrollIndicator = true
                optionsView.flashScrollIndicators()
                optionsView.frame = CGRect(x: (frame.origin.x / 3) * 2, y: frame.origin.y + 30, width: 200, height: 100)
                DispatchQueue.main.async {
                    optionsView.layoutIfNeeded()

                }

            case .Return:
                print("no")
            }
            
        } completion: { [self] _ in
            isShowing = true
        }
        
    }
    
    func hideOptions(frame: CGRect) {
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: 0, height: 0)
        } completion: { [self] _ in
            isShowing = false
        }

       
    }
    
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        dataSource = ["Review Request", "Custom Details","Show Package Details"]
        shippedTableViewCellDelegate?.shippedOptionButtonTapped(atIndex: indexPath!)
    }
}


extension ShippedTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Montserrat-Medium", size: 13)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.textColor = hexStringToUIColor(hex: "#5A5657")
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.shippedTableViewCellDelegate?.openShippedRequestForm(cell: self)
        case 1:
            self.shippedTableViewCellDelegate?.openShippedCustomDeclaration(cell: self)
        case 2:
            self.shippedTableViewCellDelegate?.openShippedShowPackageDetails(cell: self)
        
        default:
            break
        }
    }
    
    
}
