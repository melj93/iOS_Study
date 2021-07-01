//
//  ViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

class ViewController: UIViewController, sendBackDelegate {
    
    @IBOutlet weak var textShowHere: UILabel!
    @IBOutlet weak var storedText: UILabel!
    
    var wish = Wish.wishList[0]
    
    override func viewDidLoad() {
        textShowHere.text = "Recieved Text"
        storedText.text = wish.name
        super.viewDidLoad()
    }

    @IBAction func onAdd(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC" {
            let nav = segue.destination as! UINavigationController
            let secondVC = nav.topViewController as! SecondViewController
            secondVC.delegate = self
        }
    }
    func dataReceived(data: String) {
        textShowHere.text = data
        print(textShowHere.text!)
    }
}

