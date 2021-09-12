//
//  ChatViewController.swift
//  FlashChat-mel
//
//  Created by samuel Jeong on 2021/08/12.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let message: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "sam@gmail.com", body: "Hello!"),
        Message(sender: "1@2.com", body: "What's up?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        chatTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    @IBAction func sendBtnPressed(_ sender: UIButton) {
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = message[indexPath.row].body
        return cell
    }
}

