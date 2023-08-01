import UIKit

/*
 
 설계도들
 Enumeration
 Structure
 Class
 
 ---Initializer---->
 를 거치면
 
 instance가 된다
 (다른 언어에서는 class로 만든 것만 instance라고 부른다)
 
 
 **
 instance가 정상적으로 초기화 되었다
 means
 initializer의 실행이 끝났을 때 instance가 만들어졌고
 모든 property가 기본 속성을 가지고 있다 (lazy property 제외)
 
 하나라도 속성을 가지지 않으면 인스턴스가 만들어지지 않으며 실패했다고 함
 
 
 */

class Position {
    var x = 0.0
    var y: Double = 0.0
    var z: Double? = nil //optional 기본값 지정하지 않으면 자동으로 nil
    
    /*
     1) 모든 property 가 default값을 가지고 있고,
     2) 생성자가 구현되지 않으면
     
     compiler는 자동으로 default initializer
     init() : parameter 존재x
     를 만들어준다
     */
    


}



class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double){
        self.height = height
        self.width = width
    }
    
    //간편 생성자
    convenience init(value: Double){
//        width: value
//        height: value -> 중복은 생성자를 만들 때 권장되지 않으므로 생성자 호출을 통하여 해결하는 것이 좋음
        self.init(width:value, height:value)//initializer delegate
        
        /*
         생성자를 재사용할 수 있음
         */
        
    }
}




struct SizeValue {
    var width = 0.0
    var height = 0.0
    
    
}


/*
 default 생성자 2개
 1) no parameter
 2) all parameter
 */

let s = SizeValue() //default initializer
SizeValue(width: 0.0, height:0.0) //memeberwise initilaizer



/*
 Memberwise initializer
 
 구조체에서만 제공
 
 - 속성의 기본값
 - 속성의 type(let/var)
 에 따라 달라짐
 */



struct First {
    let a: Int
    let b: Int
    let c: Int
}


// 값이 없는 parameter에 대해서
let f = First(a:1, b:2, c:3)


struct Second{
    let a: Int = 0
    let b: Int = 1
    let c: Int
}

//값이 없는 c에 대해서만 생성자
let sec = Second(c: 3)


struct Third {
    var a: Int = 0
    var b: Int = 1
    var c: Int
}

//a,b는 값이 있지만 var 타입이므로 변경이 가능해서 두가지 모드 사용가능
let t = Third(c: 5)
let thi = Third(a: 1, b:3, c: 4)



/*
 이런 생성자는 생성자를 직접 구현하게되면 더이상 지원하지 않는데
 
 memeberwise initializer도 사용하고, 내가 직접 구현한 initializer도 함께 사용하고 싶은 경우
 */

extension Third{ //extension내에 구현하면 가능 
    init(value: Int){
        a = value
        b = value
        c = value
    }
}
