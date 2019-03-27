//
//  RegisterVC.swift
//  Stuff Inventory
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import UIKit
import Async

class RegisterVC: UIViewController {
    
    static var instance = RegisterVC()
    
    @IBOutlet weak var emailtextfield:UITextField!
    @IBOutlet weak var nametextfield:UITextField!
    @IBOutlet weak var passwordtextfield:UITextField!
    @IBOutlet var RoleButton:[UIButton]!
    
    var isAdmin:Bool?
    var isAdminText:String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginVC.instance.textfieldAppearance(textField: emailtextfield, placeholder: "Email")
        LoginVC.instance.textfieldAppearance(textField: nametextfield, placeholder: "Name")
        LoginVC.instance.textfieldAppearance(textField: passwordtextfield, placeholder: "Password")

    }
    

    @IBAction func RegisterUser (_ sender:AnyObject){
        if emailtextfield.text?.isEmpty == true || nametextfield.text?.isEmpty == true || passwordtextfield.text?.isEmpty == true || isAdmin == nil
        {
            let alert = UIAlertController(title: "Register", message: "All Fields are Mandatory ", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
        } else {
            RegisterUser(email: emailtextfield.text!, name: nametextfield.text!, password: passwordtextfield.text!, role: isAdmin!)
                
            }
        }
    
    
    func RegisterUser(email:String,name:String,password:String,role:Bool) {
        requestManager.instance.SignUp(email: email, name: name, password: password, role: role) { (Success, error) in
            if Success?.error == "User with \(self.emailtextfield.text) Already registered"{
                print("Already Registered")
                let alert = UIAlertController(title: "Already Registered", message: "This Email is Already Registered", preferredStyle: .alert)
                let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
            }
            if Success?.message == "Sucessfully Registered" {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TabBar")
                    self.present(vc, animated: true, completion: nil)
                
            } else {
                
                
            }
        }
    }



    
    
    
    
    func uncheckAllButtons(){
        for btn in RoleButton {
            btn.isSelected = false
        }
    }
    @IBAction func RadioButton (_ sender:UIButton){
        uncheckAllButtons()
        sender.isSelected = true
        
        if sender.tag == 0 {
            isAdmin = true
            self.isAdminText = "Admin"
            print(isAdmin)
        } else{
            isAdmin = false
            self.isAdminText = "Client"
            print(isAdmin)
        }
    }

}
