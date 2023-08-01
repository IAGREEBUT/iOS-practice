
import UIKit

/*
 
 
 var 로 선언시 - 변수 저장 속성 (variable stored property)
    var name: Type = DefaultValue
 
 
 let 로 선언시 - 상수 저장 속성 ( costant stored property)
    let name: Type = DefaultValue
 
 
 */


class Person {
    let name: String = "Jone Doe" //변경 불가
    var age: Int = 12 //변경 가능
}


//instance p
let p = Person()
p.name
p.age

p.age = 10 // 변수 저장 속성이므로 변경가능

p.age


struct PersonStruct {
    let name: String = "Jone Doe" //변경 불가
    var age: Int = 12 //변경 가능
}


let p2 = PersonStruct()

// p2.age = 20 error -> struct는 class와 다르게 p2가 let이기 떄문에 변경 불가능함
// ** 구조체의 가변성은 속성의 가변성에 영향을 준다

p2.age

var p3 = PersonStruct()

p3.age = 20 // 가능



/*
 
 지연 저장 속성 : 최초 접근 시에 프로퍼티에 값이 저장된다
 (Lazy Stored Properties)
 *var을 사용함 (let은 초기화 이후에 변경될 수 없는 성격을 가졌으므로)
 
  lazy var name: Type = DefaultValue
 
 
 저장 속성 : 초기화 시 프로퍼티에 값이 저장된다
 
 
 초기화(Initialization) -------------- 최초 접근(First Access) -------------------->
 
 
 */



struct Image {
    init(){
        print("new Image")
    }
}


struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image() // Image() 생성자가 BlogPost instance 변수 초기화이 아닌 최초접근 시점에 실행된다
    
    let date:Date = Date()
    lazy var formattedDate: String = { //closure를 이용해 초기화
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date) //date속성을 사용해야하는데 data/formattedDate가 값이 들어가는 시점이 같으면 안되기 때문에 lazy로선언
    }() //lazy var이므로 뒤에 ()를 붙여 최초 접근 시점에 호출되도록 해야한다
}

//lazy var을 사용한다면 instance도 var로 선언해야한다
var post = BlogPost() //변수 초기화 시점

post.attachment //최초 접근 시점




/*
 
 ComputedProperties (계산속성)
 
 다른 속성을 기반으로 속성값이 결정됨(단순 수학 계산x)
 메모리값이 존재하지 않아 다른 속성을 읽어서 필요한 계산을 실행 후 리턴 or 속성으로 전달된 값을 다른 속성에 저장
 
 항상 다른 값이 될 수도 있음(var로만 선언가능)
 
 열거형/클래스/structure모두 사용가능
 
 */


/*
 
 기본형식
 
    - 메모리를 가지지 않아 값을 미리 지정할 수 없음 -> 추론불가하므로 Type작성이 필수
    
 
    var name: Type {
        get {
            statements
            return expr //작성한 Type과 동일
        }
        set(name) { //값 저장시에 실행됨
            statements
        }
    }
 
 
 */


class PersonWithComputed {
    
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int){
        self.name = name
        self.yearOfBirth = year
    }
    
    var age: Int {
        get {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth
        }
        set{ // set에서 매개변수 값을 생략하면 newValue 라는 이름으로 사용할 수 있다
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue // 나이를 입력받으면 나이를 기반으로 출생년도(yearOfBirth)를 재 계산한다
        }
        
    }
    
}


let person = PersonWithComputed(name: "Jason", year: 2002)

person.age // 호출시 get block이 실행된다
person.age = 50 // 호출시 set block이 실행된다 -> 출생년도를 재계산



/*
 
 읽기 전용 computed properties
    - set block이 필요하지 않은 경우에 삭제가능하다
 
 
    var name: Type {
        get {
            statements
            return expr
        }
    }
 
 
    //get block을 생략하고 이렇게 사용도 가능
    var name: Type { //이경우 closure와 구분이 어려울 수 있는데 클로저는 "="이게 있은ㅁ 
         statements
         return expr
    }

 
 */
