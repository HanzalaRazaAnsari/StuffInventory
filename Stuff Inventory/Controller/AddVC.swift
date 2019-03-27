//
//  AddVC.swift
//  Stuff Inventory
//
//  Created by Mac on 1/15/19.
//  Copyright © 2019 unisoft. All rights reserved.
//

import UIKit

class AddVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    static var instance = AddVC()
    
    @IBOutlet weak var tableView:UITableView!

    var addArray = ["Product","Store","Sales"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    

   
    
    func SegueVC (identifier:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "add") as! AddCell
        cell.addLabel?.text = self.addArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if addArray[indexPath] = 0 {
        if addArray[indexPath.row] == "Product"  {
           SegueVC(identifier: "addProduct")
        } else if addArray[indexPath.row] == "Store" {
            SegueVC(identifier: "addStore")
        } else {
           SegueVC(identifier: "addSales")
            
        }
    }
}
