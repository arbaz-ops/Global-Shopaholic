//
//  StorageAndShipmentViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit

//struct UpperCollectionModel {
//    var image: UIImage?
//    var text: String?
//
//
//}

class StorageAndShipmentViewController: BaseViewController {
    var upperCollection: [UpperCollectionModel] = [
        UpperCollectionModel(image: UIImage(named: "box (1)"), text: "My Storage"),
        UpperCollectionModel(image: UIImage(named: "sendMail"), text: "Outgoing"),
        UpperCollectionModel(image: UIImage(named: "deliveryTruck"), text: "Shipped"),
        UpperCollectionModel(image: UIImage(named: "Delivered"), text: "Delivered"),
        UpperCollectionModel(image: UIImage(named: "deliveryTruck"), text: "Cancelled"),
        UpperCollectionModel(image: UIImage(named: "Delivered"), text: "Return")
    ]
    var packagesList: [[String: Any]] = [[String: Any]]()
    var selectedSection: Int?
    @IBOutlet weak var storageAndShipmentCollectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var upperCollectionView: UICollectionView!
    var currentSelection = MainSelection.Storage //see enumerations file
    var storageVM: StorageVM?


    @IBOutlet weak var sideMenuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.roundCorners([.topRight, .bottomRight], radius: 20)
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
        InitUI()
        
        upperCollectionView.register(UINib(nibName: "UpperCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UpperCollectionViewCell")
        upperCollectionView.showsVerticalScrollIndicator = false
        upperCollectionView.showsHorizontalScrollIndicator = false
//                 self.collectionView.addGestureRecognizer(longPressRecognizer)
        
   
        upperCollectionView.delegate = self
        upperCollectionView.dataSource = self
        upperCollectionView.allowsMultipleSelection = false
        upperCollectionView.backgroundColor = .clear
        
        storageAndShipmentCollectionView.delegate = self
        storageAndShipmentCollectionView.dataSource = self
        storageAndShipmentCollectionView.allowsMultipleSelection = false
        storageAndShipmentCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")


        upperCollectionView.layoutIfNeeded()
        upperCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(0.9)), execute: {
            let indexPathForFirstRow = IndexPath(item: 0, section: 0)
            self.upperCollectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: [])
            self.collectionView(self.upperCollectionView, didSelectItemAt: indexPathForFirstRow)
        })
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)

    }
    
    

   
}
