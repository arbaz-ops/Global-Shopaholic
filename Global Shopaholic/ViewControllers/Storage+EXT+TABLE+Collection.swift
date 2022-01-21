//
//  Storage+EXT+TABLE+Collection.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 18/01/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//



import UIKit



extension StorageShipmentVC: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upperCollection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyStorageCollectionViewCell", for: indexPath) as? MyStorageCollectionViewCell
//        cell!.containerView.DropShadowView()
//        cell!.collectionImageView.image = upperCollection[indexPath.item].image
//        cell!.collectionCellText.text = upperCollection[indexPath.item].text
        return cell!

    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            let cellWidth: CGFloat = 170.0

            let numberOfCells = floor(view.frame.size.width / cellWidth)
            let edgeInsets = (view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

            return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
        }

   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            self.currentSelection = .Storage
            setCurrentSelection()
        }
        if indexPath.item == 1 {
            self.currentSelection = .Outgoing
            setCurrentSelection()
        }
        if indexPath.item == 2 {
            self.currentSelection = .Shipped
            setCurrentSelection()
        }
        if indexPath.item == 3 {
            self.currentSelection = .Delivered
            setCurrentSelection()
        }
        if indexPath.item == 4 {
            self.currentSelection = .Cancelled
            setCurrentSelection()
        }
        if indexPath.item == 5 {
            self.currentSelection = .Return
            setCurrentSelection()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyStorageCollectionViewCell", for: indexPath) as? MyStorageCollectionViewCell else {
//            return
//        }
//        cell.containerView.backgroundColor = hexStringToUIColor(hex: "#EFF7F5")
//    }
    
    func shakeThatBooty()
    {
        if(editModeEnabled == false) {
            // Put the collection view in edit mode
//            editButton.title = "Done"
//            self.editButton.style = .Done
            editModeEnabled = true
         
 
    }
    
    

}
}



extension StorageShipmentVC: UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch selectedSection {
        case 0:
            return 1
        case 1:
                return self.packagesList.count
        case 2:
            
                return self.packagesList.count
            
        case 3:
                return self.packagesList.count
            
        case 4:
                return self.packagesList.count
            
        default:
            return 0
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: myStorageCell contains collection view
        
        switch selectedSection {
        
        case 0:
            // myStorageCell contains collection view
        let myStorageCell = tableView.dequeueReusableCell(withIdentifier: "StorageTableViewCell") as? StorageTableViewCell
            myStorageCell?.storageTableViewCellDelegate = self
        return myStorageCell!
        
        case 1:
            let outgoingCell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTableViewCell", for: indexPath) as? OutgoingTableViewCell
           
                DispatchQueue.main.async {[self] in
                    outgoingCell?.indexPath = indexPath
                    outgoingCell?.outgoingTableViewCellDelegate = self
                    let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                    let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                    outgoingCell?.requestId.text = packagesList[indexPath.row]["unique_key"] as? String
                    outgoingCell?.createdDate.text = formattedDate
                   
                    if packagesList[indexPath.row]["status"] as? String == "preparing" {
                        outgoingCell?.checkStatus(status: .Preparing)
                        
                        tableView.reloadRows(at: [indexPath], with: .none)
                    }
                    else if packagesList[indexPath.row]["status"] as? String == "payment_pending" {
                        outgoingCell?.checkStatus(status: .PendingPayment)
                        tableView.reloadRows(at: [indexPath], with: .none)

                    }
                    else if packagesList[indexPath.row]["status"] as? String == "processing" {
                        outgoingCell?.checkStatus(status: .Processing)
                        tableView.reloadRows(at: [indexPath], with: .none)

                    }
                }
                return outgoingCell!

            
            
        case 2:
            let shippedCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            shippedCell?.markAsDeliveredButton.isHidden = false
            shippedCell?.shippedViewHeightConstraint.constant = 174.98
            DispatchQueue.main.async {[self] in
                let packages = self.packagesList[indexPath.row]["packages"] as? [[String: Any]]
                
                shippedCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                shippedCell?.createdDate.text = formattedDate
                shippedCell?.trackingIdNumber.text = packages![0]["tracking_number"] as? String
            }
         
            return shippedCell!
        case 3:
            
     
            let shippedCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            shippedCell?.markAsDeliveredButton.isHidden = true
            shippedCell?.shippedViewHeightConstraint.constant = 140
            shippedCell?.trackingIdLabel.isHidden = false
            shippedCell?.trackingIdNumber.isHidden = false
            DispatchQueue.main.async { [self] in
                let packages = self.packagesList[indexPath.row]["packages"] as? [[String: Any]]
                shippedCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                shippedCell?.createdDate.text = formattedDate
                shippedCell?.trackingIdNumber.text = packages![0]["tracking_number"] as? String
                print(packages![0])
                
            }
          
            return shippedCell!
            
        case 4:
            let shippedCell = tableView.dequeueReusableCell(withIdentifier: "ShippedTableViewCell") as? ShippedTableViewCell
            shippedCell?.markAsDeliveredButton.isHidden = true
            shippedCell?.trackingIdLabel.isHidden = true
            shippedCell?.trackingIdNumber.isHidden = true
            shippedCell?.shippedViewHeightConstraint.constant = 105
            DispatchQueue.main.async {[self] in
                shippedCell?.requestIdNumber.text = self.packagesList[indexPath.row]["unique_key"] as? String
                let dateDatAndYear = changeDateToRequiredType(date: packagesList[indexPath.row]["created_at"] as? String)
                let formattedDate = convertDateString(dateString: dateDatAndYear, fromFormat: "MMM d, yyyy", toFormat: "dd/MM/yyyy")
                shippedCell?.createdDate.text = formattedDate
            }
           
            return shippedCell!
        default:
            return UITableViewCell()
       
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectedSection {
        case 0:
            print("sada")
        case 1:
            let outgoingCell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTableViewCell") as? OutgoingTableViewCell
            print(packagesList[indexPath.row])
        case .none:
            print("sads")
        case .some(_):
            print("sads")
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
   
    
}

