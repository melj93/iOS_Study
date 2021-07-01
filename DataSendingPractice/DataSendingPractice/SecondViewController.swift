//
//  SecondViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

protocol sendBackDelegate {
    func wishEdit(data: Wish)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var editWishTextField: UITextField!
    
    var edittedWish: Wish?
    var delegate: sendBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editWishTextField.delegate = self
    }
    
    // Action
    @IBAction func onDone(_ sender: Any) {
        delegate?.wishEdit(data: edittedWish!) // 텍스트 필드에 있는 텍스트를 data로 edittedWish보내기
        print("SecondVC text: \(editWishTextField.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // TF funcs
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // return, Go 버튼을 누를시 발동
        editWishTextField.endEditing(true)
        print(editWishTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if editWishTextField.text != "" {   //빈 텍스트가 아니라면 실행하지않음
            return true
        }else {
            editWishTextField.placeholder = "Type something" // 빈 텍스트라면 텍스트를 보여줌.
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { // textfiled.endEditing(true)시 발동
        editWishTextField.text = ""
    }
}
