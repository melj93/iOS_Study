//
//  NetworkManager.swift
//  News_API_APP
//
//  Created by samuel Jeong on 2021/11/03.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    //Published : 해당 변수를 브로드 캐스팅 할수 있음.
    
    func fetchData() { //Hacker News api Url로부터 데이터 가져오기.
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            })
            task.resume()
        }
    }
}
