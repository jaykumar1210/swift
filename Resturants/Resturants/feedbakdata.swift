//
//  feedbakdata.swift
//  tableview
//
//  Created by jay patel on 2017-04-08.
//
//

import UIKit
class feedbakdata {
    
    public private (set) var name: String
    public private (set) var image: UIImage!
    public private (set) var comment: String!
    public private (set) var custname: String
    
    init(name: String, image: UIImage!, comment: String!,custname: String) {
        self.name = name
        self.comment = comment
        self.image = image
        self.custname = custname
        
    }
    public func setname(name: String){
        if (name.isEmpty){
            self.name = ""
        }else{
            self.name = name
        }
    }
    public func setimage (image: UIImage!){
        self.image = image
    }
    public func setcomment(comment: String!){
        self.comment = comment
    }
    public func setcustname(custname: String){
        self.custname = custname
    }
    
}
