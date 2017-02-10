//
//  ZipcodeViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class ZipcodeViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate  {
    var searchController : UISearchController!
    
     var ZipCodeArray = [String]()
    var filteredData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle  = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ZipCodecellid")
        tableView.reloadData()
        tableView.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Zipcode"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
        
        fetchZipCode()

    }

    
    func handleAddProduct(){
        let kInfoTitle = "Add Zipcode"
        let kSubtitle = "Add Zipcode name where you are providing service, such as 72201, 72217, 85055 etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let zipcodeLabel = alert.addTextField("Enter zipcode")
        _ = alert.addButton("Save") {
            if zipcodeLabel.text == ""{
                
                self.view.makeToast("Enter Country")
                
                
            }else{
                // Firebase product and their price add
                
                guard let zipcodeLabel = zipcodeLabel.text  else {
                    return
                }
                let DBRef = FIRDatabase.database().reference()
                let usersRef = DBRef.child("ZipCode").childByAutoId()
                let values = ["ZipCode": zipcodeLabel]
                
                usersRef.updateChildValues(values) { (error, DBRef) in
                    if error != nil{
                        
                        self.view.makeToast((error?.localizedDescription)!)
                    }
                }
                
                
            }
            

        }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    
    func handleProductSearch(){
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.placeholder = "Search Zipcode"
        self.searchController.searchBar.tintColor = UIColor.black
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.barTintColor =  UIColor(hexString: "2E3B46")
        self.definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        print("searched")
        if (searchBar.text?.isEmpty)! {
            
            return
        }
        doSearch(searchWord: searchBar.text!)
        
    }
    
    func doSearch(searchWord: String){
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchWord)
        
        let filterData = (self.ZipCodeArray as NSArray).filtered(using: searchPredicate)
        
        filteredData = filterData as! [String]
        
        searchController.resignFirstResponder()
        
        self.tableView.reloadData()
    }

    
  
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
        searchController.searchBar.isHidden = true
    }
    func fetchZipCode() {
        FIRDatabase.database().reference().child("ZipCode").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let ZipCode = dictionary["ZipCode"] as? String{
                    self.ZipCodeArray.append(ZipCode)
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredData.isEmpty == true{
            return ZipCodeArray.count
            
        }
        
        return filteredData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZipCodecellid", for: indexPath)
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        if filteredData.isEmpty == true{
            cell.textLabel?.text = ZipCodeArray[indexPath.row]
        }else{
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        return cell
    }
    
}
