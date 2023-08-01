import UIKit

/*
 
 Extension (타입확장)
    - 기존 타입에 메소드 속성 생성자 같은 새로운 타입을 추가하여 기능을 확장함 -> 추가만 가능,기존 멤버 오버라이딩 불가능
    - 구조체 열거형 클래스 프로토콜에서 사용 가능
 
 
 기존타입 수정이 불가능할 때
 프로토콜 구현시
 코드를 기능이나 프로토콜 단위로 분리하여 가독성을 높이고 싶을 때
 
 주로 사용
 
 extension Type {
    computedProperty 계산속성만 추가가능
    computedTypeProperty
    instanceMethod
    typeMethod
    initializer // 간편 생성자만 추가가능
    subscript
    NestedType
 }
 
 
 extension Type: Protocol, ... {
    requirements
 }
 
 */


struct Size {
    var width = 0.0
    var height = 0.0
}


extension Size {
    var area: Double {
        return width * height
    }
}

extension Size: Equatable { //extension구현으로 프로토콜을 추가할 수 있음
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

let s = Size()

s.width
s.height
s.area

/*
 extension을 이용해 adding properties
 
 -only computed property뿐
 
 */

extension Date { //이미 존재하는 타입(수정불가능)
    var year: Int{
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
}


let today = Date.now
today.year



extension Double {
    var radianValue: Double { //degree to radian
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue: Double {//radian to degree
        return self * 180.0 / Double.pi
    }
}

let dv = 45.0
dv.radianValue



/*
 extension을 이용해 adding methods
 */


extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self-32) * 5 / 9
    }
    
    static func convertToFahernheit(from celsius:Double) -> Double {
        return celsius.toFahrenheit()
    }
}

let c = 30.0
c.toFahrenheit()

Double.convertToFahernheit(from: 30.0)



//String class에 입력받은 숫자길이 만큼의 랜덤 스트링을 리턴하는 method 추가
extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
    -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else{
                continue
            }
            
            randomString.append(char)
        }
        
        return randomString
    }
}


String.random(length: 5)
