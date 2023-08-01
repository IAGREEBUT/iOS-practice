import UIKit

/*
 
 Base Class/Root Class -> 최상위 계층의 클래스
 
 
 Parent Class = Super Class
 Child Class = Sub Class
 
 자식 클래스는 여러개여도 되는데, 부모클래스는 1개여야한다
 (다중상속 불가능 -> Protocol 사용하면 비슷하게 가능)
 
 @override : 부모에게서 상속받은 함수를 자식이 재정의해서 사용함
 
 
 */


/*
 
 class ClassName: SuperClassName {
 
 }
 
 */


class Figure {
    
    var name = "Unknown"
    
    init(name: String){
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
    
}


class Circle: Figure { // Figure를 상속
    var radius = 0.0 //읽기+쓰기 모두 가능한 속성
    
    var diameter: Double {  //읽기 전용 속성
        return radius * 2
    }
    
    var size = 0.0
}


let c = Circle(name: "Circle")

c.name
c.draw()






/*
 final class
 
 - final keyword로 선언한 class로 상속이 금지된다
 
 */



final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}


//class Square: Rectangle {} //불가능





/*
 overriding
 */



// method overriding
class Star: Figure {
    var color = "yellow"
    
    
    override func draw(){ // Figure에 존재하는 method를 Star class에 맞게 변형함 -> override
        super.draw() //figure에 있는 draw method도 실행가능
        print("draw 🌠")
    }
}


let stars = Star(name: "Shining stars")

stars.draw()




//property overrding
class Oval: Circle {
    
    /*
     1) computed property 방식으로 overriding이 가능
     
     주의: super의 property의 mutable을 해쳐서는 안된다
     
     읽기 전용 속성 ----overriding ---> 읽기/쓰기 전용 속성 (O)
     읽기/쓰기 전용 속성 --- overriding ---> 읽기전용 속성 (X)
     
     ** 읽기전용속성? computed property에서 get{}만 구현된 것
     
     */
    
    override var radius: Double {
        get{
            return super.radius //self 로 작성하면 안됨! 재귀호출이라서 종료됨
        }
        set{ // set을 생략할 수 없음! Circle의 radius는 읽기/쓰기 모두 가능한 속성이므로 읽기전용으로 구현할 수 없음
            super.radius = newValue
        }
    }
    
    
    //읽기전용 속성인 diameter를 읽기/쓰기 전용 속성으로 overriding
    override var diameter: Double {
        get{
            return super.diameter
        }
        set{
            super.radius = newValue/2 //꼭 super.diameter를 부를 필요는 없다
        }
    }
    
    
    
    /*
     
     2) property observer(값이 바뀌는 것을 감시함)를 이용하는 방식
     
        변수(var) 저장 속성인 경우에만 가능!
        읽기 전용도 불가능
     
     */
    
    override var size: Double{
        willSet{ //값이 저장되기 바로 직전에 호출됨
            print(newValue)
        }
        didSet{ // 새 값이 저장된 직후에 호출됨
            print(oldValue)
        }
        
        /*
         값이 변경되는 경우
         1. willSet 실행
         2. 저장 프로퍼티의 값이 변경됨
         3. didSet 실행
         
         3가지가 순서대로 실행됨
         
         */
        
    }
    
}



/*
 
 클래스 상속을 허용하면서 특정 property/method만 상속을 금지하는 법
 
 final keyword를 func 앞에 사용
 final keyword를 var/let 앞에 사용
 
 
 
 */
