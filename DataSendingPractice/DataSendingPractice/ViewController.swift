//
//  ViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    var text: String = "I'd like to eat a Sandwich"
    
    @IBOutlet weak var textShowHere: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textShowHere.text = text
    }

    @IBAction func onAdd(_ sender: Any) {
    }
    
}

