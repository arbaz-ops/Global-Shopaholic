//
//  MyStorage.swift
//  Global Shopaholic
//
//  Created by Carbonic-IT on 26/11/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation

struct MyStorage: Codable {
    var success: Bool?
    var status_code: Int?
    var message: String?
    var data: PackagesList
    
    enum MyStorageCodingKeys: CodingKey {
        case  success,status_code,message,data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStorageCodingKeys.self)
        success = try! container.decode(Bool.self, forKey: .success)
        status_code = try! container.decode(Int.self, forKey: .status_code)
        message = try! container.decode(String.self, forKey: .message)
        data = try! container.decode(PackagesList.self, forKey: .data)
    }
}

struct PackagesList: Codable {
    var list : [Package]
    
    enum PackagesListCodingKeys: CodingKey {
        case list
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PackagesListCodingKeys.self)
        list = try! container.decode([Package].self, forKey: .list)
    }
}

struct Package: Codable
{
    var id: Int?
    var package_id: String?
    var description: String?
    var tracking_number: String?
    var reference_tracking_number: String?
    var status: String?
    var condition: String?
    var free_services: String?
    var paid_services: String?
    var consolidation_request_id: String?
    var parent_package_id: String?
    var shopaholic_id: Int?
    var details: String?
    var created_at: String?
    var updated_at: String?
    var ship_only_us: Int?
    var complete_storage_mail: Int?
    var storageLeft: Int?
    var LateFee: Int?
    var package_own_remarks: String?
    var package_custom_detail: [String]?
    var primary_full_image: PrimaryFullImage?
    
    enum PackageCodingKeys: CodingKey {
        case id,
             package_id,
             description,
             tracking_number,
             reference_tracking_number,
             status,
             condition,
             free_services,
             paid_services,
             consolidation_request_id,
             parent_package_id,
             shopaholic_id,
             details,
             created_at,
             updated_at,
             ship_only_us,
             complete_storage_mail,
             storageLeft,
             LateFee,
             package_own_remarks,
             package_custom_detail,
             primary_full_image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PackageCodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        package_id = try? container.decode(String.self, forKey: .package_id)
        description = (try? container.decode(String.self, forKey: .description)) ?? nil
        tracking_number = try? container.decode(String.self, forKey: .tracking_number)
        reference_tracking_number = try? container.decode(String.self, forKey: .reference_tracking_number)
        status = try? container.decode(String.self, forKey: .status)
        condition = try? container.decode(String.self, forKey: .condition)
        free_services = (try? container.decode(String.self, forKey: .free_services)) ?? nil
        paid_services = (try? container.decode(String.self, forKey: .paid_services)) ?? nil
        consolidation_request_id = (try? container.decode(String.self, forKey: .consolidation_request_id)) ?? nil
        parent_package_id = (try? container.decode(String.self, forKey: .parent_package_id)) ?? nil
        shopaholic_id = try? container.decode(Int.self, forKey: .shopaholic_id)
        details = (try? container.decode(String.self, forKey: .details)) ?? nil
        created_at = try? container.decode(String.self, forKey: .created_at)
        updated_at = try? container.decode(String.self, forKey: .updated_at)
        ship_only_us = try? container.decode(Int.self, forKey: .ship_only_us)
        complete_storage_mail = try? container.decode(Int.self, forKey: .complete_storage_mail)
        storageLeft = try? container.decode(Int.self, forKey: .storageLeft)
        LateFee = try? container.decode(Int.self, forKey: .LateFee)
        package_own_remarks = (try? container.decode(String.self, forKey: .package_own_remarks)) ?? nil
        package_custom_detail = (try? container.decode([String].self, forKey: .package_custom_detail)) ?? []
    }
    
}

struct PrimaryFullImage: Codable {
    var id: Int?
    var image_name: String?
    var size_type: String?
    var type: String?
    var package_id: Int?
    var status: String?
    var upload_status: String?
    var created_at: String?
    var updated_at: String
}
