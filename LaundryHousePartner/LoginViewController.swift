//
//  LoginViewController.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/2/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class LoginViewController: UIViewController {
    let BGinputsContainerViewForLogin: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    let inputsContainerViewForLogin: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let BGinputsContainerViewForRegister: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    let inputsContainerViewForRegister: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hexString: "#242f38")
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 2
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    func handleLogin(){
        
        SVProgressHUD.show(withStatus: "Please wait...")
        
        DispatchQueue.main.async {
            let firebaseAuth = FIRAuth.auth()
            guard let email =  self.emailTextField.text , let password = self.passwordTextField.text   else{
                return
            }
            
            firebaseAuth?.signIn(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
                if error != nil{
                    self.view.makeToast((error?.localizedDescription)!)
                    SVProgressHUD.dismiss()
                    
                    return
                }
                
                SVProgressHUD.dismiss(completion: { 
                    if self.emailTextField.text == email{
                        let new = UINavigationController(rootViewController: MainViewController())
                        self.present(new, animated: true, completion: nil)
                    } else{
                        let new = UINavigationController(rootViewController: VendorMainViewController())
                        self.present(new, animated: true, completion: nil)
                    }
                })
                
            })
            
        }
        
        
    
    
    }
    
    lazy var RegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hexString: "#242f38")
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 2
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    func handleRegister(){
        SVProgressHUD.show(withStatus: "Please wait...")
        DispatchQueue.main.async {
            let firebaseAuth = FIRAuth.auth()
            guard let email = self.emailTextField.text , let password = self.passwordTextField.text , let fullName = self.nameTextField.text  else {
                return
            }
            firebaseAuth?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
                if error != nil{
                    self.view.makeToast((error?.localizedDescription)!)
                    SVProgressHUD.dismiss()
                    return
                }
                guard let uid = user?.uid else {
                    return
                }
                
                
                let DBRef = FIRDatabase.database().reference()
                let usersRef = DBRef.child("vendor_users").child(uid)
                let values = ["full_Name": fullName, "email": email]
                usersRef.updateChildValues(values, withCompletionBlock: { (error, DBRef) in
                    if error != nil {
                        self.view.makeToast((error?.localizedDescription)!)
                        
                        return
                    }
                    SVProgressHUD.dismiss()
                    let new = UINavigationController(rootViewController: VendorMainViewController())
                    self.present(new, animated: true, completion: nil)
                })
            })
            
        }

        
    }

    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
       // tf.backgroundColor = UIColor.red
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
       // tf.backgroundColor = UIColor.red
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry   = true
      return tf
    }()
    
   
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    
    func handleLoginRegisterChange() {
        
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0{
            a()
            BGinputsContainerViewForRegister.isHidden = true
            BGinputsContainerViewForLogin.isHidden = false
            
        }else{
            b()
            BGinputsContainerViewForRegister.isHidden = false
            BGinputsContainerViewForLogin.isHidden = true
            
           
        }

    }
    
    
    func a(){
        
        view.addSubview(BGinputsContainerViewForLogin)
        setupBGInputContainerForLogin()
       
        
    }
    
    func b(){
        
        
        view.addSubview(BGinputsContainerViewForRegister)
        setupBGInputsContainerForRegister()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        a()
        view.backgroundColor = UIColor(hexString: "2E3B46")
       
        
        view.addSubview(loginRegisterSegmentedControl)
        setupLoginRegisterSegmentedControl()
        
        
    }
    
    func setupLoginRegisterSegmentedControl() {
        //need x, y, width, height constraints
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0{
            
            loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: BGinputsContainerViewForLogin.topAnchor, constant: -32).isActive = true
            loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: BGinputsContainerViewForLogin.widthAnchor, multiplier: 1).isActive = true
            
        }else if loginRegisterSegmentedControl.selectedSegmentIndex == 1{
            
            loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: BGinputsContainerViewForRegister.topAnchor, constant: -32).isActive = true
            loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: BGinputsContainerViewForRegister.widthAnchor, multiplier: 1).isActive = true
            return
        }
    }
    
    
    
   

    
    
    func setupBGInputContainerForLogin(){
         BGinputsContainerViewForLogin.addSubview(inputsContainerViewForLogin)
     
        BGinputsContainerViewForLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        BGinputsContainerViewForLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        BGinputsContainerViewForLogin.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        BGinputsContainerViewForLogin.heightAnchor.constraint(equalToConstant: 162).isActive = true
       
        
        inputsContainerViewForLogin.centerXAnchor.constraint(equalTo: BGinputsContainerViewForLogin.centerXAnchor).isActive = true
        inputsContainerViewForLogin.topAnchor.constraint(equalTo: BGinputsContainerViewForLogin.topAnchor).isActive = true
        inputsContainerViewForLogin.widthAnchor.constraint(equalTo: BGinputsContainerViewForLogin.widthAnchor).isActive = true
        inputsContainerViewForLogin.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        inputsContainerViewForLogin.addSubview(emailTextField)
        inputsContainerViewForLogin.addSubview(emailSeparatorView)
        inputsContainerViewForLogin.addSubview(passwordTextField)
        BGinputsContainerViewForLogin.addSubview(loginButton)
        
              //need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerViewForLogin.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerViewForLogin.topAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerViewForLogin.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerViewForLogin.heightAnchor, multiplier: 1/2).isActive = true
        
        
        
        //need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerViewForLogin.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerViewForLogin.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerViewForLogin.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerViewForLogin.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerViewForLogin.heightAnchor, multiplier: 1/2).isActive = true
        
        
        
        loginButton.centerXAnchor.constraint(equalTo: BGinputsContainerViewForLogin.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: BGinputsContainerViewForLogin.bottomAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: BGinputsContainerViewForLogin.widthAnchor).isActive = true
        

       
    }
    
    
    
    func setupBGInputsContainerForRegister() {
        
         BGinputsContainerViewForRegister.addSubview(inputsContainerViewForRegister)
        //need x, y, width, height constraints
        BGinputsContainerViewForRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        BGinputsContainerViewForRegister.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        BGinputsContainerViewForRegister.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        BGinputsContainerViewForRegister.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        
        inputsContainerViewForRegister.centerXAnchor.constraint(equalTo: BGinputsContainerViewForRegister.centerXAnchor).isActive = true
        inputsContainerViewForRegister.topAnchor.constraint(equalTo: BGinputsContainerViewForRegister.topAnchor).isActive = true
        inputsContainerViewForRegister.widthAnchor.constraint(equalTo: BGinputsContainerViewForRegister.widthAnchor).isActive = true
        inputsContainerViewForRegister.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        inputsContainerViewForRegister.addSubview(nameTextField)
        inputsContainerViewForRegister.addSubview(nameSeparatorView)
        inputsContainerViewForRegister.addSubview(emailTextField)
        inputsContainerViewForRegister.addSubview(emailSeparatorView)
        inputsContainerViewForRegister.addSubview(passwordTextField)
        BGinputsContainerViewForRegister.addSubview(RegisterButton)
        
        //need x, y, width, height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerViewForRegister.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerViewForRegister.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerViewForRegister.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerViewForRegister.heightAnchor, multiplier: 1/3).isActive = true
        //need x, y, width, height constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerViewForRegister.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerViewForRegister.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerViewForRegister.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerViewForRegister.widthAnchor).isActive
            
            = true
       emailTextField.heightAnchor.constraint(equalTo: inputsContainerViewForRegister.heightAnchor, multiplier: 1/3).isActive = true
        
        //need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerViewForRegister.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerViewForRegister.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerViewForRegister.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerViewForRegister.widthAnchor).isActive = true
          passwordTextField.heightAnchor.constraint(equalTo: inputsContainerViewForRegister.heightAnchor, multiplier: 1/3).isActive = true
        
        
        RegisterButton.centerXAnchor.constraint(equalTo: BGinputsContainerViewForRegister.centerXAnchor).isActive = true
        
        RegisterButton.bottomAnchor.constraint(equalTo: BGinputsContainerViewForRegister.bottomAnchor).isActive = true
        RegisterButton.widthAnchor.constraint(equalTo: BGinputsContainerViewForRegister.widthAnchor).isActive = true
        RegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    

   
}


