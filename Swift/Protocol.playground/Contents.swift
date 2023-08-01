import UIKit

/*
 
 ??뭔가 abstract class같음...
 
 Protocol
    - 타입에서 공통적으로 제공하는 멤버 목록
    (요구사항 정의서)
    - 선언만 포함되어 있으며 구현 X
 
 Protocol을 따라 Type을 만드는 작업 : Adopting Protocols (프로토콜을 따른다)
 
 */



/*
 Protocol 선언 문법
 
 protocol ProtocolName {
 
    propertyRequirements
    methodRequirements
    initializerRequirements
    subscriptRequirements
 
 }
 
 
 프로토콜 상속 (다중 상속 가능)
 protocol ProtocolName: Protocol, ... {
    
 }
 
 
 */


/*
 
 프로토콜 상속 (enum, struct, class -> 프로토콜을 상속받을 수 있는 종류에 제한은 없으나 원한다면 제한도 가능)
 
 enum TypeName: ProtocolName, ... {
 
 }
 
 
 struct TypeName: ProtocolName, ... {
 
 }
 
 
 class TypeName: SuperClass, ProtocolName, ... { // superClass와 프로토콜을 동시상속한다면 클래스를 맨 앞에 작성해야함
 
 }
 
 */




protocol Something {
    func doSomething()
}


struct Size: Something{
    func doSomething() {
        //
    }
}



/*

    클래스만 상속받을 수 있는 프로토콜
        = AnyObject
 
 */


protocol SomethingObject: AnyObject, Something {
    
}


// 에러 -> 해당 프로토콜은 클래스 전용
//struct Value: SomethingObject{
//    func doSomething() {
//        <#code#>
//    }
//}


class Object: SomethingObject{
    func doSomething() {
        <#code#>
    }
}



/*
 protocol의 property "REQUIREMENT"
 
 - 전부 var로 선언한다 (가변성과 상관이 없음)
    ** protocol property의 가변성은 {get set} 에 달려있다
 
    protocol에 정의된 사항은 "최소"만족 조건으로 {get}으로 쓰여있다고 읽기 전용일 필요는 없고 반드시 최소 읽을 수 있어야 한다는 의미임
    {get set} : 읽기전용일 수 없음 최소조건에 set이 있어서
    {get} : 최소조건이 읽기이므로 읽기전용/읽기쓰기 모두가능
 
 */



/*
 
 이름/타입/가변성 이 일치해야함 (실제 구현시)
 
 protocol ProtocolName {
    var name: Type {get set} //변수 속성
    static var name: Type {get set} //static 형식 속성
 }
 
 */



protocol Figure {
    var name: String {get set}
}


struct Rectangle: Figure {
//    let name = "Rect" // {get}
    var name = "Rect" // {get set}일 때는 var
}


struct Triangle: Figure {
    var name = "Triangle"
}

struct Circle: Figure {
    var name: String {
        get {
            return "Circle"
        }
        set {
            
        }
    }
}



/*
 
 PROTOCOL의 METHOD REQUIREMENT
 
 */


/*
 선언
 
 //method body는 작성하지 않음
 
 protocol ProtocolName {
    func name(param) -> ReturnType
    static func name(param) -> ReturnType // type 형식
    mutating func name(param) -> ReturnType // 프로토콜을 값형식이 사용하거나, 메소드에서 속성을 변경할 일이 있는 경우(값형식만 인건 아님)
 }
 */

protocol Resettable {
    func reset() //이름 파라미터타입 리턴타입만 동일하면됨!
    
    static func restart() // 실제 구현시 static(상속x method) , class(상속o method) 로 구현가능

}

class SizeT: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        //method body는 필요에 따라 자유롭게
        width = 0.0
        height = 0.0 //클래스에서는 property를 변경해도 됨(mutating필요없음)
    }
    
    
    class func restart() { //static method는 subclass로 상속은 가능하지만 오버라이딩은 불가능해짐!
        print("x") //static대신에 class로 선언할 경우 protocol static func도 만족하면서 오버라이딩도 허용가능!
    }
    
}


protocol ResettableMutating {
    mutating func reset()
}


//값형식
struct SizeM: ResettableMutating{
    var width = 0.0
    var height = 0.0
    
    
    //struct(값형식)에서 property를 변경하려면 mutating 이 필요
    mutating func reset(){
        width = 0.0
        height = 0.0
    }

}




/*
 
 Initializer Requirements
 - 프로토콜에 생성자가 포함되어 있을 경우 필수사항
 
 
 protocol ProtocolName {
    init(param)
    init?(param)
    init!(param)
 }
 
 */


protocol FigureStruct {
    var name: String {get}
    init(name: String) //생성자
}


//1. 값형식인 경우
struct RectangleStruct: FigureStruct {
    var name: String
    
    //자동으로 만들어질 memberwise initializer가 init(name:String)과 일치하기 때문에 구현하지 않아도 오류가 나지 않는 것
    
}



//2. 클래스인 경우 - 상속을 염두해 두어야함
class CircleStruct: FigureStruct {
    var name: String
    
    /*
     protocol에 있는 것은 반드시 구현되어야함
     
     CircleStruct뿐 아니라 이를 상속받은 다른 sub 클래스 또한 init(name:String)을 구현해야하므로
     class인 경우 상속을 염두에 두어 required를 사용해야함
     
     */
    
    required init(name: String){
        self.name = name
    }
}


/*
 ** 참고
 required initializer
 
 
 required init(something) {
    //something
 }
 
 
 required가 붙은 initializer는 자신을 상속받는 class에서 해당 initializer를 반드시 오버라이딩 해야한다 ( override 를 붙일 필요는 없고 동일한 함수를 작성함 )
 
 */


//클래스인 경우 - final class는 상속이 불가능 하므로 단순 프로토콜 구현이 가능
final class TriangleStruct : FigureStruct {
    var name: String
    
    init(name:String){
        self.name = name
    }
}


class OvalStruct: CircleStruct { // ovalStruct <- Circle <- Figure
    var prop: Int
    
    init() { // protocol에 있는 생성자와 다름
        prop = 0
        super.init(name: "Oval")
    }
    
    //프로토콜에 선언된 생성자를 만들어줘야함
    required convenience init(name: String){
        self.init()
    }
    
}




protocol GrayScale {
    init?(white: Double) // failable initailizer 도 가능 
}


struct Color: GrayScale{
    init?(white:Double){
        
    }
}
