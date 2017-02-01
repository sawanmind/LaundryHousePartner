//
//  ZipcodeViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class ZipcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Zipcode"
          navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]

    }

    
    func handleAddProduct(){
        let kInfoTitle = "Add Zipcode"
        let kSubtitle = "Add Zipcode name where you are providing service, such as 72201, 72217, 85055 etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("Enter zipcode")
        _ = alert.addButton("Save") {
            print("Text value: \(txt.text)")
        }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    func handleProductSearch(){
        
        print("handleProductSearch")
    }


}
