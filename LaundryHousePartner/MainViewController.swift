//
//  MainViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/1/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "2E3B46")

        setupNavigationItem()
       view.addSubview(productBtnTitle)
        view.addSubview(productBtn)
        view.addSubview(priceBtnTitle)
        view.addSubview(priceBtn)
        view.addSubview(locationBtnTitle)
        view.addSubview(LocationBtn)
        view.addSubview(stateBtnTitle)
        view.addSubview(stateBtn)
        view.addSubview(countryBtnTitle)
        view.addSubview(countryBtn)
        view.addSubview(zipcodenBtnTitle)
        view.addSubview(zipcodeBtn)
        
        
        setupproductBtn()
        setupproductBtntitle()
        setuppriceBtntitle()
        setpriceBtn()
        setuplocationBtntitle()
        setLocationBtn()
        setupstateBtntitle()
        setupstateBtn()
        setupcountryBtntitle()
        setcountryBtn()
        setupzipcodeBtntitle()
        setzipcodeBtn()
    }

    private func setupNavigationItem(){
        let image = UIImage(named: "notification")
        navigationItem.title = "Dashboard Panel"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(hanldeNotification)), UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSmartSearch))]
        
        let profileImage = UIImage(named: "profile")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(handleProfile))
        
    }
    
    func handleProfile(){
        
        print("profile")
    }
    
    func hanldeNotification(){
        
        print("notification")
    }
    
    
    func handleSmartSearch(){
        
        print("handleSmartSearch")
        
    }
    lazy var notificationBtn : UIButton =  {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "notification"), for: UIControlState())
        btn.sizeToFit()
        
        return btn
    }()
    
    
    //product
    
    lazy var productBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "Product"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleProduct))
         nav.addGestureRecognizer(gesture)
       return nav
    }()
    
    func setupproductBtntitle(){
        productBtnTitle.centerXAnchor.constraint(equalTo: productBtn.centerXAnchor).isActive = true
        productBtnTitle.centerYAnchor.constraint(equalTo: productBtn.bottomAnchor, constant: 15).isActive = true
        productBtnTitle.widthAnchor.constraint(equalTo: productBtnTitle.widthAnchor).isActive = true
        productBtnTitle.heightAnchor.constraint(equalTo: productBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var productBtn: UIImageView = {
       let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "product")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleProduct))
        btn.addGestureRecognizer(gesture)
        
        return btn
    }()
    
    func setupproductBtn(){
        productBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        productBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        productBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        productBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func handleProduct(){
        
    let new = addProductViewController()
        self.navigationController?.pushViewController(new, animated: true)
    
    }
    
    
    
    //price
    
    
    lazy var priceBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "Price"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlePrice))
          nav.addGestureRecognizer(gesture)
        return nav
    }()
    
    func setuppriceBtntitle(){
        priceBtnTitle.centerXAnchor.constraint(equalTo: priceBtn.centerXAnchor).isActive = true
        priceBtnTitle.centerYAnchor.constraint(equalTo: priceBtn.bottomAnchor, constant: 15).isActive = true
        priceBtnTitle.widthAnchor.constraint(equalTo: priceBtnTitle.widthAnchor).isActive = true
        priceBtnTitle.heightAnchor.constraint(equalTo: priceBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var priceBtn: UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "price")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlePrice))

           btn.addGestureRecognizer(gesture)
        return btn
    }()
    
    func setpriceBtn(){
        priceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        priceBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        priceBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func handlePrice(){
        
        let new = priceViewController()
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    
    // location
    
    
    
    lazy var locationBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "Location"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlelocation))
         nav.addGestureRecognizer(gesture)

        return nav
    }()
    
    func setuplocationBtntitle(){
        locationBtnTitle.centerXAnchor.constraint(equalTo: LocationBtn.centerXAnchor).isActive = true
        locationBtnTitle.centerYAnchor.constraint(equalTo: LocationBtn.bottomAnchor, constant: 15).isActive = true
        locationBtnTitle.widthAnchor.constraint(equalTo: locationBtnTitle.widthAnchor).isActive = true
        locationBtnTitle.heightAnchor.constraint(equalTo: locationBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var LocationBtn: UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "location")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlelocation))
        
        btn.addGestureRecognizer(gesture)
        
        return btn
    }()
    
    func setLocationBtn(){
        LocationBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
        LocationBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        LocationBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        LocationBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func handlelocation(){
        
        let new = LocationViewController()
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    
    //state
    
    lazy var stateBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "State"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlestate))
         nav.addGestureRecognizer(gesture)

        return nav
    }()
    
    func setupstateBtntitle(){
        stateBtnTitle.centerXAnchor.constraint(equalTo: stateBtn.centerXAnchor).isActive = true
        stateBtnTitle.centerYAnchor.constraint(equalTo: stateBtn.bottomAnchor, constant: 15).isActive = true
        stateBtnTitle.widthAnchor.constraint(equalTo: stateBtnTitle.widthAnchor).isActive = true
        stateBtnTitle.heightAnchor.constraint(equalTo: stateBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var stateBtn: UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "state")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlestate))
        
   btn.addGestureRecognizer(gesture)
        return btn
    }()
    
    func setupstateBtn(){
        stateBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        stateBtn.topAnchor.constraint(equalTo: productBtnTitle.bottomAnchor, constant: 55).isActive = true
        stateBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        stateBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func handlestate(){
        
        let new = StateViewController()
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    
    
    //country
    
    
    lazy var countryBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "Country"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hanldecountry))
         nav.addGestureRecognizer(gesture)
        return nav
    }()
    
    func setupcountryBtntitle(){
        countryBtnTitle.centerXAnchor.constraint(equalTo: countryBtn.centerXAnchor).isActive = true
        countryBtnTitle.centerYAnchor.constraint(equalTo: countryBtn.bottomAnchor, constant: 15).isActive = true
        countryBtnTitle.widthAnchor.constraint(equalTo: countryBtnTitle.widthAnchor).isActive = true
        countryBtnTitle.heightAnchor.constraint(equalTo: countryBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var countryBtn: UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "country")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hanldecountry))
           btn.addGestureRecognizer(gesture)
        return btn
    }()
    
    func setcountryBtn(){
        countryBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryBtn.topAnchor.constraint(equalTo: priceBtnTitle.bottomAnchor, constant: 55).isActive = true
        countryBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countryBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func hanldecountry(){
        
        let new = CountryViewController()
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    // zipcode
    
    
    
    lazy var zipcodenBtnTitle: UILabel = {
        let nav = UILabel()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.text = "Zipcode"
        nav.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlezipcode))
           nav.addGestureRecognizer(gesture)
        return nav
    }()
    
    func setupzipcodeBtntitle(){
        zipcodenBtnTitle.centerXAnchor.constraint(equalTo: zipcodeBtn.centerXAnchor).isActive = true
        zipcodenBtnTitle.centerYAnchor.constraint(equalTo: zipcodeBtn.bottomAnchor, constant: 15).isActive = true
        zipcodenBtnTitle.widthAnchor.constraint(equalTo: zipcodenBtnTitle.widthAnchor).isActive = true
        zipcodenBtnTitle.heightAnchor.constraint(equalTo: zipcodenBtnTitle.heightAnchor).isActive = true
        
    }
    
    lazy var zipcodeBtn: UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "zipcode")
        btn.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlezipcode))
           btn.addGestureRecognizer(gesture)
        return btn
    }()
    
    func setzipcodeBtn(){
        zipcodeBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
        zipcodeBtn.topAnchor.constraint(equalTo: locationBtnTitle.bottomAnchor, constant: 55).isActive = true
        zipcodeBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        zipcodeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func handlezipcode(){
        
        let new = ZipcodeViewController()
        self.navigationController?.pushViewController(new, animated: true)
    }

}
