//
//  Enumerations.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 01/12/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation



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
}


enum PackageStatus: String {
    case Approved = "approved"
    case Rejected = "rejected"
    case Processing = "processing"
}
