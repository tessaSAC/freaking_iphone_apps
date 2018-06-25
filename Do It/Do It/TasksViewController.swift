//
//  TasksViewController.swift
//  Do It
//
//  Created by tessa on 6/17/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var todoTableView: UITableView!
    
    var tasks : [Task] = []
    
//    var selectedIndex = 0
    
    // This only shows once on instantiation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    
    // Called every time view controller is about to show
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        todoTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
//        selectedIndex = indexPath.row
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"  // Core data attributes give back optionals
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        // Get data from core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // run entity's fetchRequest method
        do {
            // `throws` means this method can throw
            tasks = try context.fetch(Task.fetchRequest()) as! [Task] // an array of Task objects
        } catch {
            print("Oops we have an error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addSegue" {
//            // Grab a reference to the next VC
//            let nextVC = segue.destination as! CreateTaskViewController
//
//            // assign this VC as CreateTaskVC's previous view
//            nextVC.previousVC = self
//        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
//            nextVC.previousVC = self
        }
    }
    
}

