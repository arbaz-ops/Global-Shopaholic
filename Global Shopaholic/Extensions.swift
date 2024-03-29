//
//  Extensions.swift
//  Global Shopaholic
//
//  Created by Ahsan on 03/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import Foundation
import UIKit

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
    
    
    
}

func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

extension UITextView {
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: 10, left: amount, bottom: 10, right: 15)
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: amount)
    }
    
}

extension Float
{
    var clean: String {
           return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
        }
    
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

@IBDesignable
class PaddingLabel: UILabel {
    var textEdgeInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textEdgeInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textEdgeInsets.top, left: -textEdgeInsets.left, bottom: -textEdgeInsets.bottom, right: -textEdgeInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
    
    @IBInspectable
    var paddingLeft: CGFloat {
        set { textEdgeInsets.left = newValue }
        get { return textEdgeInsets.left }
    }
    
    @IBInspectable
    var paddingRight: CGFloat {
        set { textEdgeInsets.right = newValue }
        get { return textEdgeInsets.right }
    }
    
    @IBInspectable
    var paddingTop: CGFloat {
        set { textEdgeInsets.top = newValue }
        get { return textEdgeInsets.top }
    }
    
    @IBInspectable
    var paddingBottom: CGFloat {
        set { textEdgeInsets.bottom = newValue }
        get { return textEdgeInsets.bottom }
    }
}

extension UITextField
{
    func DropShadowTextField() {
     layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
              layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
              layer.shadowRadius = 2
               layer.masksToBounds = false
    }
    
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 12, height: 16))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
    
    func setupLeftImage(imageName:String){
           let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
           imageView.image = UIImage(named: imageName)
           let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
           imageContainerView.addSubview(imageView)
           leftView = imageContainerView
           leftViewMode = .always
           self.tintColor = .lightGray
         }

}

extension UIView
{
    func DropShadowView() {
     layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
              layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
              layer.shadowRadius = 2
               layer.masksToBounds = false
    }
    func RemoveShadow() {
        layer.shadowColor = UIColor.clear.cgColor
              
    }
    
    func roundTopCorners(radius: CGFloat = 10) {
       
          self.clipsToBounds = true
          self.layer.cornerRadius = radius
          if #available(iOS 11.0, *) {
              self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
          } else {
              self.roundCorners([.topLeft, .topRight], radius: radius)
          }
      }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
             let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
             let mask = CAShapeLayer()
             mask.path = path.cgPath
             self.layer.mask = mask
        }

}

class COMMON_ALERT {
  
    
    
    
    
    class func showAlert (msg:String)
    {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            return
        }))
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        
        let popPresenter = alert.popoverPresentationController
        popPresenter?.sourceView = viewController?.view
        popPresenter?.sourceRect = (viewController?.view.bounds)!
        DispatchQueue.main.async {
                    viewController?.present(alert, animated: true, completion: nil)
        }
    }
}


extension UINavigationController {
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: true)
    }
}
extension UILabel{
    func dropShadoww(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.3
      layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = layer.frame.height / 2
        
      layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 5).cgPath
       
     layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}




extension UIView {

// OUTPUT 1
func ViewShadoww() {
 layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
          layer.shadowOffset = CGSize(width: 0, height: 3)
           layer.shadowOpacity = 1.0
          layer.shadowRadius = 2
           layer.masksToBounds = false
}

}


extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}





class DashboardTopGradients: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
//        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//                 layer.shadowOffset = CGSize(width: 0, height: 3)
//           layer.shadowOpacity = 0.5
//                 layer.shadowRadius = 2
//                  layer.masksToBounds = false
        l.frame = self.bounds
        l.colors = [hexStringToUIColor(hex: "#32C4FB").cgColor, hexStringToUIColor(hex: "#FF4CFF").cgColor]
        l.startPoint = CGPoint(x: 1, y: 0)
        l.endPoint = CGPoint(x: 0, y: 1)
       // l.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        l.cornerRadius =  5
        layer.insertSublayer(l, at: 0)
        return l
    }()
}



class MyStorageCardGradients: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()

        l.frame = self.bounds
        l.colors = [hexStringToUIColor(hex: "#FF7DCB").cgColor, hexStringToUIColor(hex: "#FFD327").cgColor]
        l.startPoint = CGPoint(x: 1, y: 0)
        l.endPoint = CGPoint(x: 0, y: 1)
       // l.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        l.cornerRadius =  5
        layer.insertSublayer(l, at: 0)
        return l
    }()
}

class OutgoingcardGradients: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()

        l.frame = self.bounds
        l.colors = [hexStringToUIColor(hex: "#FFEF81").cgColor, hexStringToUIColor(hex: "#FF8087").cgColor]
        l.startPoint = CGPoint(x: 1, y: 0)
        l.endPoint = CGPoint(x: 0, y: 1)
       // l.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        l.cornerRadius =  5
        layer.insertSublayer(l, at: 0)
        return l
    }()
}


//
//13. Dashboard >MyStorageCard > #FF7DCB and #FFD327
//14. Dashboard > Outgoingcard > #FFEF81 and #FF8087
//15. Dashboard > ShippedCard > #00D5F6 and #8955D8
//16. Dashboard > Deliveredcard > #3B525A and #0BBAA3
class ShippedCardGradients: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()

        l.frame = self.bounds
        l.colors = [hexStringToUIColor(hex: "#00D5F6").cgColor, hexStringToUIColor(hex: "#8955D8").cgColor]
        l.startPoint = CGPoint(x: 1, y: 0)
        l.endPoint = CGPoint(x: 0, y: 1)
       // l.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        l.cornerRadius =  5
        layer.insertSublayer(l, at: 0)
        return l
    }()
}

class DeliveredcardGradients: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()

        l.frame = self.bounds
        l.colors = [hexStringToUIColor(hex: "#3B525A").cgColor, hexStringToUIColor(hex: "#0BBAA3").cgColor]
        l.startPoint = CGPoint(x: 0, y: 1)
        l.endPoint = CGPoint(x: 0, y: 0)
       // l.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        l.cornerRadius =  5
        layer.insertSublayer(l, at: 0)
        return l
    }()
}





extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = hexStringToUIColor(hex: "00BCA3")
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}



extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}



public extension UIButton
{

    func underline() {
            guard let title = self.titleLabel else { return }
            guard let tittleText = title.text else { return }
            let attributedString = NSMutableAttributedString(string: (tittleText))
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: (tittleText.count)))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    
  func alignTextUnderImage(spacing: CGFloat = 6.0)
  {
      if let image = self.imageView?.image
      {
          let imageSize: CGSize = image.size
          self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
          let labelString = NSString(string: self.titleLabel!.text!)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font!])
          self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
      }
  }
}



func convertDateString(dateString : String!, fromFormat sourceFormat : String!, toFormat desFormat : String!) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = sourceFormat
    let date = dateFormatter.date(from: dateString)
    dateFormatter.dateFormat = desFormat
    return dateFormatter.string(from: date!)
}
    
    func changeDateToRequiredType(date: String!) -> String {
       
        let splittedDataTime = date.split(separator: " ").map(String.init)
        let month = splittedDataTime[0]
        let dateAndYear = splittedDataTime[1]
        let splittedDateAndYear = dateAndYear.split(separator: ",").map(String.init)
        let date = splittedDateAndYear[0]
        let year = splittedDateAndYear[1]
        let dateDatAndYear = "\(month) \(date), \(year)"
        return dateDatAndYear
    }


func getCurrentUserToken() -> String {
    do {
    let encodedUserData = UserDefaults.standard.object(forKey: "user_data") as? Data
    guard let userData = encodedUserData else {
        return ""
    }
    let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? UserDataClass
        
        guard let userToken = unarchivedData?.token else {
            print("Failed to get the token")
            return ""
        }
       
       return userToken
    } catch let error {
        print(error.localizedDescription)
        return error.localizedDescription
    }
}
