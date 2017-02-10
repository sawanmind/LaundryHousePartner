//
//  vendorListCustomCell.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/6/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//


import UIKit

class vendorListCustomCell: UITableViewCell {
    
  
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor(hexString: "2E3B46")
        selectionStyle = .none
        textLabel?.frame = CGRect(x: 70, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 70, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        
    }
    
    
    
    let vendorNameLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let vendorEmailLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 12)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    
    
    override init(style:UITableViewCellStyle, reuseIdentifier :String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(vendorNameLabel)
        addSubview(vendorEmailLabel)
        
        
        
        
        // constraints
        
        
        
        vendorNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        vendorNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        vendorNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        vendorNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        
        
        vendorEmailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        vendorEmailLabel.topAnchor.constraint(equalTo: vendorNameLabel.bottomAnchor, constant: 5).isActive = true
        vendorEmailLabel.widthAnchor.constraint(equalTo: (detailTextLabel?.widthAnchor)!).isActive = true
        vendorEmailLabel.heightAnchor.constraint(equalTo: (detailTextLabel?.heightAnchor)!).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
