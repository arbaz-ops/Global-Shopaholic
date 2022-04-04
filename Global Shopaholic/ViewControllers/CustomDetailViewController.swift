//
//  CustomDetailViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 09/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown

class CustomDetailViewController: UIViewController {
    var trackingNumber: String?
    var storageVM: StorageVM?
    var customDetails: [CustomDetail]? = [CustomDetail]() 
    var dropDown: DropDown?
    var rows = ["CustomDetailCell"]
    @IBOutlet weak var customDetailTableView: UITableView!
    @IBOutlet weak var upperView: UIView!
    var indexPath: IndexPath?
    var categorySelectedIndex: Int!
    var packagesList: [[String: Any]]?
    var categoriesList: [[String: Any]]?
    var package: [String: Any]?
    var categoryField: DropDown?
    var descriptionField: UITextField?
    var qtyTextField: UITextField?
    var valueTextField: UITextField?
    var totalPackageValue: UITextField?
    var selectedCategories:[String]? = [String]()
    var totalPackageValueSum: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchCategories()
        
        let customDetail = CustomDetail(category: nil, categoryKey: nil, description: nil, quantity: nil, value: nil)
        customDetails?.append(customDetail)
        
        upperView.roundTopCorners(radius: 35)

        valueTextField?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCategories()

      
    }
    
    func fetchCategories() {
        storageVM = StorageVM()
        let userToken = getCurrentUserToken()
        storageVM?.getPackageCustomCategory(token: userToken, success: {[self] response in
            completion(response: response)
        }, failure: { error in
            let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
//
    func completion(response: NSDictionary) {
        let data = response["data"] as? [String: Any]
        categoriesList = data!["list"] as? [[String: Any]]


//        for categories in categoriesList! {
//            let category = categories["title"] as? String
//            dropDown?.optionArray.append(category!)
//            categoryField?.optionArray = dropDown!.optionArray
//        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadTable()

    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func loadTable() {
        customDetailTableView.separatorStyle = .none
        customDetailTableView.alwaysBounceVertical = false
        customDetailTableView.delegate = self
        customDetailTableView.dataSource = self

        customDetailTableView.separatorStyle = .none
        
        customDetailTableView.register(UINib(nibName: "CustomDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDetailTableViewCell")
        customDetailTableView.register(UINib.init(nibName: "CustomDetailButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDetailButtonsTableViewCell")
        customDetailTableView.register(UINib.init(nibName: "TotalPackageValueTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalPackageValueTableViewCell")

    }

}
