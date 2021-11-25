//
//  WeatherModel.swift
//  myClima
//
//  Created by samuel Jeong on 2021/08/03.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let weatherId: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
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
        case 800:
            return "sun.max"
        case 801 ... 804:
            return "cloud"
        default:
            return "sun.max"
        }
    }
}
