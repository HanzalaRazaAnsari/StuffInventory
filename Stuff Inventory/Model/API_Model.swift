//
//  API_Model.swift
//  Stuff Inventory
//
//  Created by Mac on 1/7/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import Foundation
class signUp {
    struct SignUp:Codable {
        let data: DataClass?
        let error, message: String?
    }
    
    struct DataClass:Codable {
        let token: String?
        let user: User1?
    }
    
    struct User1:Codable {
        let role: Bool?
        let email: String?
        let id: Int?
        let name, password: String?
    }
}

class login {
    struct Login:Codable {
        let data: DataClass?
        let error, message: String?
    }
    
    struct DataClass:Codable{
        let token: String?
        let user: User?
    }
    
    struct User:Codable{
        let role: Bool?
        let email: String?
        let id: Int?
        let name, password: String?
    }
}

class addProduct {
    struct Addproduct:Codable {
        let name, manufacture, description: String?
        let amount, quantity: Int?
        let date: String?
    }
}

class getProduct{
    struct Addproduct:Codable {
        let data: [Detail]?
        let error, message: String?
        
        struct product:Codable{
            
        }
    }
    
    struct Detail:Codable {
        let amount: Int?
        let date, description: String?
        let id: Int?
        let manufacture, name: String?
        let quantity: Int?
    }
}

class editProduct{
    struct EditProduct:Codable {
        let data: DataClass?
        let error, message: String?
    }
    
    struct DataClass:Codable {
        let amount: Int?
        let date, description: String?
        let id: Int?
        let manufacture, name: String?
        let quantity: Int?
    }
}

class deleteProduct {
    struct DeleteProduct:Codable {
        let data, error, message: String?
    }
}

class addStore{
    struct AddStore:Codable {
        let data: DataClass?
        let error, message: String?
    }
    
    struct DataClass:Codable {
        let id: Int?
        let location, storeName: String?
    }
}

class getStore{
    struct GetStore:Codable {
        let data: [store]?
        let error, message: String?
    }
    
    struct store:Codable {
        let id: Int?
        let location, storeName: String?
    }
}
class addSales{
    struct AddSales:Codable {
        let data, error, message: String?
    }
}
class getSales{
    struct GetSales:Codable {
        let data: [product]?
        let error, message: String?
    }
    
    struct product:Codable {
        let productName: String?
        let sale: Sale?
        let storeLocation, storeName: String?
    }
    
    struct Sale:Codable {
        let id, productID, quantity: Int?
        let saleDate: String?
        let stockSold, storeID, totalAmount: Int?
    }
}
