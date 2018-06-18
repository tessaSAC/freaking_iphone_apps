//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by tessa on 6/17/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var emojiList: UITableView!
    
    var emojis = ["😿", "💩", "🎂", "💀", "😑"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set size and content of `emojiList` tableView
        emojiList.dataSource = self
        emojiList.delegate = self
    }
    
    // Determine number of rows
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return emojis.count
    }
    
    // Determine text inside each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // indexPath.row is the current index
        cell.textLabel?.text = emojis[indexPath.row]
        
        return cell
    }
    
    // Navigate to single cell view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Don't keep previous selection selected
        tableView.deselectRow(at: indexPath, animated: true)
        
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier:"moveSegue", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

