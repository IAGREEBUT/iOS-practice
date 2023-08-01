import UIKit

/*
 
 Data Type
 String,Int, Character ...
 
 하지만 원하는 데이터 타입을 직접 만들어 낼 일도 생김
 -> Class, Structure, Enumeration
 
 3가지를 사용하여 데이터 타입을 생성함
 
 
 */




/*
 
 Class : object를 만들어 내기 위한 설계도
 -> class로 만든 object : instance
 
 object의 상태/특징 : property
 object의 동작 : method
 
 
 */



/*
 
 **swift의 structure는 다른 언어의 structure보다 더 크고 널리 사용된다(개념이 조금다름)
 
 Structure :
 클래스와 다른점 : object가 아닌 "값"을 가진다(value type)
                소멸자(deinitializer)를 가지지 않는다
 structure로 만들어진 값 -> instance
 
 
 */



/*
 
 structure 선언
 
 struct StructName {
    
    property
    method
    initializer
    subscript
 
 
 }
 
 
 */


struct Person{
    
    var name: String
    var age: Int
    
    
    func speak(){
        print("Hello")
    }
    
    
}


//instance생성
let p = Person(name: "Steve", age: 50)

p.name
p.age
p.speak()


/*
 class
 
 
 class ClassName{
    property
    method
    initializer
    subscript
 
 }
 */


class Person2 {
    var name: String = "Steve"
    var age: Int = 50
    
    
    func speak(){
        print("Hello")
    }
}


let p2 = Person2();
p2.name
p2.age
p2.speak()







/*
 
 Intializer 생성자
 "모든" 속성에 적절한 초기값을 저장한다 == 인스턴스 초기화
 생성자는 여러개일 수 있다 
 
 init(parameters){
    statement
 }
 
 
 
 */
