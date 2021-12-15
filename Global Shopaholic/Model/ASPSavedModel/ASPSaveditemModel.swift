//
//  ASPSaveditemModel.swift
//  Global Shopaholic
//
//  Created by Ahsan on 6/28/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation
struct ASPSaveditemModel{
    var aspID: Int?
    var purchasedOrderId,promoCodeAmount: Int?
    var purchasedTrackingNo,shippingCharges: Int?
var details,shippingDescription,shippingService,promoCode,type_of_promocode,shipperDetails,missed_item_action: String?
    var Status,paymentStatus,type: String?
    var itemData: [savedItemData]?
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let savedItemsModel = try? newJSONDecoder().decode(SavedItemsModel.self, from: jsonData)

import Foundation

// MARK: - SavedItemsModel
struct SavedItemsModel: Codable {
    let success: Bool
    let statusCode: Int
    let data: DataClass
    let message: String

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case data, message
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let list: List
}

// MARK: - List
struct List: Codable {
    let cancelled, paymentPending, saved, processing: [Cancelled]?

    enum CodingKeys: String, CodingKey {
        case cancelled
        case paymentPending = "payment_pending"
        case saved, processing
    }
}

// MARK: - Cancelled
struct Cancelled: Codable {
    let purchasedTrackingNo: String?
    let createdAt, status: String
    let shippingDescription: String?
    let updatedAt, type: String
    let details: JSONNull?
    let items: [Item]
    let shipperDetails: JSONNull?
    let paymentStatus: String
    let promocodeAmount: Int?
    let shippingService: String?
    let aspID: String
    let purchasedOrderID: String?
    let missedItemAction: MissedItemAction?
    let shippingCharges: Int?
    let typeOfPromocode, promocode: String?

    enum CodingKeys: String, CodingKey {
        case purchasedTrackingNo = "purchased_tracking_no"
        case createdAt = "created_at"
        case status
        case shippingDescription = "shipping_description"
        case updatedAt = "updated_at"
        case type, details, items
        case shipperDetails = "shipper_details"
        case paymentStatus = "payment_status"
        case promocodeAmount = "promocode_amount"
        case shippingService = "shipping_service"
        case aspID = "asp_id"
        case purchasedOrderID = "purchased_order_id"
        case missedItemAction = "missed_item_action"
        case shippingCharges = "shipping_charges"
        case typeOfPromocode = "type_of_promocode"
        case promocode
    }
}

// MARK: - Item
struct Item: Codable {
    let createdAt: String
    let price: Int
    let name: String
    let aspCategoryID: Int
    let url: String
    let category: MissedItemAction
    let size: String
    let quantity: Int
    let color, status: String
    let details: JSONNull?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name
        case aspCategoryID = "asp_category_id"
        case url, category, size, quantity, color, status, details
    }
}

// MARK: - MissedItemAction
struct MissedItemAction: Codable {
    let id: Int
    let title, key: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
