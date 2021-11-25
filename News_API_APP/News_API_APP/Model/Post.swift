//
//  Post.swift
//  News_API_APP
//
//  Created by samuel Jeong on 2021/11/04.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable { //Identifiable : id와 title을 필수로 가짐
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}

