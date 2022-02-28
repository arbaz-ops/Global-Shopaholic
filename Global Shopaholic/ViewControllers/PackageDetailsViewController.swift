//
//  PackageDetailsViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 25/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

class PackageDetailsViewController: BaseViewController {
    var storageVM: StorageVM?
    var requestID: Int?
    var requestList: [String: Any] = [String: Any]()
    var packages: [[String: Any]] = [[String: Any]]()
    var packageStatus: OutgoingStatus?
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var requestIdLabel: UILabel!
    @IBOutlet weak var packageDetailCollectionView: UICollectionView!
    @IBOutlet weak var packageDetailCardView: UIView!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var backButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        storageVM = StorageVM()
//        sideMenuView.roundCorners([.topRight, .bottomRight], radius: 20)
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
        packageDetailCardView.layer.cornerRadius = 20
        packageDetailCardView.DropShadowView()
        getRequestPackage()
    }
    
    func loadCollectionView() {
        let layout = UICollectionViewFlowLayout()
             layout.scrollDirection = .vertical
        packageDetailCollectionView
                  .setCollectionViewLayout(layout, animated: false)
        packageDetailCollectionView.register(UINib(nibName: "PackageDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PackageDetailCollectionViewCell")
        packageDetailCollectionView.delegate = self
        packageDetailCollectionView.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func getRequestPackage() {
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
            

            storageVM?.getRequestPackageList(token: userToken, requestId: "\(String(describing: requestID!))") {[self] response in
                print(response)
                let data = response["data"] as? [String: [String: Any]]
                let list = data!["list"]
                self.requestList = list!
                if let uniqueKey = requestList["unique_key"] as? String,
                let createdDate = requestList["created_at"] as? String,
                let status = requestList["status"] as? String,
                   let requestPackages = requestList["packages"] as? [[String: Any]]{
                    requestIdLabel.text = uniqueKey
                    let dateDatAndYear = changeDateToRequiredType(date: createdDate)

                    let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                    dateLabel.text = formattedDate
                    
                    if status == OutgoingStatus.Processing.rawValue {
                        packageStatus = OutgoingStatus.Processing
                        statusLabel.text = "Processing"
                    }
                    else if status == OutgoingStatus.PendingPayment.rawValue {
                        packageStatus = OutgoingStatus.PendingPayment
                        statusLabel.text = "Payment Pending"
                    }
                    else if status == OutgoingStatus.Preparing.rawValue {
                        packageStatus = OutgoingStatus.Preparing
                        statusLabel.text = "Preparing"
                    }
                    else if status == OutgoingStatus.PaymentDone.rawValue {
                        packageStatus = OutgoingStatus.PaymentDone
                        statusLabel.text = "Payment Done"
                    }
                    else if status == OutgoingStatus.Shipped.rawValue {
                        packageStatus = OutgoingStatus.Shipped
                        statusLabel.text = "Shipped"
                    }
                    else if status == OutgoingStatus.Delivered.rawValue {
                        packageStatus = OutgoingStatus.Delivered
                        statusLabel.text = "Delivered"
                    }
                    packages = requestPackages
                    print(packages)
                    loadCollectionView()
                }
                
                
//                self.reviewRequestList = list
//                print(reviewRequestList)
//                print(reviewRequestList!["consolidation"] as? [String: Any])
//                let consolidation = list!["consolidation"] as? [String: Any]
//                print(consolidation)
//                loadTable()
            } failure: { error in
                print(error)
            }

            print(userData)
            print(userToken)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
