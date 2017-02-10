//
//  CountryViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class CountryViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate  {
    var searchController : UISearchController!
    var CountryArray = [String]()
    var filteredData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle  = .none
        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Country"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "countrycellid")
        tableView.reloadData()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
   
        fetchCountry()
    }

    
    func handleAddProduct(){
        let kInfoTitle = "Add Country"
        let kSubtitle = "Add Country name where you are providing service, such as USA, India, Canada etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let countryLabel = alert.addTextField("Enter country name")
        _ = alert.addButton("Save") {
            if countryLabel.text == ""{
                
                self.view.makeToast("Enter Country")
                
                
            }else{
                // Firebase product and their price add
                
                guard let countryLabel = countryLabel.text  else {
                    return
                }
                let DBRef = FIRDatabase.database().reference()
                let usersRef = DBRef.child("Country").childByAutoId()
                let values = ["country": countryLabel.capitalized]
                
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
        self.searchController.searchBar.placeholder = "Search Country"
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        print("searched")
        if (searchBar.text?.isEmpty)! {
            
            return
        }
        doSearch(searchWord: searchBar.text!)
        
    }
    
    func doSearch(searchWord: String){
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchWord)
        
        let filterData = (self.CountryArray as NSArray).filtered(using: searchPredicate)
        
        filteredData = filterData as! [String]
        
        searchController.resignFirstResponder()
        
        self.tableView.reloadData()
    }

    
    func fetchCountry() {
        FIRDatabase.database().reference().child("Country").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let Country = dictionary["country"] as? String{
                    self.CountryArray.append(Country)
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredData.isEmpty == true{
            return CountryArray.count
            
        }
        
        return filteredData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countrycellid", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        if filteredData.isEmpty == true{
            cell.textLabel?.text = CountryArray[indexPath.row]
        }else{
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        return cell
    }
    
}
