//
//  ViewController.swift
//  DataSendingPractice
//
//  Created by samuel Jeong on 2021/06/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, sendBackDelegate {
    
    @IBOutlet weak var textShowHere: UILabel!
    @IBOutlet weak var firstWish: UILabel!
    @IBOutlet weak var secondWish: UILabel!
    @IBOutlet weak var thirdWish: UILabel!
    @IBOutlet weak var fourWish: UILabel!
    @IBOutlet weak var fiveWish: UILabel!
    
    @IBOutlet weak var writeWishHere: UITextField!
    
    var wish1 = Wish.wishList[0]
    var wish2 = Wish.wishList[1]
    
    override func viewDidLoad() {
        textShowHere.text = "Wish List"
        showWishes() // 미리 저장된 text를 보여주기.
        
        writeWishHere.delegate = self
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        writeWishHere.endEditing(true)
        wish1.name = writeWishHere.text! // 입력받은 text를 someWish 이름에 저장.
        //Wish.addSomeWishToWishList()
        Wish.wishList.append(wish1)
        print(Wish.wishList)
        //Wish.wishList[0].name = someWish.name 이걸 secondView에서 해야지.
        return true
    }
    
    func wishEdit(data: Wish) {
        print(wish1) // secondVC로 부터 밭은 editedWish
    }
}

