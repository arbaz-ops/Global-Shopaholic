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
    case All = "all"
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

enum AdditionalInfo: String {
    case Do_you_want_to_Insure_this_Package = "Do_you_want_to_Insure_this_Package_?"
    case Does_this_Package_contain_Batteries = "Does_this_Package_contain_Batteries_?"
    case Send_as_Gift = "Send_as_Gift_?"
    case Is_dangerous_goods = "Is_dangerous_goods_?"
    case express_processing = "express_processing"
    case prepare_in_one_box = "prepare_in_one_box"
    case add_fragile_sticker = "add_fragile_sticker"
    case use_the_smallest_box = "use_the_smallest_box"
    case pack_without_bubble_wrap = "pack_without_bubble_wrap"
    case add_extra_padding_and_bubble_wrap = "add_extra_padding_and_bubble_wrap"
}
