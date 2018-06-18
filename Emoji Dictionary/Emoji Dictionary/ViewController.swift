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
    
    var emojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set size and content of `emojiList` tableView
        emojiList.dataSource = self
        emojiList.delegate = self
        emojis = makeEmojiArray()
    }
    
    // Determine number of rows
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return emojis.count
    }
    
    // Determine emoji displayed in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // indexPath.row is the current index
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.emojiStr
        
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
        defVC.emoji = sender as! Emoji
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeEmojiArray() -> [Emoji] {
        let emoji1 = Emoji()
        emoji1.emojiStr = "😿"
        emoji1.birthYear = 1997
        emoji1.category = "evil"
        emoji1.definition = "an evil creature"
        
        let emoji2 = Emoji()
        emoji2.emojiStr = "💩"
        emoji2.birthYear = 2020
        emoji2.category = "desserts"
        emoji2.definition = "a delicious food"
        
        let emoji3 = Emoji()
        emoji3.emojiStr = "🎂"
        emoji3.birthYear = 2999
        emoji3.category = "pranx"
        emoji3.definition = "a foul joke"
        
        let emoji4 = Emoji()
        emoji4.emojiStr = "💀"
        emoji4.birthYear = 3018
        emoji4.category = "soothsaying"
        emoji4.definition = "your future"
        
        let emoji5 = Emoji()
        emoji5.emojiStr = "😑"
        emoji5.birthYear = 1887
        emoji5.category = "my soul"
        emoji5.definition = "all my feels"
        
        return [emoji1, emoji2, emoji3, emoji4, emoji5]
    }


}

