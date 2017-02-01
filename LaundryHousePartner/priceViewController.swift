//
//  priceViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit


class priceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Price"
          navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]

    }
    
    func handleAddProduct(){
        let kInfoTitle = "Add Price"
        let kSubtitle = "Create price of catalogue such as Price: $30, Price: $40, Price: $50 etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let productNameChoose = alert.addTextField("Choose product name")
        let txt = alert.addTextField("Enter price")
       
        _ = alert.addButton("Save") {
            print("Text value: \(txt.text)")
            print("\(productNameChoose.text)")
        }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    func handleProductSearch(){
        
        print("handleProductSearch")
    }


}
