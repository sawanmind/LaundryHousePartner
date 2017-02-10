//
//  customCell.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/4/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class DetailOrderCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(hexString: "2E3B46")
        selectionStyle = .none
        textLabel?.frame = CGRect(x: 70, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 70, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        
    }
    
    let productNameLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    let serviceTypeLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let customerNameLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let contactNumberLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let paymentModeLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let TotalCostLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    

 
    override init(style:UITableViewCellStyle, reuseIdentifier :String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(productNameLabel)
        addSubview(serviceTypeLabel)
        addSubview(customerNameLabel)
        addSubview(contactNumberLabel)
        addSubview(paymentModeLabel)
        addSubview(TotalCostLabel)
    
        
        // constraints
        
        
        productNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        productNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        productNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        serviceTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        serviceTypeLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        serviceTypeLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        serviceTypeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        customerNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        customerNameLabel.topAnchor.constraint(equalTo: serviceTypeLabel.bottomAnchor, constant: 5).isActive = true
        customerNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        customerNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        contactNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        contactNumberLabel.topAnchor.constraint(equalTo: customerNameLabel.bottomAnchor, constant: 5).isActive = true
        contactNumberLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        contactNumberLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        paymentModeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        paymentModeLabel.topAnchor.constraint(equalTo: contactNumberLabel.bottomAnchor, constant: 5).isActive = true
        paymentModeLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        paymentModeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        TotalCostLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        TotalCostLabel.topAnchor.constraint(equalTo: paymentModeLabel.bottomAnchor, constant: 5).isActive = true
        TotalCostLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        TotalCostLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        


              
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
