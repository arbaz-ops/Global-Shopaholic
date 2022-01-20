//
//  RequestFormViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 06/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class RequestFormViewController: UIViewController {
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    let storageVM = StorageVM()
    var consolidation: [String: [String: Any]]?
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var requestFormView: UIView!
    @IBOutlet weak var requestFormTableView: UITableView!
    var atIndex: IndexPath?
    var reviewRequestList: [String: Any]?
    var packageList: [[String:Any]]?
    
    var requestID: String?
    var consolidatedPackages: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upperView.roundTopCorners(radius: 35)
        requestFormTableView.backgroundColor = .clear
        self.view.roundTopCorners(radius: 35)
        requestFormTableView.roundTopCorners(radius: 35)
        requestFormView.roundTopCorners(radius: 35)
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getRequestReviewDetail()
        
    }
    
    func getRequestReviewDetail() {
        do {
        let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
        guard let userData = encodedUserData else {
            return
        }
        let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
            
            guard let userToken = unarchivedData?.token else {
                print("Failed to get the token")
                return
            }
            let requestId = packageList![atIndex!.row]["id"]!

            storageVM.getRequestReview(token: userToken, requestId: "\(String(describing: requestId))") { [self] response in
                print(response)
                let data = response["data"] as? [String: [String: Any]]
                let list = data!["list"]
                self.reviewRequestList = list
//                print(reviewRequestList)
//                print(reviewRequestList!["consolidation"] as? [String: Any])
//                let consolidation = list!["consolidation"] as? [String: Any]
//                print(consolidation)
                loadTable()
            } failure: { error in
                print(error)
            }

            print(userData)
            print(userToken)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func loadTable() {
        requestFormTableView.register(UINib(nibName: "RequestFormTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestFormTableViewCell")
        requestFormTableView.delegate = self
        requestFormTableView.dataSource = self
        requestFormTableView.reloadData()
    }
    
    

    @IBAction func closeFormTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


