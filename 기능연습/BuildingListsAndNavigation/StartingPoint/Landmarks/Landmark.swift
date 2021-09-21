//
//  Landmark.swift
//  Landmarks
//
//  Created by samuel Jeong on 2021/09/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}

