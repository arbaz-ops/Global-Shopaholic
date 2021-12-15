//
//  ViewController.swift
//  Global Shopaholic
//
//  Created by Ahsan on 08/12/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
import iOSDropDown
class ShippingCalculatorVC: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var SideMenuView: UIView!
    @IBOutlet weak var BackBtnView: UIView!
    var mostOrderedItems: NSArray!
    var MostOrderedBaseURL: String!
    @IBOutlet weak var MainContainerView: UIView!
    @IBOutlet var DetailInputView: UIView!
    
    @IBOutlet var MostOrderedView: UIView!
    @IBOutlet weak var KgBtn: UIButton!
    @IBOutlet weak var poundBtn: UIButton!
    var CountryArrayData: NSArray!
    @IBOutlet weak var widthlbl: UILabel!
    @IBOutlet weak var heigthlbl: UILabel!
    @IBOutlet weak var lengthlbl: UILabel!
    @IBOutlet weak var weigthlbl: UILabel!
    @IBOutlet weak var WeightSlide: UISlider!
    @IBOutlet weak var lengthSlider: UISlider!
    @IBOutlet weak var WidthSlider: UISlider!
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var HeigthField: UITextField!
    @IBOutlet weak var WidthField: UITextField!
    @IBOutlet weak var LengthField: UITextField!
    @IBOutlet weak var WeigthField: UITextField!
//    let param = [String:[String]]()
    var weight:Float = 0
    var height:Int = 0
    var length:Int = 0
    var width:Int = 0
    var WeigthArray = [Float]()
    var LengthArray = [Int]()
    var WidthArray = [Int]()
    var HeigthArray = [Int]()
    var measurement_unit = Int()
    var iSO = String()
    @IBOutlet weak var FieldStackV: UIStackView!
    var CenteredVerticallyConstraint: NSLayoutConstraint?
    var TopAnch
    : NSLayoutConstraint?
    
    @IBOutlet weak var SegmentController: UISegmentedControl!
    
    
    var user_data:UserDataClass!
    
    
    @IBOutlet weak var TopFieldsView: UIView!
    
    @IBOutlet weak var CountryField: DropDown!
    @IBOutlet weak var CityField: DropDown!
    var screenSize: CGRect!
        var screenWidth: CGFloat!
        var screenHeight: CGFloat!
    
    @IBOutlet weak var ZipCodeField: UITextField!
    
    @IBOutlet weak var PopupCancelBtn: UIButton!
    @IBOutlet weak var PopUpAddBtn: UIButton!
    @IBOutlet var AddPopUpView: UIView!
    let default_Index = 0
    var Boxes = [ShippingDimensions]()
    @IBOutlet weak var btnShowMenu: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
              screenWidth = screenSize.width
              screenHeight = screenSize.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
                layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
                layout.minimumInteritemSpacing = 20
                layout.minimumLineSpacing = 10
                collectionView!.collectionViewLayout = layout
        
        self.collectionView.allowsSelection = true
        if  userDefaults.object(forKey: "user_data") != nil {
            let userdecoded  = userDefaults.object(forKey: "user_data") as! Data
            user_data = (NSKeyedUnarchiver.unarchiveObject(with: userdecoded) as! UserDataClass)
            self.getMostOrderedItems()
            var getcountry = CountriesVM()
            getcountry.delegate = self
            print(user_data.userData!)
            getcountry.GetCountry(accessToken: user_data.token)
            CountryField.didSelect{(selectedText , index , id) in
                var citiesVM = getCitiesVM()
                let selectedCountry = self.CountryArrayData[index] as! NSDictionary
                self.iSO = (selectedCountry["iso"] as! String)
                citiesVM.delegate = self
                let Request = CountryCity(CountryName: selectedText)
                citiesVM.GetCities(accessToken: self.user_data.token, request: Request)
                print(selectedText)
                
                    }

        }
        
        BackBtnView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        BackBtnView.layer.cornerRadius = BackBtnView.frame.height / 2
        SideMenuView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        SideMenuView.layer.cornerRadius = SideMenuView.frame.height / 2
        
        
        TopFieldsView.layer.cornerRadius = 10
        TopFieldsView.DropShadowView()
        tableView.layer.cornerRadius = 10
        print("BoxesCount")
        print(Boxes.count)
        self.tableView.estimatedRowHeight = 10;
            self.tableView.rowHeight = UITableView.automaticDimension
            tableView.delegate = self
            tableView.dataSource = self
        tableView.allowsSelection = false
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        SetupPopUup()
        setupUI()
        SetupContainerView()
    }
    override func viewWillAppear(_ animated: Bool) {
        SegmentController.addUnderlineForSelectedSegment()

    }
    
    
    func SetupContainerView()
    {
        MainContainerView.addSubview(DetailInputView)
        DetailInputView.translatesAutoresizingMaskIntoConstraints = false
        DetailInputView.topAnchor.constraint(equalTo: MainContainerView.topAnchor, constant: 0).isActive = true
        DetailInputView.leftAnchor.constraint(equalTo: MainContainerView.leftAnchor, constant: 0).isActive = true
        DetailInputView.rightAnchor.constraint(equalTo: MainContainerView.rightAnchor, constant: 0).isActive = true
        DetailInputView.bottomAnchor.constraint(equalTo: MainContainerView.bottomAnchor, constant: 0).isActive = true
        
        
        MainContainerView.addSubview(MostOrderedView)
        
        
        MostOrderedView.translatesAutoresizingMaskIntoConstraints = false
        MostOrderedView.topAnchor.constraint(equalTo: MainContainerView.topAnchor, constant: 0).isActive = true
        MostOrderedView.leftAnchor.constraint(equalTo: MainContainerView.leftAnchor, constant: 0).isActive = true
        MostOrderedView.rightAnchor.constraint(equalTo: MainContainerView.rightAnchor, constant: 0).isActive = true
        MostOrderedView.bottomAnchor.constraint(equalTo: MainContainerView.bottomAnchor, constant: 0).isActive = true
        MostOrderedView.isHidden = true
    }
    func setupUI(){
        poundBtn.layer.cornerRadius = 3
        poundBtn.layer.borderWidth = 0.8
        poundBtn.layer.borderColor =  hexStringToUIColor(hex: "00BBA3").cgColor
        KgBtn.layer.cornerRadius = 3
        KgBtn.layer.borderWidth = 0.8
        KgBtn.layer.borderColor =  hexStringToUIColor(hex: "00BBA3").cgColor
    }
    @IBAction func CancelPopUp(_ sender: Any) {
     HidePopUp()
    }
    
    func HidePopUp()
    {
        TopAnch?.isActive = true
               CenteredVerticallyConstraint?.isActive = false
               UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                   self.view.layoutIfNeeded()
               }, completion:  nil)
    }
    
    @IBAction func poundAction(_ sender: UIButton) {
        measurement_unit = 1
        sender.setImage(UIImage(named: "checked"), for: .normal)
        KgBtn.setImage(nil, for: .normal)
    }
    @IBAction func kgAction(_ sender: UIButton) {
        
        measurement_unit = 2
        sender.setImage(UIImage(named: "checked"), for: .normal)
        poundBtn.setImage(nil, for: .normal)
    }
    
    @IBAction func HeigthSlideAction(_ sender: UISlider) {
        print(sender.value)
        print(HeigthSlideAction)
        height = Int(floor(1000*sender.value)/1000)
        heigthlbl.text = "Heigth \(height)"
        
        
    }
    @IBAction func widthSlideAction(_ sender: UISlider) {
        print(sender.value)
        width = Int(floor(1000*sender.value)/1000)
        widthlbl.text = "Width \(width)"
    }
    @IBAction func weigthSlideAction(_ sender: UISlider) {
        print(sender.value)
        weight = Float(floor(1000*sender.value)/1000)
        weigthlbl.text = "Weigth \(weight)"
    }
    @IBAction func lengthSlideAction(_ sender: UISlider) {
        print(sender.value)
        length = Int(floor(1000*sender.value)/1000)
        lengthlbl.text = "Length \(length)"
    }
    
    func SetupPopUup()
    {
        PopUpAddBtn.layer.cornerRadius = 10
        PopupCancelBtn.layer.cornerRadius = 10
        
//        WeigthField.layer.cornerRadius = 10
//        WeigthField.layer.borderColor = hexStringToUIColor(hex: "00BBA3").cgColor
//        WeigthField.layer.borderWidth = 0.8
//        HeigthField.layer.cornerRadius = 10
//        HeigthField.layer.borderColor = hexStringToUIColor(hex: "00BBA3").cgColor
//        HeigthField.layer.borderWidth = 0.8
//        WidthField.layer.cornerRadius = 10
//        WidthField.layer.borderColor = hexStringToUIColor(hex: "00BBA3").cgColor
//        WidthField.layer.borderWidth = 0.8
//        LengthField.layer.cornerRadius = 10
//        LengthField.layer.borderColor = hexStringToUIColor(hex: "00BBA3").cgColor
//        LengthField.layer.borderWidth = 0.8
//        self.view.alpha = 0.5
//        FieldStackV.alpha = 0.5
        view.addSubview(AddPopUpView)
       
       // AddPopUpView.center = view.center
        AddPopUpView.layer.cornerRadius = 20
        AddPopUpView.DropShadowView()
        AddPopUpView.translatesAutoresizingMaskIntoConstraints = false
        
        
        AddPopUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        CenteredVerticallyConstraint = AddPopUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        //AddPopUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        TopAnch = AddPopUpView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20)
        TopAnch?.isActive = true
        AddPopUpView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.69).isActive = true
        AddPopUpView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        
    }

    @IBAction func AddBoxInTableView(_ sender: Any) {
        
        Boxes.append(ShippingDimensions(weight: weight, length: length, Heigth: height, width: width))
        
            WidthArray.append(width)
            LengthArray.append(length)
            HeigthArray.append(height)
            WeigthArray.append(weight)
        
        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: 0, section: Boxes.count - 1)], with: .right)
        HidePopUp()
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        SegmentController.changeUnderlinePosition()
        if sender.selectedSegmentIndex == 0
        {
            DetailInputView.isHidden = false
            MostOrderedView.isHidden = true
            print("MostOrderedView.isHidden = true")
        }
        else{
            DetailInputView.isHidden = true
            MostOrderedView.isHidden = false
            print("MostOrderedView.isHidden = false")

        }
        
    }
    private func getMostOrderedItems()
    {
        let ep = endpoints()
        WebService.GetRequestWithoutToken(Token: user_data.token, strURL: ep.mostOrderedItemsEP, is_loader_required: false, params: ["":""]) { response in
            let data = response["data"] as! NSDictionary
            self.MostOrderedBaseURL = (data["base_url"] as! String)
            self.mostOrderedItems = (data["list"] as! NSArray)
            self.collectionView.reloadData()
        } failure: { Error in
            print(Error)
        }

    }
}



extension ShippingCalculatorVC: CountriesVMDelegate
{
    func didFailtoRequest(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didFinished(response: NSDictionary) {
        let Data = response["data"] as! NSDictionary
        print(Data)
         CountryArrayData = (Data["countries"] as! NSArray)
        
        GetcountryDataInOrder()
        print("CountryData")
    }
  
    func GetcountryDataInOrder()
    {
        CountryArrayData.forEach { (value) in
            let val = value as! [String:Any]
            CountryField.optionArray.append(val["name"] as! String)
        }
    }
    
    
    
}



extension ShippingCalculatorVC: getCitiesVMDelegate
{
    func didFailtoGetCities(msg: String) {
        COMMON_ALERT.showAlert(msg: msg)
    }
    
    func didGetCities(response: NSDictionary) {
        //print(response)
        let data = response["data"] as! NSDictionary
        
        let cities = data["cities"] as! [String]
       print(cities)
        CityField.optionArray = cities
        print("didFinished")
    }
    
    
}


extension ShippingCalculatorVC: CalculatorDelegate
{
    func DidGetCalculation(response: NSDictionary) {
        //print(response)
        let data = response["data"] as! NSDictionary
        
        let vc = self.storyboard?.instantiateViewController(identifier: "CalculatorDetailVC") as! CalculatorDetailVC
        vc.response = data
        self.present(vc, animated: true, completion: nil)
               // self.navigationController?.pushViewController(vc, animated: true)


    }
    
    func DidFailedToGetCalculation(Response: CalculatorResponse?) {
        COMMON_ALERT.showAlert(msg: (Response?.message)!)
    }
    
    
    
}
