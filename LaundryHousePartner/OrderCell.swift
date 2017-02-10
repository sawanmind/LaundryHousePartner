//
//  customCell.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/4/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(hexString: "2E3B46")
        selectionStyle = .gray
        textLabel?.frame = CGRect(x: 70, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 70, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        
    }
    

    
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


    
    
    
    override init(style:UITableViewCellStyle, reuseIdentifier :String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(customerNameLabel)
        addSubview(serviceTypeLabel)
      
       
        
        
        
        // constraints
        
        customerNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        customerNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        customerNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        customerNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        
     
        serviceTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        serviceTypeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-5).isActive = true
        serviceTypeLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        serviceTypeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
   
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
