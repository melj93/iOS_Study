//
//  LoginViewController.swift
//  FlashChat-mel
//
//  Created by samuel Jeong on 2021/08/12.
//

import UIKit
import Firebase

class LogInViewContoller: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passworldTextField: UITextField!
    
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passworldTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    //Errror 발생시 안내 팝업
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                    alert.addAction(defaultAction)
                    
                    self.present(alert, animated: false, completion: nil)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
