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
    @IBOutlet weak var writeWishHere: UITextField!
    
    var someWish = Wish.wishList[0]
    
    override func viewDidLoad() {
        textShowHere.text = "Recieved Text"
        storedText.text = someWish.name
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
        textShowHere.text = data // secondVC로 부터 typing 밭은 
        print(textShowHere.text!)
    }
    func wishEdit(data: Wish) {
        print(someWish) // secondVC로 부터 밭은 editedWish
    }
}

