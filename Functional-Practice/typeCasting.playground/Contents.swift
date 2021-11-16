//: A UIKit based Playground for presenting user interface
  
import UIKit

class Human {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Korean: Human {
    var korean: Bool
    init(name: String, korean: Bool) {
        self.korean = true
        super.init(name: name)
    }
    
    func eatKimch() {
        print("Eat Kimch")
    }
}

class Japaness: Human {
    var japaness: Bool
    init(name: String, japaness: Bool) {
        self.japaness = true
        super.init(name: name)
    }
    
    func eatSusi() {
        print("Eat Susi")
    }
}
let korean = [
    Korean(name: "Sam", korean: true),
    Korean(name: "Hanna", korean: true),
    Korean(name: "Minwook", korean: true),
    Korean(name: "Boomun", korean: true),
    Korean(name: "Kangsan", korean: false)
]

for friends in korean {
    if friends is Human {
        friends.eatKimch()
    }
}

