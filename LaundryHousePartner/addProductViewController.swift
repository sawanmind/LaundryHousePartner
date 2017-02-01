//
//  addProductViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

let kDefaultAnimationDuration = 2.0

class addProductViewController: UITableViewController {
    
    
    var productArray = ["Jeans", "Shirt"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Product"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        tableView.separatorStyle  = .none
        tableView.backgroundColor = UIColor(hexString: "2E3B46")
        
        tableView.reloadData()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
    }

  
    func handleAddProduct(){
        let kInfoTitle = "Add Products"
        let kSubtitle = "Create products catalogue such as Jeans, Shirts, Jacket etc."
        
      

        
        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("Enter product name")
        _ = alert.addButton("Save") {
            
            self.productArray.append(txt.text!);
            self.tableView.reloadData()
            print("Text value: \(txt.text)")
        }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    func handleProductSearch(){
        
        print("handleProductSearch")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        cell.textLabel?.text = productArray[indexPath.row]
        
        
        return cell
    }
    
    
}
