//
//  ShippingCalculator+EXT+CollectionView.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/11/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
extension ShippingCalculatorVC: UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mostOrderedItems != nil{
            return mostOrderedItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nib1 = UINib(nibName: "individualItemsCell", bundle: nil)
               collectionView.register(nib1, forCellWithReuseIdentifier: "individualItemsCell")
        let cell: individualItemsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "individualItemsCell", for: indexPath) as! individualItemsCell
        let tmpdata = mostOrderedItems[indexPath.row] as! NSDictionary
        let imgURL = "\(MostOrderedBaseURL!)\(tmpdata["image_name"] as! String)"
        cell.cellImg.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeHolder.png"))
        cell.itemNameLbl.text = (tmpdata["product_name"] as! String)
        print("collectionView")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("here")
        let cell = collectionView.cellForItem(at: indexPath)

            //Briefly fade the cell on selection
            UIView.animate(withDuration: 0.1,
                           animations: {
                            //Fade-out
                            cell?.alpha = 0.5
            }) { (completed) in
                UIView.animate(withDuration: 0.1,
                               animations: {
                                //Fade-out
                                cell?.alpha = 1
                })
            }
        let tmpdata = mostOrderedItems[indexPath.row] as! NSDictionary
        print(tmpdata)
        WidthArray.removeAll()
        LengthArray.removeAll()
        HeigthArray.removeAll()
        WeigthArray.removeAll()
        
        WidthArray.append((tmpdata["width"] as! NSNumber).intValue)
        LengthArray.append((tmpdata["length"] as! NSNumber).intValue)
        HeigthArray.append((tmpdata["height"] as! NSNumber).intValue)
        WeigthArray.append((tmpdata["weight"] as! NSNumber).floatValue)
        let request = CalculatorRequest(Country: "PK", City: "Islamabad", ZipCode: "44000", length: self.LengthArray, width: self.WidthArray, height: self.HeigthArray, weight: self.WeigthArray, Unit: (tmpdata["unit"] as! NSNumber).intValue)
        var calVM = CalculatorVM()
        calVM.delegate = self
        
        calVM.getCalculation(request: request, token: user_data.token)
    }
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: CGFloat(100))
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}
