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
        
        performRequest()
    }
    
    func performRequest() {
        
    }
}
