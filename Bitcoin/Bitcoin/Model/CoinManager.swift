//
//  CoinManager.swift
//  Bitcoin
//
//  Created by samuel Jeong on 2021/08/10.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "CB3FBE64-9E17-4CC0-AAF4-66599FF94BB2"
    
    let currencyArray = ["KRW","AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let coinPrice = self.parseJSON(safeData){
                        let priceString = String(format: "%.2f", coinPrice)
                        self.delegate?.didUpdateCoin(price: priceString, currency: currency)
                    }
                    
                    
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let lastPrice = decodedData.rate
            print(lastPrice)
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return 0
        }
    }
}
