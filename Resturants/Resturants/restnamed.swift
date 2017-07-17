//
//  restnamed.swift
//  Resturants
//
//  Created by jay patel on 2017-04-06.
//  Copyright © 2017 jay patel. All rights reserved.
//


import UIKit

class restnamed {
    
    var name: String
       var image: UIImage
    
    init(name: String!,  image: UIImage!) {
        self.name = name
        self.image = image
       
    }
    public func setname(name: String!){
        if (name.isEmpty){
        self.name = ""}
        else{
        self.name = name}
    }
    public func setimg (image: UIImage!){
    self.image = image}
}
