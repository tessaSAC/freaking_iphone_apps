//
//  CavyViewController.swift
//  Cavy Catcher
//
//  Created by tessa on 6/25/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class CavyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var cavyImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    // If `pig == nil` it's a new Pig
    var pig : Pig? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // imagePicker needs to know what to do with selected images
        imagePicker.delegate = self
        
        if pig != nil {
            cavyImageView.image = UIImage(data: pig!.image!)
            titleTextField.text = pig?.name
            
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
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
        if pig != nil {
            // Set these properties to whatever is in the fields
            pig!.name = titleTextField.text
            pig!.image = UIImagePNGRepresentation(cavyImageView.image!)
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let pig = Pig(context: context)
            pig.name = titleTextField.text
            // Because it's NSData(??????) need to convert the image
            pig.image = UIImagePNGRepresentation(cavyImageView.image!)
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Delete pig which we know exists because otherwise button would not be available
        context.delete(pig!)
        // Save context then pop top view
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
