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
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var emojiDefinition: UILabel!
    
    var emoji = Emoji()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emojiDetail.text = emoji.emojiStr
        birthYearLabel.text = "Birth year: \(emoji.birthYear)"
        categoryLabel.text = "Category: \(emoji.category)"
        emojiDefinition.text = emoji.definition
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
