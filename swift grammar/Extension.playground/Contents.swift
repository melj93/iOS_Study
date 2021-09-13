import UIKit

extension UIButton {
    func makeCircular(){
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
    }
}

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .white
button.backgroundColor = .gray
button.makeCircular()


extension Double {
    func round(to places: Int) -> Double {
        let precisionNumb = pow(10, Double(places))
        var n = self
        n = n * precisionNumb
        n.round()
        n = n / precisionNumb
        return n
    }
}

var myDouble = 3.1459
myDouble.round(to: 3)
