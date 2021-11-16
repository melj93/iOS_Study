//
//  ViewController.swift
//  TableView_Practice
//
//  Created by samuel Jeong on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    let ara = ["a", "b", "c"]
    let star = UIImage(systemName: "star")
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ara.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        
        content.text = ara[indexPath.row]
        content.image = star
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}
