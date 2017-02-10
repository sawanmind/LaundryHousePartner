//
//  StateViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD


class StateViewController: UITableViewController, UISearchControllerDelegate,  UISearchBarDelegate  {
    var searchController : UISearchController!
    
    var stateArray = [String]()
    var filteredData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle  = .none
        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Add State"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle  = .none
        tableView.reloadData()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
        fetchState()

    }

    func handleAddProduct(){
        let kInfoTitle = "Add State"
        let kSubtitle = "Add State name where you are providing service, such as Florida, Texas, California etc."

        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
        let stateLabel = alert.addTextField("Enter state name")
        _ = alert.addButton("Save") {
            if stateLabel.text == ""{
                
                self.view.makeToast("Enter State")
                
           
            }else{
                // Firebase product and their price add
                
                guard let stateLabel = stateLabel.text  else {
                    return
                }
                let DBRef = FIRDatabase.database().reference()
                let usersRef = DBRef.child("State").childByAutoId()
                let values = ["state": stateLabel.capitalized]
                
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
        self.searchController.searchBar.placeholder = "Search State"
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
        
        let filterData = (self.stateArray as NSArray).filtered(using: searchPredicate)
        
        filteredData = filterData as! [String]
        
        searchController.resignFirstResponder()
        
        self.tableView.reloadData()
    }

    
    func fetchState() {
        FIRDatabase.database().reference().child("State").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let state = dictionary["state"] as? String{
                    self.stateArray.append(state)
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
            }
        }, withCancel: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredData.isEmpty == true{
            return stateArray.count
            
        }
        
        return filteredData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor(hexString: "2E3B46")
        if filteredData.isEmpty == true{
            cell.textLabel?.text = stateArray[indexPath.row]
        }else{
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        return cell
    }
    
}
