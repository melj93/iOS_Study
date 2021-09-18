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
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        message = []
        
        // .getDocuments: Firebase 데이터베이스 안에 있는 데이터를 가져온다. 자동완성 (completion)에서 Enter
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from FireStore. \(e)")
            }else  {
                //querySnapshot 에대한 이해 QueryDocumentSnapshot: The document is guaranteed to exist and its data can be extracted with the data property or by using subscript syntax to access a specific field.
                //자세한 내용은 https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/QueryDocumentSnapshot
                querySnapshot?.documents[0].data()[K.FStore.senderField]
                //documents 의 첫번째 배열에 있는 데이터, 그리고 그 배열의 키값으로 참조
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) { (error) in
                if let e = error {
                    print("There was an issue in saving data to Firestore, \(e)")
                }else {
                    print("Successfully saved data.")
                }
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message[indexPath.row].body
        return cell
    }
}

