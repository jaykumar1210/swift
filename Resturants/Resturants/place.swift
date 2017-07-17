//
//  findus.swift
//  Resturants
//
//  Created by jay patel on 2017-04-07.
//  Copyright © 2017 jay patel. All rights reserved.
//

import Foundation

class place{
    public private(set) var placeName    : String
    public private(set) var address   : String
    public private(set) var latitude       : Double
    public private(set) var longitude      : Double
    
    init(name: String, address: String, latitude: Double, longitude: Double){
        self.placeName = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
