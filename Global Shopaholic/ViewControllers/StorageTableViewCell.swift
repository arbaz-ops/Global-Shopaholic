//
//  StorageTableViewCell.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 16/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import SDWebImage

protocol StorageTableViewCellDelegate {
    func returnPackageTapped()
    func addCustomDetailTapped()
    func specialServiceTapped()
}


class StorageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storageCollectionView: UICollectionView!
    @IBOutlet weak var selectAllLabel: UILabel!
    @IBOutlet weak var itemsSelectedLabel: UILabel!
    var packagesList: [[String: Any]] = [[String: Any]]()
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    var storageTableViewCellDelegate: StorageTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        print(packagesList)
        storageCollectionView.layoutIfNeeded()
        
        setUpCollectionView()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//       
//    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
             layout.scrollDirection = .vertical
        
        storageCollectionView.setCollectionViewLayout(layout, animated: true)
        
        storageCollectionView.delegate = self
        storageCollectionView.dataSource = self
        storageCollectionView.register(UINib(nibName: "StorageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StorageCollectionViewCell")
        storageCollectionView.layoutIfNeeded()
        
        

            layout.minimumLineSpacing = 20
            /// 5
            layout.minimumInteritemSpacing = 7

            /// 6
        storageCollectionView
                  .setCollectionViewLayout(layout, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
   
    func reloadCollectionViewWithData(myStorageList: [[String: Any]]) {
        
        self.packagesList = myStorageList
        
     
        storageCollectionView.reloadData()
    }
    
}


extension StorageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return packagesList.count
       
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let storageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StorageCollectionViewCell", for: indexPath) as? StorageCollectionViewCell
        storageCell?.indexPath = indexPath
        let width = calculateWidth()
        storageCell!.myStorageImageView.frame.size.width = width
        storageCell?.trackingNumber.text = "TN: \(packagesList[indexPath.row]["tracking_number"] as! String)"
        let primaryFullImage = packagesList[indexPath.row]["primary_full_image"] as? [String: Any]
        if let imageName = primaryFullImage?["image_name"] as? String {
            storageCell?.myStorageImageView.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage())
        }

       
        return storageCell!

       
    }
    

    
    func collectionView(_ collectionView: UICollectionView,
                     layout collectionViewLayout: UICollectionViewLayout,
                     insetForSectionAt section: Int) -> UIEdgeInsets {
           /// 2
           return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
       }
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
            /// 4
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 311)
        }

    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
}

extension StorageTableViewCell {
    func checkBoxTapped(indexPath: IndexPath) {
        guard  let storageCell = storageCollectionView.cellForItem(at: indexPath) as? StorageCollectionViewCell else {
            return
        }
//        if storageCell.indexPath?.row == indexPath.row {
//            print("sadsad")
//            storageCell.isChecked = true
//            storageCell.checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
//
//        }
//        else {
//            storageCell.isChecked = false
//            storageCell.checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)
//
//        }
//
        if !storageCell.isChecked! {

            storageCell.isChecked = true
            storageCell.checkBoxButton.setImage(UIImage(named: "checkedGreen"), for: .normal)
             }
        else if storageCell.isChecked! {

            storageCell.isChecked = false
            storageCell.checkBoxButton.setImage(UIImage(named: "uncheckedBox"), for: .normal)

             }
        
    }
    

    
}
