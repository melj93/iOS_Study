//
//  WeatherManager.swift
//  myClima
//
//  Created by samuel Jeong on 2021/07/30.
//

import Foundation

struct WeatherManager {
    var url =  "https://api.openweathermap.org/data/2.5/weather?appid=401b3ad481276de0f16f0f138ce977b6&units=metric"
    
    func fetchURL(cityName: String){
        let urlString = url + "&q=" + cityName
        print(urlString)
        
        performRequest(urlString: urlString)
    } // 마법 주문을 외우기
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }// 자연의 기를 받기
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
            print(decodedData.weather[0].id)
            
            let id = decodedData.weather[0].id
            print(getConditionId(weatherId: id))
            
        } catch{
            print(error)
        }
    }// 기를 자신의 것으로 만들기
    
    func getConditionId(weatherId: Int) -> String {
        switch weatherId {
        case 200 ... 299:
            return "cloud.bolt"
        case 300 ... 399:
            return "cloud.drizzle"
        case 500 ... 599:
            return "cloud.rain"
        case 600 ... 699:
            return "cloud.snow"
        case 700 ... 799:
            return "cloud.fog"
        case 800 ... 804:
            return "cloud"
        default:
            return "sun.max"
        }
    }
}

