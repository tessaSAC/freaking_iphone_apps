//
//  ViewController.swift
//  Cavy Catcher
//
//  Created by tessa on 6/25/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var piggies : [Pig] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            piggies = try context.fetch(Pig.fetchRequest())
            tableView.reloadData()
        } catch {
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return piggies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let pig = piggies[indexPath.row]
        
        cell.textLabel?.text = pig.name
        // Need to convert back from "NSData"
        cell.imageView?.image = UIImage(data: pig.image as! Data)  // needs to be NSData
        
        return cell
    }
}

