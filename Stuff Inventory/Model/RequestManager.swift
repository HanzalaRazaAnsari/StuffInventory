//
//  RequestManager.swift
//  Stuff Inventory
//
//  Created by Mac on 1/9/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import Foundation
import Alamofire

class requestManager:NSObject {
    
    static var instance = requestManager()

    func additionOfProduct (name:String , manufacture:String , description:String , amount:Int, quantity:Int, date:String ,completionHandler: @escaping (_ success:addProduct.Addproduct? , Error?) -> ()){
        
        let param:[String:Any] = [
            Api.Params.name : name,
            Api.Params.manufacture : manufacture,
            Api.Params.description : description,
            Api.Params.amount : amount,
            Api.Params.quantity : quantity,
            Api.Params.date : date
        ]
        
        Alamofire.request(Api.Auth_Constants_Methods.ADD_PRODUCT_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                if res != nil {
                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
                    let result = try! JSONDecoder().decode(addProduct.Addproduct.self, from: data)
                    completionHandler(result,nil)
                } else {
                    completionHandler(nil,response.error)
                }
            }
        }
    }
    
    
    func SignUp (email:String , name:String , password:String , role:Bool ,completionHandler: @escaping (_ success:signUp.SignUp? , Error?) -> ()){
    
        let param:[String:Any] = [
            Api.Params.email : email,
            Api.Params.name: name,
            Api.Params.password : password,
            Api.Params.Role : role
        ]
        
    

        Alamofire.request(Api.Auth_Constants_Methods.SIGNUP_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                guard let message = res["message"] as? String else {return}
                guard let errorMsg = res["error"] as? String else {return}
                print(res)
                
                if res != nil {
                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
                    let result = try! JSONDecoder().decode(signUp.SignUp.self, from: data)
                    completionHandler(result,nil)
                } else {
                    completionHandler(nil,response.error)
                }
                
            }
    
        }
    }
    
    
    
    
    func LogIn (email:String , password:String ,completionHandler: @escaping (_ success:login.Login? , Error?) -> ()){
        
        let param:[String:Any] = [
            Api.Params.email : email,
            Api.Params.password : password
        ]
        
        Alamofire.request(Api.Auth_Constants_Methods.LOGIN_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
//            print(response)
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                guard let dataLoad = res["data"] as? [String:Any]? else {return}
                guard let token = res["token"] as? String? else {return}
                print(dataLoad)
                if dataLoad != nil {
                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
//                    print(data)
                    let result = try! JSONDecoder().decode(login.Login.self, from: data)
                    completionHandler(result,nil)
                } else {
//
                    completionHandler(nil,response.error)
                }
            
            }
            
        }
}
    
    func addSales (productID:String , storeID:String , saleDate:String , quantity:String, stockSold:String, completionHandler: @escaping (_ success:login.Login? , Error?) -> ()){
        
        let param:[String:Any] = [
            Api.Params.productID : productID,
            Api.Params.storeID : storeID,
            Api.Params.saleDate : saleDate,
            Api.Params.quantity : quantity,
            Api.Params.stockSold : stockSold,

        ]
        
        Alamofire.request(Api.Auth_Constants_Methods.ADD_SALES_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
            //            print(response)
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                guard let dataLoad = res["data"] as? [String:Any]? else {return}
                print(dataLoad)
                if dataLoad != nil {
                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
                    //                    print(data)
                    let result = try! JSONDecoder().decode(login.Login.self, from: data)
                    completionHandler(result,nil)
                } else {
                    //
                    completionHandler(nil,response.error)
                }
                
            }
            
        }
    }
    
    
    func addStore (storeName:String , location:String , completionHandler: @escaping (_ success:login.Login? , Error?) -> ()){
        
        let param:[String:Any] = [
            Api.Params.storeName : storeName,
            Api.Params.location : location
            ]
        
        Alamofire.request(Api.Auth_Constants_Methods.ADD_STORE_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
            //            print(response)
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                guard let dataLoad = res["data"] as? [String:Any]? else {return}
                print(dataLoad)
                if dataLoad != nil {
                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
                    //                    print(data)
                    let result = try! JSONDecoder().decode(login.Login.self, from: data)
                    completionHandler(result,nil)
                } else {
                    //
                    completionHandler(nil,response.error)
                }
                
            }
            
        }
    }
    
    
//    func addStore (storeName:String , location:String , completionHandler: @escaping (_ success:login.Login? , Error?) -> ()){
//
//        let param:[String:Any] = [
//            Api.Params.storeName : storeName,
//            Api.Params.location : location
//        ]
    
//        Alamofire.request(Api.Auth_Constants_Methods.ADD_STORE_API, method: .post, parameters:param , encoding:JSONEncoding.default , headers: nil).responseJSON { response in
//            //            print(response)
//            if response.result.value != nil {
//                guard let res = response.result.value as? [String:Any] else {return}
//                guard let dataLoad = res["data"] as? [String:Any]? else {return}
//                print(dataLoad)
//                if dataLoad != nil {
//                    let data = try! JSONSerialization.data(withJSONObject: response.value, options: [])
//                    //                    print(data)
//                    let result = try! JSONDecoder().decode(login.Login.self, from: data)
//                    completionHandler(result,nil)
//                } else {
//                    //
//                    completionHandler(nil,response.error)
//                }
//                
//            }
//            
//        }
//    }
    
  
            
        }
        




    


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    

