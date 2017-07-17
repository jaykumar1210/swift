//
//  home.swift
//  Resturants
//
//  Created by Macstudent on 2017-04-06.
//  Copyright © 2017 jay patel. All rights reserved.
//

import UIKit
class home: UIViewController{
    
    @IBOutlet weak var ratingtotal: RatingControl!
    
    @IBOutlet weak var rating2: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ratingtotal.rating = 4
        rating2.rating = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
