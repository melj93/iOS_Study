import UIKit

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fri

print("오늘은 \(today)요일입니다.")
//fir
print("오늘은 \(today.rawValue)요일입니다.")
//금
// rawValue 프로퍼티: 원시값을 사용할 수 있음.



//연관 값을 갖는 열거형
enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case  normal, cheeseCrust, thin
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish {
    case past(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.past(taste: .cream)
print(dinner)
dinner = .pizza(dough: .thin, topping: .bacon)
print(dinner)
dinner = .chicken(withSauce: true)
print(dinner)
dinner = .rice
print(dinner)


enum School: CaseIterable{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [School] = School.allCases
print(allCases)
