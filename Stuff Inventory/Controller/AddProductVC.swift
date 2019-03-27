//
//  AddProductVC.swift
//  Stuff Inventory
//
//  Created by Mac on 1/15/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import UIKit

class AddProductVC: UIViewController {
    
    let datePicker = UIDatePicker()

    static var instance = AddProductVC()
    
    @IBOutlet weak var nameTF:UITextField!
    @IBOutlet weak var manufactureTF:UITextField!
    @IBOutlet weak var descriptionTF:UITextField!
    @IBOutlet weak var amountTF:UITextField!
    @IBOutlet weak var quantityTF:UITextField!
    @IBOutlet weak var dateTF:UITextField!
   


    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.datePickerMode = .date
        dateTF.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: UIControl.Event.valueChanged)

    }
    
    @IBAction func productSavedPressed (_ sender:UIButton){
        if nameTF.text?.isEmpty == true || manufactureTF.text?.isEmpty == true || descriptionTF.text?.isEmpty == true || amountTF.text?.isEmpty == true || quantityTF.text?.isEmpty == true || dateTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Empty Field Found", message: "Fill required field ", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        } else {
            productDone(name: nameTF.text!, manufacture: manufactureTF.text!, description: descriptionTF.text!, amount: Int(amountTF.text!)!, quantity: Int(quantityTF.text!)!, date: dateTF.text!)
            log.verbose("Product Updated")
        }
        
    }
        
    
    
    func productDone (name:String,manufacture:String,description:String,amount:Int,quantity:Int,date:String){
        requestManager.instance.additionOfProduct(name: name, manufacture: manufacture, description: description, amount: amount, quantity: quantity, date: date) { (Success, error) in
            if Success != nil {
                let alert = UIAlertController(title: "Successful", message: "You Product is Successfully added", preferredStyle: UIAlertController.Style.alert)
                let okay = UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                    AddVC.instance.SegueVC(identifier: "Dashbooard")
                })
//                let okay = UIAlertAction(title: "OK", style: .cancel, handler: (action)
//                in )
                
//                let alert = UIAlertController(title: "Is your mobile number correct?", message: "\(self.cp.selectedCountry.phoneCode)\(self.CountryPickerViewField.text!)"
//                    , preferredStyle: UIAlertControllerStyle.alert)
                
             
                    
            }
            

        
        }
    }
    
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        print("time picker changed for ceremony")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        log.verbose("Date = \(datePicker.date)")
        let strDate = dateFormatter.string(from: datePicker.date)
        dateTF.text = strDate
    }

    
    
    
    
    
}
