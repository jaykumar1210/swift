//
//  feedback.swift
//  tableview
//
//  Created by jay patel on 2017-04-08.
//
//

import UIKit
import os.log

class feedback: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var restname: UITextField!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var custname: UITextField!
   
    
    @IBOutlet weak var restimg: UIImageView!
  
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var feedbakd :feedbakdata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restname.delegate = self
        comment.delegate = self
        custname.delegate = self
        
        // Setting the text view's border
        self.comment.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor;
        self.comment.layer.borderWidth = 1.0;
        self.comment.layer.cornerRadius = 8;
        
        updateSaveButtonState()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectimg(_ sender: UITapGestureRecognizer)
    {
    
       
        print(">>>>>>>>>>> selectImageFromPhotoLibrary")
        // Hide the keyboard.
        restname.resignFirstResponder()
        comment.resignFirstResponder()
        custname.resignFirstResponder()
        
        //Creating the image picker controller
        let imagePickerController = UIImagePickerController()
        
        // Defining the source of the images: the photo library
        imagePickerController.sourceType = .photoLibrary
        
        // Notify the ViewController when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    //MARK: Text Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text!
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        if textField === restname {
            saveButton.isEnabled = false
        }
    }
    
    // MARK: Image View Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Takes the original image
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // Set photoImageView to display the selected image.
            restimg.image = selectedImage
            
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)
            
        }else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        if let button = sender as? UIBarButtonItem {
            if (button === saveButton){
                // retrieving the screen data
                let name = restname.text
                let image = restimg.image
                let comment1 = comment.text
               let custname1 = custname.text
                
                //testing if the restaurant's name and ratings are not nil
                if (!(name?.isEmpty)!) {
                    feedbakd = feedbakdata(name: name!, image: image, comment: comment1!, custname: custname1!)
                } else {
                    // print the message on debug log
                    os_log(" empty feedback", log: OSLog.default, type: .debug)
                }
            }
        } else {
            print("Error")
        }
    }
    
    @IBAction func backToRestaurant(unwindSegue: UIStoryboardSegue){
        print(">>>>>>>>>>>>>>>>> I'm back!!!")
    }
    
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        if let text = restname.text {
            saveButton.isEnabled = !text.isEmpty
        }
    }
    
}



