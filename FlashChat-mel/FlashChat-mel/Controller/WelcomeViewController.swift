//
//  ViewController.swift
//  FlashChat-mel
//
//  Created by samuel Jeong on 2021/08/12.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Typing animation in viewDidLoad() Using for loop
        var charIndex = 0.0
        titleLabel.text = ""
        let title = "⚡️FlashChat"
        for letter in title {
            print(0.1 * charIndex)
            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }
    
    @IBAction func registerPressed(_ sender: Any) {
    }
    @IBAction func logInPressed(_ sender: Any) {
        
    }
}

