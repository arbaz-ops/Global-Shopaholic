//
//  CustomDeclarationFormViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 20/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class CustomDeclarationFormViewController: UIViewController {
    
    @IBOutlet weak var customDeclarationView: UIView!
    var atIndex: IndexPath?
    var storageVM: StorageVM?
    var packageList: [[String: Any]]? = [[String: Any]]()
    var customDeclarationList: [[String: Any]]? = [[String: Any]]()
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var customDeclarationFormTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTable()
        customDeclarationView.roundTopCorners(radius: 25)
        upperView.roundTopCorners(radius: 25)
        
    }
    
    private func loadTable() {
        
        customDeclarationFormTableView.separatorStyle = .none
        customDeclarationFormTableView.backgroundColor = .clear
        customDeclarationFormTableView.dataSource = self
        customDeclarationFormTableView.delegate = self
        customDeclarationFormTableView.register(UINib(nibName: "CustomDeclarationFormTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomDeclarationFormTableViewCell")
        customDeclarationFormTableView.alwaysBounceVertical = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCustomDeclaration()
    }

    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func getCustomDeclaration() {
        
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
                print(requestId)
                
                storageVM = StorageVM()
                storageVM?.getCustomDeclaration(token: userToken, requestId: "\(String(describing: requestId))") { [self] response in
                    print(response)
                    let data = response["data"] as? [String: [[String: Any]]]
                    let list = data!["list"]
                    self.customDeclarationList = list
                    print(customDeclarationList)
    //                print(reviewRequestList)
    //                print(reviewRequestList!["consolidation"] as? [String: Any])
    //                let consolidation = list!["consolidation"] as? [String: Any]
    //                print(consolidation)
                    
                } failure: { error in
                    print(error)
                }

                print(userData)
                print(userToken)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    
    
}
