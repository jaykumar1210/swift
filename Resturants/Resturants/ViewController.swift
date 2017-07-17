//
//  ViewController.swift
//  Resturants
//
//  Created by jay patel on 2017-04-06.
//  Copyright © 2017 jay patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
   
    @IBOutlet weak var rating1: RatingControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rating1.rating = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "di":
            print(">>>>>>>>>>>>>>>>> Details1")
        case "List":
            print(">>>>>>>>>>>>>>>>> List")
        case "location":
            print(">>>>>>>>>>>>>>>>> MAp")
        case "rr":
            print(">>>>>>>>>>>>>>>>> details")
        default:
            print("Unknown")
        }
    }
    
    @IBAction func backToHome(unwindSegue: UIStoryboardSegue){
        print(">>>>>>>>>>>>>>>>> I'm back!!!")
    }
    

}

