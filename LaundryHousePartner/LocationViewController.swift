//
//  LocationViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD


class LocationViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate  {
    var searchController : UISearchController!
    var locationArray = [String]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle  = .none
        tableView.reloadData()
        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add Location"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
        fetchLocation()

    }

    func handleAddProduct(){
        let kInfoTitle = "Add Location"
        let kSubtitle = "Create Location such as New York, Chicago, Boston etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let locationLabel = alert.addTextField("Enter Location name")
        _ = alert.addButton("Save") {
            
            if  locationLabel.text == "" {
                self.view.makeToast("Enter Location")
                
            } else{
            // Firebase Location add
            
            guard let Location = locationLabel.text    else {
                return
            }
            let DBRef = FIRDatabase.database().reference()
            let usersRef = DBRef.child("Location").childByAutoId()
            let values = ["location": Location.capitalized]
            
            usersRef.updateChildValues(values) { (error, DBRef) in
                if error != nil {
                    
                    self.view.makeToast((error?.localizedDescription)!)
            }
            
            }
        }
    }
        _ = alert.showEdit(kInfoTitle, subTitle:kSubtitle)
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
        
        let filterData = (self.locationArray as NSArray).filtered(using: searchPredicate)
        
        filteredData = filterData as! [String]
        
        searchController.resignFirstResponder()
        
        self.tableView.reloadData()
    }
    
    func handleProductSearch(){
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.placeholder = "Search Location"
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

    func fetchLocation() {
        FIRDatabase.database().reference().child("Location").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let location = dictionary["location"] as? String{
                    self.locationArray.append(location)
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredData.isEmpty == true{
            return locationArray.count
            
        }
        
        return filteredData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        if filteredData.isEmpty == true{
            cell.textLabel?.text = locationArray[indexPath.row]
        }else{
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        return cell
    }

}
