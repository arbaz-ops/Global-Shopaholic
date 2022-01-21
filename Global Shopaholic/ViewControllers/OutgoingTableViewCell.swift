//
//  OutgoingTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 18/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

protocol OutgoingTableViewCellDelegate {
    func outgoingOptionButtonTapped(atIndex: IndexPath)
    func openRequestFormViewController(cell: UITableViewCell)
    func openCustomDeclarationViewController(cell: UITableViewCell)
    func openEditAddressViewController(cell: UITableViewCell)
    
}

class OutgoingTableViewCell: UITableViewCell {
    var optionsView = UITableView()
    var isShowing: Bool?
    var dropDown: DropDown?
    var outgoingTableViewCellDelegate: OutgoingTableViewCellDelegate?
    var indexPath: IndexPath?
    var outGoingStatus: OutgoingStatus?
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var requestId: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pendingToProcessingLineView: UIView!
    @IBOutlet weak var preparingToPendingLineView: UIView!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var checkoutAndPayButton: UIButton!
    @IBOutlet weak var pendingPaymentProgressView: UIView!
    @IBOutlet weak var preparingProgressView: UIView!
    @IBOutlet weak var processingProgressView: UIView!
    
    var dataSource = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissOptionView)))
       isShowing = false
        preparingProgressView.layer.cornerRadius = preparingProgressView.frame.height / 2
        pendingPaymentProgressView.layer.cornerRadius = pendingPaymentProgressView.frame.height / 2
        processingProgressView.layer.cornerRadius = processingProgressView.frame.height / 2
        checkoutAndPayButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 10)
        checkoutAndPayButton.layer.cornerRadius = 8
        optionButton.setTitle("", for: .normal)
        containerView.layer.cornerRadius = 8
        
        containerView.DropShadowView()
        containerView.isUserInteractionEnabled = true
        self.addSubview(optionsView)
        isShowing = false
        optionsView.layer.cornerRadius = 6
        optionsView.delegate = self
        optionsView.dataSource = self
        optionsView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        optionsView.alwaysBounceVertical = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        hideOptions(frame: optionButton.frame)
    }
    
    @objc func dismissOptionView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.frame = CGRect(x: optionButton.frame.origin.x, y: optionButton.frame.origin.y + optionButton.frame.height, width: 0, height: 0)
        } completion: { [self] _ in
            isShowing = false
        }
    }
    
    func checkStatus(status: OutgoingStatus) {
        switch status {
            
        case .Preparing:
            preparingProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            preparingToPendingLineView.backgroundColor = hexStringToUIColor(hex: "#A1A1A1")
            pendingToProcessingLineView.backgroundColor = hexStringToUIColor(hex: "#A1A1A1")
            drawBorderToView(progressView: pendingPaymentProgressView)
            drawBorderToView(progressView: processingProgressView)
            checkoutAndPayButton.isHidden = false
            
            
        case .PendingPayment:
            preparingProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            pendingPaymentProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            preparingToPendingLineView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            pendingToProcessingLineView.backgroundColor = hexStringToUIColor(hex: "#A1A1A1")
            removeBorderFromView(progressView: preparingProgressView)
            removeBorderFromView(progressView: pendingPaymentProgressView)
            drawBorderToView(progressView: processingProgressView)
            checkoutAndPayButton.isHidden = false
            
        case .Processing:
            preparingProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            pendingPaymentProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            processingProgressView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            preparingToPendingLineView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            pendingToProcessingLineView.backgroundColor = hexStringToUIColor(hex: "#0BBAA3")
            removeBorderFromView(progressView: preparingProgressView)
            removeBorderFromView(progressView: pendingPaymentProgressView)
            removeBorderFromView(progressView: processingProgressView)
            checkoutAndPayButton.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawBorderToView(progressView: UIView) {
        progressView.layer.borderColor = hexStringToUIColor(hex: "A1A1A1").cgColor
        progressView.layer.borderWidth = 1.5
        progressView.backgroundColor = .white
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
    
    func removeBorderFromView(progressView: UIView) {
        progressView.layer.borderColor = hexStringToUIColor(hex: "0BBAA3").cgColor
        progressView.layer.borderWidth = 1.5
        progressView.backgroundColor = hexStringToUIColor(hex: "0BBAA3")
    }
    
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        dataSource = ["Review Request", "Custom Details", "Edit Address", "Show Package Details"]
        outgoingTableViewCellDelegate?.outgoingOptionButtonTapped(atIndex: self.indexPath!)
    }
    
    @objc func optionRowTapped() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) {[self] in
            optionsView.frame = CGRect(x: optionButton.frame.origin.x, y: optionButton.frame.origin.y + optionButton.frame.height, width: 0, height: 0)
        } completion: { [self] _ in
            isShowing = false
        }
    }
}


extension OutgoingTableViewCell: UITableViewDataSource, UITableViewDelegate {
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
            self.outgoingTableViewCellDelegate?.openRequestFormViewController(cell: self)
        case 1:
            self.outgoingTableViewCellDelegate?.openCustomDeclarationViewController(cell: self)
        case 2:
            self.outgoingTableViewCellDelegate?.openEditAddressViewController(cell: self)
        case 3:
            print("Show Package Details")
        default:
            break
        }
    }
    
    
}
