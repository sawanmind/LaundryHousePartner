//
//  OrderDetailViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/9/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD


class OrderDetailViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle  = .none
        tableView.separatorColor  = UIColor(hexString: "2E3B46")
        tableView.backgroundColor = UIColor(hexString: "2E3B46")
        
        navigationItem.title = "Order Detail"
        tableView.register(DetailOrderCell.self, forCellReuseIdentifier: "cellids")
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "assign", style: .done, target: self, action: #selector(handleassign))
        

    }
    
    func handleassign(){
       let new = VendorListViewController()
        self.navigationController?.pushViewController(new, animated: true)
        
    }
  
    
    
    
    func fetchOrders() {
        FIRDatabase.database().reference().child("order_history").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let customerName = dictionary["customerName"] as? String{
                    //self.customerNameArray.append(customerName)
                    if let serviceType = dictionary["serviceType"] as? String{
                      //  self.serviceTypeArray.append(serviceType)
                    }
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellids", for: indexPath) as! DetailOrderCell
        cell.backgroundColor = UIColor(hexString: "2E3B46")
    
        cell.selectionStyle = .none
        cell.customerNameLabel.text = "Customer : \("Sawan Kumar")"
        cell.serviceTypeLabel.text = "Service : \("Wash")"
        cell.contactNumberLabel.text = "Contact No. : \("8010153210")"
        cell.paymentModeLabel.text =  "Payment Mode : \("Paied Online")"
        cell.TotalCostLabel.text = "Total Cost : \("299")"
        return cell
    }
    
    
}
