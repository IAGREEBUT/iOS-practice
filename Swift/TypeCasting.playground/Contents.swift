import UIKit

/*
 
 Type Casting
 
 is
  - type check operator( 이항연산자로 분류됨 )
 
 expression "is" type
 expression의 타입이 type이면 T, 아니면 F
 (동일 type / 같은 상속계층의 type or super class )

 **type check는 runtime에 실행되므로
 실행해보기 전 까지 알 수 없다
 
 */



let num = 123

num is Int //true
num is Double //false



class Figure {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    func draw(){
        print("draw \(name)")
    }
}


class Triangle: Figure {
    override func draw(){
        super.draw()
        print("🔺")
    }
}




class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    override func draw(){
        super.draw()
        print("🟩")
    }
}


class Square: Rectangle{
    
}

class Circle: Figure {
    var radius = 0.0

    
    override func draw(){
        super.draw()
        print("🎱")
    }
}




let t = Triangle(name:"Triangle")
let r = Rectangle(name: "Rectangle")
let s = Square(name: "Sqaure")
let c = Circle(name: "Circle")


r is Rectangle // true
r is Figure //Rectangle의 부모 -> true
r is Square // Rectangle의 자식 -> false



/*
 
 as
 expression의 type이 Type(as 뒤에 작성한) 과 호환된다면, expression을 Type으로 casting하여 return함
 
 
 Compile time에 실행됨
  - expression as Type
 
 Rutime에 실행됨 (compile time에는 결과를 알 수 없음)
  - expression as? Type : casting성공시 -> casting한 instance
                                 실패시 -> nil
  - expression as! Type : 강제 casting(nil인경우 fatal 에러)
 
 
 */




/*
 as를 이용한 upcasting
 
 - Compile time Casting 사용 가능
 
 */

var upcasted: Figure = Square(name:"sq")
upcasted = s as Figure // Figure로 upcast -> 언제나 성공하는 경우이므로 as 사용가능



/*
 as를 이용한 downcasting
 
 as? 사용권장 -> 실패가능성이 있기 때문
 
 */

upcasted as? Square
upcasted as! Square
upcasted as? Rectangle
upcasted as! Rectangle

upcasted as? Circle //square이므로 nil


//실제 프로젝트에서 casting을 사용해야하는 경우
if let c = upcasted as? Circle{
    //이렇게 사용하는게 안전하다 ->nil이 아닌경우에만 작동
}




let list = [t,r,s,c] // t,r,s,c는 전부 다른 클래스의 인스턴스 인데 같은 array로 저장가능 ?
/*
 이런경우 upcasting하여 저장됨
 list 의 type은 [Figure]
 */

for item in list {
    item.draw() // 각각 overriding된 method가 실행됨 -> 다형성 : upcasting된 인스턴스를 통해 메소드를 호출해도 실제 overriding한 메소드가 실행된다
    
    
    
    //but property는 upcasting 된 version으로만 됨 -> property에 접근하고싶으면 downcasting필요
    if let c = item as? Circle{ // 해당 item이 Circle인 경우에만 실행되도록 한다 
        c.radius
    }
}






