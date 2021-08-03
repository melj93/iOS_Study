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
    }
    
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
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(cityName: name, temperature: temp, weatherId: id)
            
            print(weather)
            print(weather.conditionName)
        } catch{
            print(error)
        }
    }
}

