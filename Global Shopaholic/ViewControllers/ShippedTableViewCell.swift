//
//  ShippedTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 19/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ShippedTableViewCell: UITableViewCell {

    @IBOutlet weak var optionButton: UIButton!
    var optionsView = UITableView()
    var isShowing: Bool?
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
    
    func openOptionsView(frame: CGRect) {
        optionsView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.isHidden = false
            optionsView.frame = CGRect(x: (frame.origin.x / 3) * 2, y: frame.origin.y + 30, width: 200, height: 180)
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
    }
}
