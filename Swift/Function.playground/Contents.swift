import UIKit

/*
 
 함수의 기본 형태
 
 Input(Parameter) ---> [ function code ] ----> Output(Return value)
 
 
 
 함수의 특징
  - 재사용성 (Reusability)
 
 
 swift의 기본 라이브러리
 https://developer.apple.com/documentation/swift
 
 */




/*
 
 call function
 
    functionName(parameter) // 함수를 호출하는 코드 또는 위치 => call-site/caller
 
 */




/*
 
 Defining Functions
 
    func name(parameters) -> ReturnType {
 
        statement
        
        return expression //1)expression을 평가하여 결과를 return 2)함수를 종료시킴 (expression이 없는 경우에 단순 함수 종료 용도로 사용)
    }
 
    //return type없는 경우
     func name(parameters) {

         statement

     }
 
 
 
    **parameter -> let이므로 내부에서 변경 불가능하다
    (name: Type, name: Type, ...)
 
    **함수 명명 tip
 
 
        함수 이름 : 동사 + 명사 ( findName )
        파라미터 이름 : 명사 (name)
        argument label : 전치사 (in/at/to..)
 
 */


func add() -> Int {
    return 1 + 2 // 이렇게 body가 return한 줄인 경우에 "return"을 생략하고 expression만 적어도됨 (암묵적리턴..)
    // return 되면 해당 함수가 호출된 call-site로 돌아감
}

//이런것도 가능
if add() == 3 {
    print("three")
}


func add(a: Int, b: Int) -> Int {
    return a + b
}

// a : parameter / 3: argument(인자) -> 용어가 다르다
if add(a:3, b: 12) != 3 {
    print("not three")
}




func sayHello(to: String = "Stranger") { //default 인자 설정가능
    print("Hello, \(to)")
}

sayHello()
sayHello(to: "Swift")


/*
 
 Arguement Label
 - arguement에 이름 뿐 아니라 label을 사용할 수 있다
 - 함수 이름과 분리되어서 사용되는 개념으로 가독성을 높이기 위한 개념임
 
 
 
 ex
 
(name: String)
 name : parameter name 이면서, arguement label
 String : Type
 
 
 
 (to name: String)
 to : arguement label -> argument값을 지정 시 사용 (_ 로 대체하는 경우 사용하지 않겠다는 의미 -> 함수 호출 시 생략해도됨)
 name : parameter name -> 함수 내에서 파라미터에 접근할 때 사용
 String : Type
 
 */


func sayHi(to name: String = "Stranger") {
    
    //함수 내부에서는 parameter이므로, parameter이름을 사용하여 변수에 접근한다
    
    print("Hi, \(name)") //name
}


//함수를 call할때는 argument이므로 argument label 사용

sayHi(to: "Swift") //to


func sayAnnyeong(_ name: String = "Stranger") { // argumentLabel 생략
    
    print("Annyeong, \(name)") //name
}


sayAnnyeong("Swift") // 생략가능
