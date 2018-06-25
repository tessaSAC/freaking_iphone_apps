//
//  CompleteTaskViewController.swift
//  Do It
//
//  Created by tessa on 6/24/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
//    var task = Task()  // cannot do this with Core Data
    
    var task : Task? = nil
    
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Remove completed task
//        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        
        // Update tasks view
//        previousVC.todoTableView.reloadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)  // Delete task from Core Data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()  // Save that we deleted the task
        
        // Navigate to tasks view
        navigationController!.popViewController(animated: true)
    }

}
