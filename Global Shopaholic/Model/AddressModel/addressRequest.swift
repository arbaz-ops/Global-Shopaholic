//
//  addressModel.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 15/02/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

struct addressModelRequest {
    var userName,contactNumber,streetName,countryName,stateName,zipCode,cityName: String!
    var addressID: String?
}

struct addressModelRequestResponse: Decodable {

        let message: String?
}


