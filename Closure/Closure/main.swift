//
//  main.swift
//  Closure
//
//  Created by samuel Jeong on 2021/07/12.
//

import Foundation

let array = [1, 2, 3, 4, 5]
let result = array.map{$0 + 1}

print("Array: \(array)")

print("Array + 1 : \(result)")

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

//함수 안에 함수를 매개변수로 사용할 수 있다. 또한 return으로도 함수 사용 가능.

func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

let multipleCal = calculator(n1: 2, n2: 3, operation: multiply)
print(multipleCal)
//6
