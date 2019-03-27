//
//  ViewController.swift
//  Stuff Inventory
//
//  Created by Mac on 1/7/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import UIKit
import Async

class LoginVC: UIViewController {
    
    static var instance = LoginVC()
    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       


        textfieldAppearance(textField: emailTextField, placeholder: "Email")
        textfieldAppearance(textField: passwordTextField, placeholder: "Password")
        log.verbose("this is haris calling from log ®")
        
    }
    
    func textfieldAppearance(textField:UITextField , placeholder:String){
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.cornerRadius = 8.75
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
    }
    
   
    
    @IBAction func Login (_ sender:Any){
        if emailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            let alert = UIAlertController(title: "Empty Field Found", message: "Fill required field ", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
        } else {
//            requestManager.instance.LogIn(email: emailTextField.text!, password: passwordTextField.text!) { (Success, error) in
            signin(username: emailTextField.text!, password: passwordTextField.text!)
            
                }
            }

        

    
    @IBAction func Register (_ sender:Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register")
        self.present(vc, animated: true, completion: nil)
    }
    
    func signin (username:String,password:String){
        Async.background(){
        requestManager.instance.LogIn(email: username, password: password) { (Success, error) in
            if Success != nil {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBar")
                self.present(vc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "Invalid Credentials ", preferredStyle: .alert)
                let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
        
    }
}

