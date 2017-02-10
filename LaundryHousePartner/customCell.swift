//
//  customCell.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/4/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

  //  var pricePerPieceArray:Array = ["20","30","50"]
    
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
    
    
    let pricePerPieces:UILabel = {
        let qt = UILabel()
       // qt.text = "20"
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 12)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    
  
    override init(style:UITableViewCellStyle, reuseIdentifier :String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(productNameLabel)
        addSubview(pricePerPieces)
        
        
        
        
        // constraints
        
        
        
        productNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        productNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        productNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        
        
        pricePerPieces.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        pricePerPieces.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pricePerPieces.widthAnchor.constraint(equalTo: pricePerPieces.widthAnchor).isActive = true
        pricePerPieces.heightAnchor.constraint(equalTo: (pricePerPieces.heightAnchor)).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
