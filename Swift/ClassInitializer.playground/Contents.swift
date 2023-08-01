import UIKit

/*
 클래스에서 생성할 수 있는 생성자
 
 1) Designated Initializer : 지정 생성자
    - 클래스가 가진 모든 속성을 초기화 하는 생성자
    - 클래스가 상속계층 포함 but Basic class가 아니면, Initializer 실행이 끝나기 전에 슈퍼클래스의 지정생성자를 직접 호출해야한다 -> initializer deligation
    -> 여러개 구현이 가능하지만 하나만 구현
 
 2) Convenience Initializer : 간편 생성자
    - 모든 속성을 초기화 해야한다는 제약이 없다
    - 특정 속성을 원하는 방식으로 초기화, 나머지는 designated intializer가 초기화하도록 구현
    - 항상 같은 클래스에 있는 다른 initializer를 호출하는 방식으로 구현 (super class의 initializer에 접근 불가(오버라이딩 개념없음))
    //필요 없는 경우 잘 구현하지 않음
 */

class Position {
    var x: Double
    var y: Double
    
    
    init(x: Double, y: Double){ //모든 속성을 초기화하고 잇음!
        self.x = x
        self.y = y
    }
    
    
    convenience init(x: Double){
        self.init(x: x, y:0.0) //대부분 designated initializer를 호출하는 방식으로 구현
    }
}





/*
 Initialzier 상속 방법
 
 다른 member들과 다르게 initializer의 상속에는 몇가지 조건이 있다
 **initializer의 조건은 "클래스가 가진 모든 속성을 초기화할 것"인데, 슈퍼클래스에는 자식클래스의 프로퍼티가 없어서 모든 속성을 초기화 할 수 없다
 
 
 1) subclass의 모든 속성이 기본값으로 초기화 되어 있음 ( var width = 1.2 )
 2) designated initialzier를 직접 구현하지 않았음
 의 경우 super class의 모든 desiganted initialzier를 상속
 
 
 1) subclass가 모든 designated intializer를 상속받음 / overriding함
 의 경우 모든 convenience initializer를 상속
 */


class Figure {
    var name: String
    
    
    init(name: String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "unknown")
    }
    
    func draw(){
        print("draw \(name)")
    }
    
}



class Rectangle: Figure {
    
    //subclass의 모든 속성값이 기본값으로 초기화 되어 있음
    var width: Double = 12.0
    var height: Double = 34.5
    
    //designated initializer를 직접 구현하지 않았음
}


class Rectangle2: Figure {
    
   
    var width: Double = 12.0
    var height: Double = 34.5
    
    
    //모든 designated initializer를 상속받음 + 오버라이딩 함 ==> super class의 모든 convinience initializer가 상속됨
    init(name: String, width: Double, height: Double){
        self.height = height
        self.width = width
        super.init(name: name) //self.name= name 은 불가능하고 상위 클래스의 initializer를 불러 할당해주어야함 -> name property를 상속받기도 전에 초기화 self.name=name은 불가능
    }
    
    
    override init(name: String) {
        width = 0
        height = 0
        super.init(name: name)
    }
    
//    convenience init(){
//        self.init(name: "unknown")
//    } -> 없어도 사용할 수 있는 상태
    
}


/*
 
 required initializer
 
 
 required init(something) {
    //something
 }
 
 
 required가 붙은 initializer는 자신을 상속받는 class에서 해당 initializer를 반드시 오버라이딩 해야한다 ( override 를 붙일 필요는 없고 동일한 함수를 작성함 ) 
 
 */

