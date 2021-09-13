//
//  main.swift
//  Closure
//
//  Created by samuel Jeong on 2021/07/12.
//

import Foundation

let array = [1, 2, 3, 4, 5]

let result = array.map{$0 + 1}

print(result)

let newArray = array.map{"\($0 + 1)"}
print(newArray)

