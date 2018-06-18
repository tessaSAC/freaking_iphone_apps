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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: Any?)
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "mow lawn"
        task1.important = true
        
        let task2 = Task()
        task2.name = "buy cheese"
        
        let task3 = Task()
        task3.name = "buy dog"
        task3.important = true
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            // Grab a reference to the next VC
            let nextVC = segue.destination as! CreateTaskViewController
            
            // assign this VC as CreateTaskVC's previous view
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            
        }
    }
    
}

