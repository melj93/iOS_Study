let friendsArray: Array = ["Hanna", "Gangsan", "Bumoon"]
let friendsSet: Set = ["3Hanna", "2Gangsan", "1Bumoon"]
let word: String = "pneumonoultramicroscopicsilicovolcanoconiosis"
let halfRangeOfNumber = 1...4

for name in friendsArray { // array
    print(name)
}
print("---")
for name in friendsSet { // set
    print(name)
}

for letter in word { // String
    print(letter)
}

for _ in halfRangeOfNumber { // _ underScore as no constant
    print("Loop is running")
}

func fibonacci(n: Int) {
    //create array
    var array: [Int] = [0, 1]
    for numb in 0...n-3 {
        let thirdNumb = array[numb] + array[numb + 1]
        array.append(thirdNumb)
    }
    print(array)
}

fibonacci(n: 5)

