//
//  Endpoints.swift
//  Global Shopaholic
//
//  Created by Ahsan Minhas on 26/01/2021.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import Foundation


struct endpoints {
    let loginEP = "api/login_user"
    let regisrationEP = "api/register_user"
    let forgotPasswardEP = "api/forgot_password"
    let getCountriesEP = "api/countries"
    let StorageInfoEP = "api/my_storage"
    let getCitiesEP = "api/countryCities"
    let addAddressEP = "api/add_user_address"
    let updateAddressEP = "api/update_user_address"
    let getUserAddressesEP = "api/user_addresses"
    let dropAddressEP = "api/drop_address"
    let GetFAQEP = "api/faq_list"
    let UpdateInfoEP = "api/update_profile_info"
    let ChangePasswordEP = "api/change_password"
    let ShippingCalculatorEP = "api/shipping/rates"
    let addcardEP = "api/credit/card/create"
    let cardListEP = "api/credit/card/list"
    let cardDepositeEP = "api/wallet/deposit/credit_card"
    let walletInfoEP = "api/wallet/info"
    let newsEP = "api/news/list"
    let mostOrderedItemsEP = "api/products/mostlyshipped/list"
    let GetAspViewEP = "api/asp"
    let GetAspSummaryEP = "api/asp/order/summary"
    let CreateASPRequestEP = "api/asp/store"
    let CheckoutSummaryEP = "api/asp/checkout/order/summary"
    let GetUserAspData = "api/asp/request/list"
    let BankCheckoutEP = "api/asp/checkout/bank"
    let checkOutViaCCEP = "api/asp/checkout/credit_card"
    let packagesList = "api/shopaholic/storage/packages/list"
    let getRequestReview = "api/shopaholic/storage/request/getreview"
    let getCustomDeclaration = "api/shopaholic/storage/request/getcustomform"
    let getRequestPackages = "api/shopaholic/storage/request/packages/list"
}
