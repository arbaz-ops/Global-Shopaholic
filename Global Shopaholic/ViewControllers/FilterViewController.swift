//
//  FilterViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 22/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

protocol FilterViewControllerDelegate {
    func updateFilteredList(list: [[String: Any]], subStatus: String)
}

class FilterViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    let dropDown = DropDown()
    @IBOutlet weak var subTypeTextField: DropDown!
    @IBOutlet weak var filterUpperView: UIView!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var filterView: UIView!
    var viewTranslation = CGPoint(x: 0, y: 0)
    var currentSelection: MainSelection?
    var storageVM: StorageVM?
    var filterVCDelegate: FilterViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    private func initUI() {
        //Texfields
        subTypeTextField.optionArray = ["All", "Preparing", "Payment Pending", "Processing"]
        subTypeTextField.optionIds = [0,1,2,3]
        
        subTypeTextField.setLeftPaddingPoints(CGFloat(10))
        subTypeTextField.selectedRowColor = .clear
        subTypeTextField.listHeight = 220
        subTypeTextField.rowHeight = 40
        subTypeTextField.checkMarkEnabled = false
        fromTextField.layer.cornerRadius = 15
        fromTextField.DropShadowTextField()
        toTextField.layer.cornerRadius = 15
        toTextField.DropShadowTextField()
        fromTextField.placeholder = "MM/DD/YYYY"
        toTextField.placeholder = "MM/DD/YYYY"
        
        //UIView
        filterUpperView.clipsToBounds = true
        filterView.roundTopCorners(radius: 35)
        filterView.layer.cornerRadius = 35
        statusTextField.layer.cornerRadius = 15
        statusTextField.placeholder = "All"
        statusTextField.DropShadowTextField()
        
        //Buttons
        applyButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
        applyButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        resetButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        
        toTextField.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressedToField))
        fromTextField.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressedFromField))

        
    }
    
    @objc func doneButtonPressedFromField() {
        if let  datePicker = self.fromTextField.inputView as? UIDatePicker {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                self.fromTextField.text = dateFormatter.string(from: datePicker.date)
            }
            self.fromTextField.resignFirstResponder()
         }
    
    @objc func doneButtonPressedToField() {
        if let  datePicker = self.toTextField.inputView as? UIDatePicker {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                self.toTextField.text = dateFormatter.string(from: datePicker.date)
            }
            self.toTextField.resignFirstResponder()
         }
    
   
    
    @IBAction func applyTapped(_ sender: UIButton) {
        storageVM = StorageVM()
        let userToken = getCurrentUserToken()
                if subTypeTextField.text == "Payment Pending" {
                    
                    storageVM?.getFilteredPackagesList(token: userToken, status: currentSelection!.rawValue, subStatus: "paymentpending", startDate: fromTextField.text, endDate: toTextField.text,success: { response in
                    let data = response["data"] as? [String: [[String: Any]]]
                    let list = data!["list"]!
                    self.filterVCDelegate?.updateFilteredList(list: list, subStatus: "paymentpending")
                    self.dismiss(animated: true)
                }, failure: { str in
                    print(str)
                })
            }
            else {
            guard let subStatus = subTypeTextField.text?.lowercased() else {
                return
            }
                storageVM?.getFilteredPackagesList(token: userToken, status: currentSelection!.rawValue, subStatus: subStatus, startDate: fromTextField.text, endDate: toTextField.text, success: { response in
                print(subStatus)
                let data = response["data"] as? [String: [[String: Any]]]
                let list = data!["list"]!
                self.filterVCDelegate?.updateFilteredList(list: list, subStatus: subStatus)
                self.dismiss(animated: true)
            }, failure: { str in
                print(str)
            })
            }
        
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        subTypeTextField.text = ""
        subTypeTextField.placeholder = "All"
        fromTextField.text = ""
        toTextField.text = ""
        fromTextField.resignFirstResponder()
        toTextField.resignFirstResponder()
        subTypeTextField.resignFirstResponder()
    }
    @IBAction func closeViewTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
