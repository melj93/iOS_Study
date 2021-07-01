//
//  SecondViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

protocol sendBackDelegate {
    func dataReceived(data: String)
    func wishEdit(data: Wish)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textFieldPost: UITextField!
    
    var delegate: sendBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Action
    @IBAction func onDone(_ sender: Any) {
        delegate?.dataReceived(data: textFieldPost.text!) // 텍스트 필드에 있는 텍스트를 data로
        print("SecondVC text: \(textFieldPost.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
