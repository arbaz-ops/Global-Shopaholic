//
//  StorageAndShipmentViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import SDWebImage

//struct UpperCollectionModel {
//    var image: UIImage?
//    var text: String?
//
//
//}

struct UpperCollectionModel {
    var image: UIImage?
    var text: String?
}


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
    @IBOutlet weak var selectAllButton: UIButton!
    var currentSelection = MainSelection.Storage //see enumerations file
    var storageVM: StorageVM?
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    var selectedIndex: [Int] = []
    @IBOutlet weak var selectAllLabel: UILabel!
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var itemsSelectedLabel: UILabel!
    
    var storageAndShipmentTableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.roundCorners([.topRight, .bottomRight], radius: 20)
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
        InitUI()
        filterButton.isHidden = true
        
       setupCollectionView()
        loadTableView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        storageAndShipmentTableView?.reloadData()
    }
    
    func setupCollectionView()  {
        upperCollectionView.showsVerticalScrollIndicator = false
        upperCollectionView.showsHorizontalScrollIndicator = false
//        upperCollectionView.register(UINib(nibName: "UpperCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UpperCollectionViewCell")
        
        upperCollectionView.register(UINib(nibName: "UpperCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UpperCollectionViewCell")
//                 self.collectionView.addGestureRecognizer(longPressRecognizer)
        
        
        upperCollectionView.delegate = self
        upperCollectionView.dataSource = self
        upperCollectionView.allowsMultipleSelection = false
        upperCollectionView.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout()
             layout.scrollDirection = .vertical

        storageAndShipmentCollectionView
                  .setCollectionViewLayout(layout, animated: false)
        storageAndShipmentCollectionView.delegate = self
        storageAndShipmentCollectionView.dataSource = self
        storageAndShipmentCollectionView.allowsMultipleSelection = false
        storageAndShipmentCollectionView.register(UINib(nibName: "MyStorageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyStorageCollectionViewCell")
        storageAndShipmentCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")
        storageAndShipmentCollectionView.layoutIfNeeded()
       
        
//        storageAndShipmentCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")

        upperCollectionView.layoutIfNeeded()
        upperCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(0.9)), execute: {
            let indexPathForFirstRow = IndexPath(item: 0, section: 0)
            self.upperCollectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: [])
            self.collectionView(self.upperCollectionView, didSelectItemAt: indexPathForFirstRow)
        })
    }
    
    
    private func loadTableView() {
        storageAndShipmentTableView = UITableView()
       
        storageAndShipmentTableView?.isHidden = true
        let collectionViewFrame = storageAndShipmentCollectionView.frame
        storageAndShipmentTableView?.frame = collectionViewFrame
        storageAndShipmentTableView?.delegate = self
        storageAndShipmentTableView?.dataSource = self
        storageAndShipmentTableView?.backgroundColor = .clear
        storageAndShipmentTableView?.separatorStyle = .none
        storageAndShipmentTableView?.allowsSelection = false
        
    }
    
    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)

    }
    
    @IBAction func filerButtonTapped(_ sender: UIButton) {
        let filterVC = self.storyboard!.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        filterVC?.modalPresentationStyle = .overFullScreen
        filterVC?.currentSelection = currentSelection
        filterVC?.filterVCDelegate = self
        self.present(filterVC!, animated: true)
    }
    func activateTableViewConstraint(topConstraint:CGFloat) {
        self.view.addSubview(storageAndShipmentTableView!)
        storageAndShipmentTableView?.translatesAutoresizingMaskIntoConstraints = false
        storageAndShipmentTableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        storageAndShipmentTableView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        storageAndShipmentTableView?.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: topConstraint).isActive = true
        storageAndShipmentTableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 10).isActive = true
    }

   
}
