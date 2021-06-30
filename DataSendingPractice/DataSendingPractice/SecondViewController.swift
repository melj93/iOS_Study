//
//  SecondViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldPost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVC" {
            let vc = segue.destination as? ViewController
            vc?.text = textFieldPost.text ?? "empty"
        }
    }
    @IBAction func onDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
