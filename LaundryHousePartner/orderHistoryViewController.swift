//
//  priceViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD


class orderHistoryViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate {
  var searchController : UISearchController!
    
    var customerNameArray = [String]()
    var serviceTypeArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle  = .singleLine
        tableView.separatorColor  = UIColor.black
        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Order History"
        tableView.register(OrderCell.self, forCellReuseIdentifier: "cellid")
     
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSmartSearch))
        
    }
    
    func handleSmartSearch(){
        
        print("search")
    }
    
    func fetchOrders() {
        FIRDatabase.database().reference().child("order_history").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let customerName = dictionary["customerName"] as? String{
                    self.customerNameArray.append(customerName)
                    if let serviceType = dictionary["serviceType"] as? String{
                        self.serviceTypeArray.append(serviceType)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! OrderCell
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        cell.accessoryType = .disclosureIndicator
        cell.customerNameLabel.text = "Customer : \("Sawan Kumar")"
        cell.serviceTypeLabel.text = "Service : \("Wash")"
      
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        tableView.deselectRow(at: indexPath, animated: true)
        
        let secondViewController = OrderDetailViewController()
        
        self.navigationController?.pushViewController(secondViewController, animated: true)

    }

}
