//
//  ViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

class ViewController: UIViewController, sendBackDelegate {
    
    @IBOutlet weak var textShowHere: UILabel!
    @IBOutlet weak var firstWish: UILabel!
    @IBOutlet weak var secondWish: UILabel!
    @IBOutlet weak var thirdWish: UILabel!
    
    var wish1 = Wish.wishList[0]
    var wish2 = Wish.wishList[1]
    
    override func viewDidLoad() {
        textShowHere.text = "Wish List"
        showWishes() // 미리 저장된 text를 보여주기.
        
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
    
    func showWishes() {
        firstWish.text = Wish.wishList[0].name
        secondWish.text = Wish.wishList[1].name
        thirdWish.text = Wish.wishList[2].name
    }
    
    func wishEdit(data: Wish) {
        print(wish1) // secondVC로 부터 밭은 editedWish
    }
}

