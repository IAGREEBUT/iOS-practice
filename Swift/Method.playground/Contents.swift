import UIKit

/*
 
 Instance Method
 
 함수 - 타입에 연관되지 않음
 method - 타입에 연관된 기능 / 인스턴스를 생성해야만 사용할 수 있음
 
 
 */



/*
 
 선언
 func name(parameters) -> ReturnType {
    code
 }
 
 
 instance.method(parameters)
 
 */



class Sample {
    var data = 0
    static var sharedData = 123
    
    
    func doSomething() {
        print(self.data)
    }
    
    func call(){
        self.doSomething()
    }
    
    //self생략가능
    
}


let samp = Sample()
samp.data
samp.doSomething()
samp.call()



class Size {
    var width = 0.0
    var height = 0.0
    
    func enlarge(){
        width += 1.0
        height += 1.0
    }
}

let s = Size()
s.enlarge() // 클래스에서는 가능
/*
 instance method 가 instance property의 속성을 바꿀 수 있음
 */



struct Size2 {
    var width = 0.0
    var height = 0.0
    
    mutating func enlarge(){
        width += 1.0
        height += 1.0
    }
}

var s2 =  Size2() // 구조체는 본인의 가변성 속성이 내부 properrty에 영향을 미친다 
s2.enlarge()

/*
 instance method 가 instance property의 속성을 바꿀 수 없음! -> mutating으로 선언해야함
 
 값 형식에서 속성을 바꾸는 method를 구현하는 경우에는 mutating이 필수!!!
 
 */
