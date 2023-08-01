import UIKit


//NonOptional Type


let stock: Int
//print(stock) // compile error (null출력 아니고 에러)

/*
 다른 언어와 다르게
 var let (변수/상수)는 사용전에 "초기화"해야한다
 
 = 항상 값을 가지고 있어야함 (null불가능)
 
 */






//Optional Type

/*
 null을 가지는 것이 가능한(값을 가지고 있지 않아도 되는) Type
 
 nil : 값이 없다(null)
 하지만, nil값을 가지면 타입 추론이 불가능하므로 nil값을 가질 수 있는건 항상 타입을 명시해주어야한다
 
 
 var stock : Int? = nil
 지금은 nil이지만 값을 가진다면 Int값만 가질수 있는 변수
 
 Int? or Optional<Int> : Optional Int
 String? or Optional<String> : Optional String
 
 
  
 */

var num: Int? = nil

print(num) // nil

num = 123

print(num) // Optional(123) -> wrapping되어 있어서 이렇게 출력됨.. 값을 먼저 꺼내고 사용해야함 == unwrapping
print(num!) // 123 -> unwrapping

var n = 123

print(n) // 123


/*
 
 Unwrapping(!)
 강제 추출
 
 Optional값을 강제로 unwrapping해준다
 하지만 해당 값이 nil이었을 경우 Fatal error가 발생하므로
 꼭 필요한 상황에서만 쓰거나 if문으로 nil인지 체크한 후 사용해야함
 
 if(num != nil) {
    print(num!)
 }
 
 **optional type을 unwrapping하면 NonOptional type이 반환된다
 

 */

var testNum: Int? = 123

let before = num // type : Int?
let after = num! // type : Int



/*
 
    Optional Binding
    
 
    1) if
 
        if let name : Type = OptionalExpression //Optional에 값이 저장되어 있는 경우 unwrapping
        { //binding 성공 시 실행
            statements
        }
 
    2) while
         while let name : Type = OptionalExpression
        {//binding 성공 시 실행
             statements
         }
 
    3) guard
         guard let name : Type = OptionalExpression
        else { // binding 실패시 실행
             statements
         }
 
 */



var number: Int? = 123

if let number = number{
    // 여기서 사용되는 number는 unwrapping된 number로 해당 scope내에서만 사용가능
    print(number)
}



/*
 같은 코드
 */
if let n = number { // number라는 Optional에 값이 있는 경우에만 n에 unwrapping하여 담아줌 (var 로 하면 변경도 가능)
    print(n) //n : Int , unwrapping됨
}



if number != nil {
    print(number!)
}




var str: String? = "Swift"
guard let str = str else { // str == nil인 경우 수행됨
    //str : String?
    fatalError()
}

// guard 구문을 지났으면 str != nil이므로 unwrapping됨

//str: String



let a: Int? = 12
let b: String? = "str"


if let a, let b, b.count > 5 { // 여러개의 optional expression 및 condition추가 가능
    //위의 3가지가 true인 경우 (+ not nil)에만 수행됨 
    
}
