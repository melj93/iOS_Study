//
//  ViewController.swift
//  myClima
//
//  Created by samuel Jeong on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        searchTextField.placeholder = "도시 이름을 적으세요."
        searchTextField.autocapitalizationType = UITextAutocapitalizationType.words
        searchTextField.returnKeyType = UIReturnKeyType.go
    }
}

extension ViewController: UITextFieldDelegate {
    //돋보기 아이콘을 눌렀을 때
    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    //go버튼을 눌렀을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) //자판 닫기
        return true
    }
    
    //사용자가 수정을 완료하기 전에
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { // 2. 아니면 진행
            return true
        }else {
            textField.placeholder = "적으세요!!" // 1. 필드가 비워졌다면 적으라는 문구를 보이고 stop
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        cityNameLabel.text = "changed"
        if let city = searchTextField.text {
            weatherManager.fetchURL(cityName: city)
        }
        
        //city name send to weather api
    }
}
