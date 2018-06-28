//
//  PictureViewController.swift
//  Snapchat
//
//  Created by tessa on 6/27/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    // Also need it as outlet so they can't tap next without filling out all fields
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        // Specify image source
        imagePicker.sourceType = .savedPhotosAlbum // eventually this should be changed to .camera
        // Disallow editing
        imagePicker.allowsEditing = false
        // Show imagePicker
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        // Don't let them keep tapping the "next" button
        nextButton.isEnabled = false
        
        let imagesFolder = Storage.storage().reference().child("images")  // name of folder
        
        // Compress image
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        // Unique generated number
        let imageId = NSUUID().uuidString
        
        // .putData = names file
        imagesFolder.child("\(imageId).jpeg").putData(imageData, metadata: nil, completion: { (metadata, error) in
            print("We tried to upload!")
            
            if error != nil {
                print("We had an error: \(error!)")
            } else {
                print(Storage.storage().reference().child("images/\(imageId).jpeg").fullPath)
                
                // Only go to next view if we succeed
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
