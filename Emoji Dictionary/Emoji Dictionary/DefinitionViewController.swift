//
//  DefinitionViewController.swift
//  Emoji Dictionary
//
//  Created by tessa on 6/17/18.
//  Copyright © 2018 tessa. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var emojiDetail: UILabel!
    @IBOutlet weak var emojiDefinition: UILabel!
    
    var emoji = "NO EMOJI"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emojiDetail.text = emoji
        
        if emoji == "😿" { emojiDefinition.text = "an evil creature" }
        if emoji == "💩" { emojiDefinition.text = "a delicious food" }
        if emoji == "🎂" { emojiDefinition.text = "a foul joke" }
        if emoji == "💀" { emojiDefinition.text = "your future" }
        if emoji == "😑" { emojiDefinition.text = "all my feels" }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
