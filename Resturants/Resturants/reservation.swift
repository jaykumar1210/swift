//
//  reservation.swift
//  Resturants
//
//  Created by Macstudent on 2017-04-06.
//  Copyright © 2017 jay patel. All rights reserved.
//

import UIKit
class reservation : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
        
        //MARK: Properties
    
        
        
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtsddress: UITextField!
    @IBOutlet weak var txtnum: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txttable: UITextField!
    @IBOutlet weak var txttime: UITextField!
    
    
    @IBOutlet weak var confm: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set this class as the responsible by the response to user interaction with the text field
            txtname.delegate = self
            txtsddress.delegate = self
            txtnum.delegate = self
            txtemail.delegate = self
            txttable.delegate = self
            txttime.delegate = self
           
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    //MARK: Text Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    // Dismiss the text view keyboard, when the user types "Done"
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"  // Recognizes enter key in keyboard
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    private func confirmbutton()
    {
        // Disable the Save button if the text field is empty.
        if let text = txtname.text  {
            confm.isEnabled = !text.isEmpty
        }
    }
}
