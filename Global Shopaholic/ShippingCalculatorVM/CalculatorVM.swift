//
//  CalculatorVM.swift
//  Global Shopaholic
//
//  Created by Ahsan on 4/13/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
import RappleProgressHUD
import Alamofire
protocol CalculatorDelegate {
    func DidGetCalculation(response: NSDictionary)
    func DidFailedToGetCalculation(Response: CalculatorResponse?)
}



struct CalculatorVM {
    var delegate: CalculatorDelegate?

    func getCalculation(request:CalculatorRequest,token: String)
        {
            print()
        let validationResult = CalculatorValidation().Validation(CalculatorRequest: request)
            if validationResult.success{
                GetCal(request: request, token: token)
            }
            else{
                self.delegate?.DidFailedToGetCalculation(Response: CalculatorResponse(message: validationResult.error))
            }
            
        }
    private func GetCal(request: CalculatorRequest,token:String)
    {
        print("Updating")
        
        let loginep = endpoints()
        var weight = ""
        request.weight.forEach { (value) in
            weight += "\(value),"
        }
        var length = ""
        request.length.forEach { (value) in
            length += "\(value),"
        }
        var heigth = ""
        request.height.forEach { (value) in
            heigth += "\(value),"
        }
        var width = ""
        request.width.forEach { (value) in
            width += "\(value),"
        }
       // "[2,4,5]"
        width.removeLast()
        heigth.removeLast()
        length.removeLast()
        weight.removeLast()
       
        let param: [String: Any] = ["country":request.Country!,"city":request.City!,"zip_code": request.ZipCode!,"length": length,"width":width,"height":heigth,"weight": weight,"measurement_unit":request.Unit!]

        RappleActivityIndicatorView.startAnimating()
        WebService.CalculatorRequestApi(Token: token, strURL: loginep.ShippingCalculatorEP, params: param, is_loader_required: false) { (response) in
            if (response["success"] as! Bool) == true
            {
                RappleActivityIndicatorView.stopAnimation()
                self.delegate?.DidGetCalculation(response: response)
            }
            else{
                RappleActivityIndicatorView.stopAnimation()
                print(response)
                self.delegate?.DidFailedToGetCalculation(Response: CalculatorResponse(message: (response["message"] as! String)))
            }
        } failure: { (error) in
            RappleActivityIndicatorView.stopAnimation()

            print("something bad happend")
        }
    }
}
