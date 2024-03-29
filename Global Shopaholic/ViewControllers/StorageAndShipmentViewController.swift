//
//  StorageAndShipmentViewController.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 13/01/2022.
//  Copyright © 2022 Ahsan. All rights reserved.
//

import UIKit
import SDWebImage

struct UpperCollectionModel {
    var image: UIImage?
    var text: String?
}

class StorageAndShipmentViewController: BaseViewController {
   

    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var consolidateAndShipButton: UIButton!
    @IBOutlet weak var collectionViewUpperConstraint: NSLayoutConstraint!
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
    var selectAll: Bool?
    var subStatus: String?
    @IBOutlet weak var itemsSelectedLabel: UILabel!
    
    var isSearchEnabled: Bool?
    var storageAndShipmentTableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.roundCorners([.topRight, .bottomRight], radius: 20)
        backButtonView.roundCorners([.topLeft, .bottomLeft], radius: 20)
        InitUI()
        filterButton.isHidden = true
        isSearchEnabled = false
        searchTextField.delegate = self
        searchTextField.returnKeyType = .search
        enableConsolidateAndShip()
           setupCollectionView()
        loadTableView()
        selectAll = false
        consolidateAndShipButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
        consolidateAndShipButton.layer.cornerRadius = 10
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        storageAndShipmentTableView?.reloadData()
    }
    
    func setupCollectionView()  {
        upperCollectionView.showsVerticalScrollIndicator = false
        upperCollectionView.showsHorizontalScrollIndicator = false

        
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
//        storageAndShipmentCollectionView.addSubview(refreshControl)

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
//        storageAndShipmentTableView?.addSubview(refreshControl)

        
        
    }
    
    @IBAction func consolidateAndShipTapped(_ sender: UIButton) {
        
        let consolidateAndShipVC = storyboard?.instantiateViewController(withIdentifier: "ConsolidateAndShipViewController") as? ConsolidateAndShipViewController
        
        consolidateAndShipVC?.consolidateAndShipVCDelegate = self
        consolidateAndShipVC?.modalPresentationStyle = .overFullScreen
        consolidateAndShipVC?.selectedIndex = selectedIndex
        consolidateAndShipVC?.packagesList = packagesList
        
//        consolidateAndShipVC?.filterVCDelegate = self
        self.present(consolidateAndShipVC!, animated: true)
        
    }
    @IBAction func sideMenuButtonTapped(_ sender: UIButton) {
        self.onSlide(sender: sender)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
    


    @IBAction func selectAllButtonTapped(_ sender: UIButton) {
        if selectAll == false {
            sender.setImage(UIImage(named: "checkedGreen"), for: .normal)
            for i in 0..<packagesList.count {
                if selectedIndex.contains(i) {
                    //
                }
                if !selectedIndex.contains(i) {
                    selectedIndex.append(i)
                    itemsSelectedLabel.text = "\(selectedIndex.count) items selected"
                    enableConsolidateAndShip()
                    storageAndShipmentCollectionView.reloadData()
                }
            }
            print(selectedIndex)
            selectAll = true
            storageAndShipmentCollectionView.reloadData()
        }
        
       else if selectAll == true {
            sender.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            selectAll = false
            selectedIndex.removeAll()
           enableConsolidateAndShip()

           itemsSelectedLabel.text = "\(selectedIndex.count) items selected"
            print(selectedIndex)
            storageAndShipmentCollectionView.reloadData()

        }
        

    }
    
}

extension StorageAndShipmentViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isSearchEnabled = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        storageVM = StorageVM()
           let userToken = getCurrentUserToken()
        if textField.text == "" {
            storageVM?.getSearchedPackage(token: userToken, status: currentSelection.rawValue, searchTerm: textField.text!, subStatus: self.subStatus ?? "all", success: { response in
                let data = response["data"] as? [String: [[String: Any]]]
                let list = data!["list"]!
                self.packagesList = list
                self.changeUI(status: self.currentSelection)

            
                DispatchQueue.main.async {
                    self.storageAndShipmentCollectionView.reloadData()
                }
                textField.resignFirstResponder()
            }, failure: { error in
                COMMON_ALERT.showAlert(msg: error)
            })
        }
       

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        storageVM = StorageVM()
           let userToken = getCurrentUserToken()
           storageVM?.getSearchedPackage(token: userToken, status: currentSelection.rawValue, searchTerm: textField.text!, subStatus: self.subStatus ?? "all", success: { response in
               let data = response["data"] as? [String: [[String: Any]]]
               let list = data!["list"]!
               self.packagesList = list
               self.changeUI(status: self.currentSelection)

           
               DispatchQueue.main.async {
                   self.storageAndShipmentCollectionView.reloadData()
               }
               textField.resignFirstResponder()
           }, failure: { error in
               COMMON_ALERT.showAlert(msg: error)
           })
        return true
    }
    
    
    
}
