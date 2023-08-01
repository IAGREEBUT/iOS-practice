import UIKit


/*
 
 self
    - 인스턴스에 접근하는 특별한 속성
    - self를 타입 멤버에서 사용하면 타입자체에 접근한다
 
 다양한 self 표현식
 
 self : instance자체에 접근
 self.propertyName
 self.method()
 self[index] : 여기서는 self 생략불가
 self.init(parameters) : 같은 type에 있는 다른 생성자를 호출 (self 생략불가)
 
 
 **closure에서 instance property에접근하기 위해서는 반드시 self.propertyName으로 접근해야한다
 
 
 
 */


class Size {
    var width = 0.0
    var height = 0.0
    
    
    func calArea() -> Double {
        return width * height // self생략가능 (instance method -> instance property 접근)
    }
    
    var area: Double {
        return calArea() // self생략 가능 (computed property -> instance method 접근)
    }
    
    func update(width: Double, height: Double){
        self.width = width //이름이 같은게 두개 있는 경우는 구별이 안가서 붙여줘야함
        self.height = height
    }
    
    func doSomething() {
        let c = { self.width * self.height } // closure안에서는 self사용 필수
    }
    
    static let unit = ""
    
    
    static func doSemething(){
        // self.height -> type method는 instance property에 접근 불가
        unit // type property에는 접근 가능
    }
    
    
}



struct Size2 {
    
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double){
//        width = value
//        height = value
        self = Size2(width:value, height:value) //위의 두줄과 같은 기능을 함 -> 값형식(structure)에서만 사용가능
    }
    
    
}




/*
 
    super
 
    상속과 관계있는 값 -> 클래스에서만 사용 
    
    super.propertyName
    super.method()
    super[index]
    super.init(parameters)
 
 */
