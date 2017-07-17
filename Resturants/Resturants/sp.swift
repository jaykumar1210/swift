//
//  sp.swift
//  Resturants
//
//  Created by Macstudent on 2017-04-07.
//  Copyright © 2017 jay patel. All rights reserved.
//
import UIKit
class sp: UIViewController{
    
    
    
    @IBOutlet weak var ratingttl: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ratingttl.rating = 3
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
