//
//  VendorMainViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/4/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class VendorMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

          view.backgroundColor = UIColor(hexString: "2E3B46")
        navigationItem.title = "Welcome Vendor"
        
        
        let profileImage = UIImage(named: "profile")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(handleSignout))
        
        view.backgroundColor = UIColor(hexString: "2E3B46")
       
        view.addSubview(displayName)
        setupDisplayName()
        view.addSubview(emailLabel)
        setupemailLabel()
        fetchUserDetails()
    }
    
    
    let displayName: UILabel = {
        let name = UILabel()
        name.text = ""
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = UIColor.white
        return name
    }()
    
    func setupDisplayName(){
        displayName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        displayName.widthAnchor.constraint(equalTo: displayName.widthAnchor).isActive = true
        displayName.heightAnchor.constraint(equalTo: displayName.heightAnchor).isActive = true
        
    }
    
    let emailLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = ""
        name.backgroundColor = UIColor.white
        return name
    }()
    
    func setupemailLabel(){
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 12).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: emailLabel.widthAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalTo: emailLabel.heightAnchor).isActive = true
        
    }
    
    
    func fetchUserDetails(){
        
        
        DispatchQueue.main.async {
            
            let main = MainViewController()
            if FIRAuth.auth()?.currentUser?.uid == nil{
                
                main.handleSignout()
                // perform(#selector(handleSignout), with: nil, afterDelay: 0)
            }else {
                
                let uid = FIRAuth.auth()?.currentUser?.uid
                FIRDatabase.database().reference().child("vendor_users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    if let dictionary = snapshot.value as? [String:Any]{
                        
                        self.displayName.text = dictionary["full_Name"] as? String
                        self.emailLabel.text = dictionary["email"] as? String
                    }
                }, withCancel: nil)
            }
        }
    }
    
    
    func handleSignout(){
        
        do {
            try FIRAuth.auth()?.signOut()
            
        } catch  let logoutError{
            print(logoutError)
        }
        let Controller = LoginViewController()
        self.present(Controller, animated: true, completion: nil)
        
    }
}
