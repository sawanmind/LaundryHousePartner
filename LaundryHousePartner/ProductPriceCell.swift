//
//  customCell.swift
//  LaundryHousePartner
//
//  Created by BBB Technology on 2/4/17.
//  Copyright © 2017 BBB Technology. All rights reserved.
//

import UIKit

class ProductPriceCell: UITableViewCell {
    
   
    
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
    
    
    
    
    let washNameLabel:UILabel = {
        let qt = UILabel()
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 16)
        qt.textColor = UIColor.black
        return qt
        
    }()
    
    
    let washpricePerPieces:UILabel = {
        let qt = UILabel()
        // qt.text = "20"
        qt.translatesAutoresizingMaskIntoConstraints = false
        qt.font = UIFont.boldSystemFont(ofSize: 12)
        qt.textColor = UIColor.black
        return qt
        
    }()
//    let pressNameLabel:UILabel = {
//        let qt = UILabel()
//        qt.translatesAutoresizingMaskIntoConstraints = false
//        qt.font = UIFont.boldSystemFont(ofSize: 16)
//        qt.textColor = UIColor.black
//        return qt
//        
//    }()
//    
//    
//    let presspricePerPieces:UILabel = {
//        let qt = UILabel()
//        // qt.text = "20"
//        qt.translatesAutoresizingMaskIntoConstraints = false
//        qt.font = UIFont.boldSystemFont(ofSize: 12)
//        qt.textColor = UIColor.black
//        return qt
//        
//    }()
//    
//    let wash_pressNameLabel:UILabel = {
//        let qt = UILabel()
//        qt.translatesAutoresizingMaskIntoConstraints = false
//        qt.font = UIFont.boldSystemFont(ofSize: 16)
//        qt.textColor = UIColor.black
//        return qt
//        
//    }()
//    
//    
//    let wash_presspricePerPieces:UILabel = {
//        let qt = UILabel()
//        // qt.text = "20"
//        qt.translatesAutoresizingMaskIntoConstraints = false
//        qt.font = UIFont.boldSystemFont(ofSize: 12)
//        qt.textColor = UIColor.black
//        return qt
//        
//    }()
//    
//    
    
    override init(style:UITableViewCellStyle, reuseIdentifier :String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(productNameLabel)
        addSubview(washNameLabel)
        addSubview(washpricePerPieces)
//        addSubview(pressNameLabel)
//        addSubview(presspricePerPieces)
//        addSubview(wash_pressNameLabel)
//        addSubview(wash_presspricePerPieces)
//        
//        
        
        
        // constraints
        
        
        
        productNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 11).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: (textLabel?.widthAnchor)!).isActive = true
        productNameLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
     
        washNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60).isActive = true
        washNameLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10).isActive = true
        washNameLabel.widthAnchor.constraint(equalTo: (detailTextLabel?.widthAnchor)!).isActive = true
        washNameLabel.heightAnchor.constraint(equalTo: (detailTextLabel?.heightAnchor)!).isActive = true
        
        
        
        washpricePerPieces.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        washpricePerPieces.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10).isActive = true
        washpricePerPieces.widthAnchor.constraint(equalTo: washpricePerPieces.widthAnchor).isActive = true
        washpricePerPieces.heightAnchor.constraint(equalTo: (washpricePerPieces.heightAnchor)).isActive = true
        
        
//        pressNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60).isActive = true
//        pressNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        pressNameLabel.widthAnchor.constraint(equalTo: (detailTextLabel?.widthAnchor)!).isActive = true
//        pressNameLabel.heightAnchor.constraint(equalTo: (detailTextLabel?.heightAnchor)!).isActive = true
//        
//        presspricePerPieces.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
//        presspricePerPieces.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        presspricePerPieces.widthAnchor.constraint(equalTo: presspricePerPieces.widthAnchor).isActive = true
//        presspricePerPieces.heightAnchor.constraint(equalTo: (presspricePerPieces.heightAnchor)).isActive = true
//        
//
//        wash_pressNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60).isActive = true
//        wash_pressNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        wash_pressNameLabel.widthAnchor.constraint(equalTo: (detailTextLabel?.widthAnchor)!).isActive = true
//        wash_pressNameLabel.heightAnchor.constraint(equalTo: (detailTextLabel?.heightAnchor)!).isActive = true
//        
//        wash_presspricePerPieces.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
//        wash_presspricePerPieces.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        wash_presspricePerPieces.widthAnchor.constraint(equalTo: wash_presspricePerPieces.widthAnchor).isActive = true
//        wash_presspricePerPieces.heightAnchor.constraint(equalTo: (wash_presspricePerPieces.heightAnchor)).isActive = true
//        

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
