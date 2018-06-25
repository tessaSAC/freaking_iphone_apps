//
//  CavyViewController.swift
//  Cavy Catcher
//
//  Created by tessa on 6/25/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class CavyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cavyImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // imagePicker needs to know what to do with selected images
        imagePicker.delegate = self
    }

    @IBAction func photosTapped(_ sender: Any) {
        // imagePicker gets existing photos
        imagePicker.sourceType = .photoLibrary
        
        // Allows imagePicker to show an image picker
        present(imagePicker, animated: true, completion: nil)  // completion: what code to run after image picked
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Take image user picked:
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Show image user picked
        cavyImageView.image = image
        
        // Need to dismiss imagePicker
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: AnyObject) {
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let pig = Pig(context: context)
        pig.name = titleTextField.text
        // Because it's NSData(??????) need to convert the image
        pig.image = UIImagePNGRepresentation(cavyImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
