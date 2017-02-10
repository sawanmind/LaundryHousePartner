//
//  VendorListViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/6/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class VendorListViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate  {
    var searchController : UISearchController!
    var VendorNameListArray = [String]()
      var VendorEmailListArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle  = .singleLine
        
        tableView.register(vendorListCustomCell.self, forCellReuseIdentifier: "VendorListcellid")
        tableView.reloadData()
        tableView.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Vendor List"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleVendorSearch))]
        
        fetchVendorList()
        
    }
    
    
    func handleVendorSearch(){
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.placeholder = "Search Vendor"
        self.searchController.searchBar.tintColor = UIColor.black
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.barTintColor =  UIColor(hexString: "2E3B46")
        self.definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
        
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
        searchController.searchBar.isHidden = true
    }
    
    func fetchVendorList() {
        FIRDatabase.database().reference().child("vendor_users").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let VendorName = dictionary["full_Name"] as? String{
                    self.VendorNameListArray.append(VendorName)
                    if let vendorEmail = dictionary["email"] as? String{
                        
                        self.VendorEmailListArray.append(vendorEmail)
                    }
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VendorNameListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VendorListcellid", for: indexPath) as? vendorListCustomCell
        cell?.backgroundColor = UIColor(hexString: "2E3B46")
        
        cell?.vendorNameLabel.text = VendorNameListArray[indexPath.row]
        cell?.vendorEmailLabel.text = VendorEmailListArray[indexPath.row]
        return cell!
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
        
    }

    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    handleorderAssign()
  }
    
    
    func handleorderAssign(){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess("Sucess", subTitle: "Order has been assigned!")
        
        
    }
}
