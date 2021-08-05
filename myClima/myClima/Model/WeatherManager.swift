//
//  WeatherManager.swift
//  myClima
//
//  Created by samuel Jeong on 2021/07/30.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    var url =  "https://api.openweathermap.org/data/2.5/weather?appid=401b3ad481276de0f16f0f138ce977b6&units=metric"
    
    
    func fetchURL(cityName: String){
        let urlString = url + "&q=" + cityName
        print(urlString)
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            print(id)
            
            let weather = WeatherModel(cityName: name, temperature: temp, weatherId: id)
            return weather
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

