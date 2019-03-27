//
//  AddSalesVC.swift
//  Stuff Inventory
//
//  Created by Mac on 1/23/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import UIKit

class AddSalesVC: UIViewController {
    
    @IBOutlet weak var productNameTF:UITextField!
    @IBOutlet weak var manufacturerTF:UITextField!
    @IBOutlet weak var descriptionTF:UITextField!
    @IBOutlet weak var AmountTF:UITextField!
    @IBOutlet weak var quantityTF:UITextField!
    @IBOutlet weak var dateTF:UITextField!


    

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginVC.instance.textfieldAppearance(textField: productNameTF, placeholder: "Product Name")
         LoginVC.instance.textfieldAppearance(textField: manufacturerTF, placeholder: "Manufacturer")
         LoginVC.instance.textfieldAppearance(textField: descriptionTF, placeholder: "Description")
         LoginVC.instance.textfieldAppearance(textField: AmountTF, placeholder: "Amount")
         LoginVC.instance.textfieldAppearance(textField: quantityTF, placeholder: "Quantity")
         LoginVC.instance.textfieldAppearance(textField: dateTF, placeholder: "Date")

    }
    

}
