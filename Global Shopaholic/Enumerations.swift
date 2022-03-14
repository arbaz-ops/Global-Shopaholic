//
//  Enumerations.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 01/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation



enum PaymentMethod {
    case paypal
    case card
    case bank
    case bitcoin
}

enum MainSelection: String {
    case Storage = "my_storage"
    case Outgoing = "outgoing"
    case Shipped = "shipped"
    case Delivered = "delivered"
    case Cancelled = "cancelled"
    case Return = "returned"
}

enum OutgoingStatus: String {
    case Preparing = "preparing"
    case PendingPayment = "payment_pending"
    case Processing = "processing"
    case PaymentDone = "payment_done"
    case Shipped = "shipped"
    case Delivered = "delivered"
}


enum PackageStatus: String {
    case Approved = "approved"
    case Rejected = "rejected"
    case Processing = "processing"
}

enum FreeServices: String {
    case PackageContentPhotoDuringCosolidation = "package_content_photo_during_consolidation"
    case PackageConsolidation = "package_consolidation"
    case Repacking = "repacking"
    case RemoveItemsBoxes = "remove_items_boxes"
    case RemoveProtectivePackaging = "remove_all_protective_packaging/padding"
    case RemoveShipperBoxes = "remove_shipper_boxes_(brown_boxes)"
    case RemoveInvoicesPricingTags = "remove_invoices_and_pricing_tags"
    case DoNotRemoveItemsBoxes = "do_not_remove_items_boxes"
    case DoNotRemoveShipperBoxes = "do_not_remove_shipper_boxes_(brown_boxes)"
    case Other = "other"
}

enum PaidServices: String {
    case Split = "split"
    case DetailedPhoto = "detail_photos"
    case TestDevice = "test_device"
}
