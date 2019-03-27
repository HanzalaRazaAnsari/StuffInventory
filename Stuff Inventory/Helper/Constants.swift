//
//  Constant.swift
//  Stuff Inventory
//
//  Created by Mac on 1/7/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import Foundation


class Api {
    
    static var baseURL = "https://app-inventory.herokuapp.com/"
    struct Auth_Constants_Methods{
        
        static let LOGIN_API = "\(baseURL)login"
        static let SIGNUP_API = "\(baseURL)signup"
        static let GET_PRODUCT_API =  "\(baseURL)getProducts"
        static let ADD_PRODUCT_API = "\(baseURL)AddProduts"
        static let DELETE_PRODUCT_API = "\(baseURL)deleteProduct"
        static let EDIT_PRODUCT_API =  "\(baseURL)editProduct"
        static let ADD_STORE_API =  "\(baseURL)addStores"
        static let GET_STORE_API =  "\(baseURL)getStores"
        static let ADD_SALES_API =  "\(baseURL)AddSales"
        static let GET_SALES_API =  "\(baseURL)getSales"
    }
    
    struct Params {
        static var ServerKey = "server_key"
        static var email = "email"
        static var Username = "username"
        static var password = "password"
        static var ConfirmPassword = "conf_password"
        static var AccessToken = "access_token"
        static var name = "name"
        static var manufacture = "manufacture"
        static var description = "description"
        static var amount = "amount"
        static var quantity = "quantity"
        static var date = "date"
        static var Message = "Message"
        static var Reason = "Reason"
        static var Response = "Response"
        static var response = "response"
        static var FirstName = "FirstName"
        static var LastName = "LastName"
        static var SignupBy = "SignupBy"
        static var UserID = "UserID"
        static var Index = "Index"
        static var FileName = "FileName"
        static var ImageType = "ImageType"
        static var Role = "Role"
        static var productID = "pid"
        static var storeID = "sid"
        static var saleDate = "saleDate"
        static var stockSold = "stockSold"
        static var storeName = "storeName"
        static var location = "location"
}
    
}
