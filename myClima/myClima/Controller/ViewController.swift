//
//  ViewController.swift
//  myClima
//
//  Created by samuel Jeong on 2021/07/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        // ask for user location use permission
        
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        searchTextField.placeholder = "도시 이름을 적으세요."
        searchTextField.autocapitalizationType = UITextAutocapitalizationType.words
        searchTextField.returnKeyType = UIReturnKeyType.go
    }
}

//MARK:- UITextFieldDelegate
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
            textField.placeholder = "Plz input City name" // 1. 필드가 비워졌다면 적으라는 문구를 보이고 stop
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchURL(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate{
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather.temperatureString)
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.weatherImageView.image = UIImage(systemName: weather.conditionName)
            print(weather.conditionName)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            print(lat)
            print(lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

