//
//  addProductViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

let kDefaultAnimationDuration = 2.0

class addProductViewController: UITableViewController,UISearchControllerDelegate,  UISearchBarDelegate {
    
    
   
  
    var searchController : UISearchController!
    var productArray = [String]()
    var priceArray = [String]()
    var serviceTypeArray = [String]()
    var filteredData = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Product & Price"
        tableView.register(ProductPriceCell.self, forCellReuseIdentifier: "cellid")
        tableView.separatorStyle  = .singleLine
        tableView.separatorColor = UIColor.black
     
        
        tableView.reloadData()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleProductSearch)), UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddProduct))]
       
        fetchProductAndPrice()
      
    }
    
    
    
    func handleAddProduct(){
        let InfoTitle = "Product & Price"
        let Subtitle = "Create products catalogue such as Jeans, Shirts, Jacket etc."
        
        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        let alert = SCLAlertView(appearance: appearance)
         let productNameChoose = alert.addTextField("Enter product name")
        let serviceType = alert.addTextField("Enter Service Type")
        let price = alert.addTextField("Enter product Price")
        
        _ = alert.addButton("Save") {
            
            if productNameChoose.text == ""{
                
                self.view.makeToast("Enter Product Name")
                
            }else if serviceType.text == "" {
                self.view.makeToast("Choose Service Type")
                
            }
            else if price.text == ""{
                self.view.makeToast("Enter Price")
            }else{
            // Firebase product and their price add
            
            guard let product = productNameChoose.text , let price = price.text , let serviceType = serviceType.text   else {
                return
            }
            let DBRef = FIRDatabase.database().reference()
            let usersRef = DBRef.child("product_price").childByAutoId()
            let values = ["product": product.capitalized, "price": price, "serviceType": serviceType.capitalized]
            
            usersRef.updateChildValues(values) { (error, DBRef) in
                if error != nil{
                    
                    self.view.makeToast((error?.localizedDescription)!)
                }
            }
            

        }
        }
        _ = alert.showEdit(InfoTitle, subTitle:Subtitle)
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
        
        let filterData = (self.productArray as NSArray).filtered(using: searchPredicate)
        
     filteredData = filterData as! [String]
        
        searchController.resignFirstResponder()
        
        self.tableView.reloadData()
    }

    
    func handleProductSearch(){
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.placeholder = "Search Product"
        self.searchController.searchBar.tintColor = UIColor.black
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.barTintColor =  UIColor(hexString: "2E3B46")
        self.tableView.tableHeaderView = searchController.searchBar
      
    }
    
    
    func fetchProductAndPrice() {
        FIRDatabase.database().reference().child("product_price").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                if   let productNames = dictionary["product"] as? String{
                    self.productArray.append(productNames)
                    if let price = dictionary["price"] as? String{
                        self.priceArray.append(price)
                    }
                    if let service = dictionary["serviceType"] as? String{
                        
                        self.serviceTypeArray.append(service)
                    }
                }
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
             

            }
        }, withCancel: nil)
    }



    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        tableView.reloadData()
    }
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredData.isEmpty == true{
            return productArray.count
        
        }
        
        return filteredData.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! ProductPriceCell
        cell.backgroundColor = UIColor(hexString: "2E3B46")

        if filteredData.isEmpty == true{
            cell.productNameLabel.text = productArray[indexPath.row]
            cell.washNameLabel.text = serviceTypeArray[indexPath.row]
            cell.washpricePerPieces.text = String(priceArray[indexPath.row])

            
        }else{
            
            cell.productNameLabel.text = filteredData[indexPath.row]
          
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
    }
}
