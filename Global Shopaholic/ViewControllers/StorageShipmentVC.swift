//
//  StorageShipmentVC.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 14/01/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

struct UpperCollectionModel {
    var image: UIImage?
    var text: String?
    
    
}




class StorageShipmentVC: BaseViewController, UIGestureRecognizerDelegate {
    
    
    var myStoragePackages: [Package] = [Package]()
    var packagesList: [[String: Any]] = [[String: Any]]()
    @IBOutlet var outgoingTableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var storageAndShipTableView: UITableView!
    var selectedSection: Int? 
    @IBOutlet weak var itemsSelectedLabel: UILabel!
    
    @IBOutlet weak var selectAllButton: UIButton!
    @IBOutlet weak var selectAllLabel: UILabel!
    @IBOutlet weak var SearchTextWidthConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    var storageVM: StorageVM?
    
    var upperCollection: [UpperCollectionModel] = [
        UpperCollectionModel(image: UIImage(named: "box (1)"), text: "My Storage"),
        UpperCollectionModel(image: UIImage(named: "sendMail"), text: "Outgoing"),
        UpperCollectionModel(image: UIImage(named: "deliveryTruck"), text: "Shipped"),
        UpperCollectionModel(image: UIImage(named: "Delivered"), text: "Delivered"),
        UpperCollectionModel(image: UIImage(named: "deliveryTruck"), text: "Cancelled"),
        UpperCollectionModel(image: UIImage(named: "Delivered"), text: "Return")
    ]
    
    var storageAndShipTableViewCells: [String] = [] 
    
    
    
    @IBOutlet weak var myStorageCollectionView: UICollectionView!
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var sideMenuView: UIView!
   
    
    
    var editModeEnabled = false
    var currentSelection = MainSelection.Storage //see enumerations file

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storageVM = StorageVM()
        self.hideKeyboardWhenTappedAround()
        
//        self.collectionView.allowsSelection = true
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        myStorageCollectionView.register(UINib(nibName: "MyStorageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyStorageCollectionViewCell")
        myStorageCollectionView.showsVerticalScrollIndicator = false
        myStorageCollectionView.showsHorizontalScrollIndicator = false
//                 self.collectionView.addGestureRecognizer(longPressRecognizer)
        sideMenuView.roundCorners([.topRight, .bottomRight], radius: 20)
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
   
        myStorageCollectionView.delegate = self
        myStorageCollectionView.dataSource = self
        myStorageCollectionView.allowsMultipleSelection = false
        myStorageCollectionView.backgroundColor = .clear

        myStorageCollectionView.layoutIfNeeded()
        myStorageCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(0.9)), execute: {
            let indexPathForFirstRow = IndexPath(item: 0, section: 0)
            self.myStorageCollectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: [])
            self.collectionView(self.myStorageCollectionView, didSelectItemAt: indexPathForFirstRow)
        })
        
       
        setUpTableView()
        InitUI()
    
    }
    
    @IBAction func addFilterButtonTapped(_ sender: UIButton) {
        let filterVC = self.storyboard!.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        filterVC?.modalPresentationStyle = .overFullScreen
        filterVC?.currentSelection = currentSelection
        filterVC?.filterVCDelegate = self
        self.present(filterVC!, animated: true)
    }
    
    
    private func setUpTableView() {
        
        
        storageAndShipTableView.allowsSelection = false
        storageAndShipTableView.separatorStyle = .none
        storageAndShipTableView.delegate = self
        storageAndShipTableView.dataSource = self
        storageAndShipTableView.alwaysBounceVertical = false
        storageAndShipTableView.showsVerticalScrollIndicator = false
        storageAndShipTableView.showsHorizontalScrollIndicator = false
        storageAndShipTableViewCells.append("StorageTableViewCell")
        setCurrentSelection()
    }

    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        print("pressed")
        if sender.state == .began
        {
        shakeThatBooty()
        }

        }
  
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)

    }
    
    
   
    @IBAction func SearchBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if !sender.isSelected
        {
            self.SearchTextWidthConstraints.constant = self.SearchTextWidthConstraints.constant - 150
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
        else{
            self.SearchTextWidthConstraints.constant = self.SearchTextWidthConstraints.constant + 150
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}




