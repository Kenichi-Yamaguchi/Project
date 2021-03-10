import UIKit

var str = "Hello, playground"

let numberList = [1, 2, 3, 4, 5]
let lastNumber: Int? = numberList.last
if lastNumber != nil {
    let result = (lastNumber ?? 3) * 5
    print(result)
} else {
    print("nilです")
}

var count: Int?
var price: Int

price = 250 * (count ?? 2)

count = 3

let year1: String = "2000"
let year2: String = "2222"

if let strYear = Int(year1), let endYear = Int(year2), strYear < endYear {
    let years = endYear - strYear
    print(years)
}

//Computedプロパティ - 関数を介して値をやり取りするプロパティ
class Circle {
    
     var radius: Double = 1.0
     var area: Double {
        get {
            return radius * radius * Double.pi
        }
        set(menseki) {
            radius = sqrt(menseki / Double.pi)
        }
    }
}

let myCircle = Circle()
print(myCircle.radius)
print(myCircle.area)

myCircle.area *= 5
print(myCircle.radius)
print(myCircle.area)

//プロパティオブザーバー - プロパティに新しい値がセットされたことをwillSet,didSetで知ることができる
//willSetは値が更新される直前に呼ばれ、新しくセットされる値にnewValueでアクセスできる
//didSetは値が更新された直後に呼ばれ、更新前の値にoldValueでアクセスできる
class Player {
    
    var times = 0
    var level: Int {
        willSet {
            print(newValue)
        }
        didSet {
            if oldValue != level {
                times += 1
                print("\(times)回目、", oldValue)
            } else {
                print("変化なし")
            }
        }
    }
    
    init() {
        level = 0
    }
    
    let thePlayer = Player()
}

//クラスメンバー
//クラスプロパティ - staticを使用して宣言する

class Car {
    
    static var count = 0
    var moving: Bool = false
    
    func start() {
        Car.count += 1
        moving = true
    }
    
    func stop() {
        if Car.count > 0 {
            Car.count -= 1
            moving = false
        }
    }
}
let car1 = Car()
let car2 = Car()
let car3 = Car()
print("動いてる車は、\(Car.count)台")
car1.start()
car2.start()
car3.start()
print("動いてる車は、\(Car.count)台")

//Computedクラスプロパティ - class var 編数名: 型
class Myclass {
    static var radian: Double = 0.0
    class var degree: Double {
        get {
            let dosu = radian * 90 / Double.pi
            return dosu
        }
        set(dosu) {
            radian = dosu * Double.pi / 90
        }
    }
}

Myclass.degree = 19
let katamuki = Myclass.degree

//プロトコル - 必ず実装しなければならないプロパティやメソッドを指定した使用書の様な物。
//プロパティの初期値やメソッドの機能を使用しない。

//<T : Equatable>が意味するのは、「Equatableプロトコルに準拠したあらゆる型」
func isEqual< T : Equatable>(_ x: T, _ y: T) -> Bool {
    return x == y
}

func identity<T>(_ argument: T) -> T {
    return argument
}
 let spa = identity("string")
let api = identity(123)

