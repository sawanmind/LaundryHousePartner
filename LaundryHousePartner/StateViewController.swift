//
//  StateViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit


class StateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add State"
          navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]

    }

    
    func handleAddProduct(){
        let kInfoTitle = "Add State"
        let kSubtitle = "Add State name where you are providing service, such as Florida, Texas, California etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("Enter state name")
        _ = alert.addButton("Save") {
            print("Text value: \(txt.text)")
        }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    func handleProductSearch(){
        
        print("handleProductSearch")
    }

}
