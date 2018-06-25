//
//  CreateTaskViewController.swift
//  Do It
//
//  Created by tessa on 6/17/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantToggle: UISwitch!
    
    // var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Tap into App Delegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create task from outlet information
        let task = Task(context: context)  // This is the view into the database
        
        if taskNameTextField != nil {
            task.name = taskNameTextField.text!
        }
        task.important = importantToggle.isOn
        
        // Save to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Add new task to array in previous ViewController
        // previousVC.tasks.append(task)
        
        // Update tasks view
        // previousVC.todoTableView.reloadData()
        
        // Navigate to tasks view
        navigationController!.popViewController(animated: true)
    }
    
}
