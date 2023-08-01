import UIKit

/*
 
 Type Properties
    - 저장 형식 속성
    - 계산 형식 속성
 
 두가지로 가능
 
 - 모든 인스턴스가 공유하는 하나의 값
 
 
 이전에 배운
 Stored Properties / Computed Properties는
 -> instance properties라고부름
 -> 인스턴스마다 별도의 메모리가 만들어지며, 인스턴스마다 다른값을 가짐
 p1.name = 'yj'
 p2.name = 'br' ..
 
 
 
 
 */


/*
 저장 형식 속성
 
 선언방법
 
 static var name: Type = DefaultValue
 
 기본 값 생략 불가 바로 초기화해야함
 해당 속성 값에 최초로 접근할 때 초기화됨 (기본으로 지연속성 lazy)
 
 접근방법
 TypeName.propertyName
 
 */


class Math{
    static let pi = 3.14
    
}



let m = Math()
Math.pi



/*
 계산 형식 속성
 
 선언방법
 
    static var name: Type {
        get {
            statements
            return expr
        }
        set(name) {
            statements
        }
    }
 
 
 
    or
    class에서 상속을 사용하고 싶은 경우는 특별히(static은 상속불가)
 
     class var name: Type {
         get {
             statements
             return expr
         }
         set(name) {
             statements
         }
     }
 
 */


enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    
    static var today: Weekday{
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today






/*
 
 Type Method
 
 - 모든 인스턴스가 공유하는 하나의 메소드
 
 //상속 금지
 static func name(parameters) -> ReturnType {
    statements
 }
 
 
 //상속 허용
 class func name(parameters) -> ReturnType {
    statements
 }
 
 
 호출
 TypeName.method(parameters)
 
 
 */


class Circle {
    static let pi = 3.14
    var radius = 0.0
    
    
    func getArea() -> Double {
        return radius * radius * Circle.pi //typeName으로 접근
    }
    
    
    static func printPi(){
        print(pi) //type method는 type instance에 .없이 바로 접근가능 , instance method에는 접근 불가 
    }
    
}
