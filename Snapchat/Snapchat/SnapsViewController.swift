//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by tessa on 6/27/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
