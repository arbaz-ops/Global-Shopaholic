//
//  activeTableViewCell.swift
//  Global Shopaholic
//
//  Created by Ahsan on 7/1/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit
import StepIndicator
class activeTableViewCell: UITableViewCell {
    @IBOutlet weak var mainvuew: UIView!
    @IBOutlet weak var stepIndicatorView: StepIndicatorView!
    @IBOutlet weak var APID: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var TotalItemLbl: UILabel!
    @IBOutlet weak var orderReviewBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainvuew.DropShadowView()
        setupStepperIndicator()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func setupStepperIndicator()
    {
            self.stepIndicatorView.numberOfSteps = 3
            self.stepIndicatorView.currentStep = 0
        
            self.stepIndicatorView.circleColor = hexStringToUIColor(hex: "00BCA3")
            self.stepIndicatorView.circleTintColor = hexStringToUIColor(hex: "00BCA3")
            self.stepIndicatorView.circleStrokeWidth = 2.0
            self.stepIndicatorView.circleRadius = 15.0
            self.stepIndicatorView.lineColor = hexStringToUIColor(hex: "#A1A1A1")
            self.stepIndicatorView.lineTintColor = hexStringToUIColor(hex: "#00BCA3")
            self.stepIndicatorView.lineMargin = 0
            self.stepIndicatorView.lineStrokeWidth = 2.0
            self.stepIndicatorView.displayNumbers = false
            self.stepIndicatorView.direction = .leftToRight
    }
    
    func getFormattedDate(format: String) -> String {
     let dateFormatterGet = DateFormatter()
     dateFormatterGet.dateFormat = "MMM dd,yyyy hh:mm:ss a"

     let dateFormatterPrint = DateFormatter()
     dateFormatterPrint.dateFormat = "MMM dd,yyyy"
    
     let date: NSDate? = dateFormatterGet.date(from: format) as NSDate?
     
     return dateFormatterPrint.string(from: date! as Date)
     }
}
