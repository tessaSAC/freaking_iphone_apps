//
//  LoginViewController.swift
//  Snapchat
//
//  Created by tessa on 6/25/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func getLitTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!,  password: passwordTextField.text!) {
            (user, error) in
            print("We tried to sign in")
            
            if error != nil {
                print("error!")
            } else {
                print("sign in")
            }
        }
    }
    

}

