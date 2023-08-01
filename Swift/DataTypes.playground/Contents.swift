import UIKit

var greeting = "Hello, playground"

/*
 TYPE의 이름은 UpperCamelCase로 표시한다
 
 정수
 Int8-64 : signed
 UInt8-64 : unsigned
 
 */


/*
 
 실수 - 지수/가수로 나누어 저장하여 오차가 발생
 Float (4byte) - 최대 6자리까지 보장(마지막자리 반올림)
 Double (8byte) - 최대 15자리까지 정확성 보장 ** 실수를 표현할 때 주로 사용 **
 
 */


let f: Float = 3.141592
let d: Double = 3.14159265358979


/*
 
 Boolean

    특이점 false(0)/true(1) 을 의미하지 않는다
    int type을 Bool 으로 사용할 수 없다
 
 */

let isHappy :Bool = true
let isSad: Bool = false



/*
 문자와 문자열
 
 문자열 : ""사이에 포함된 문자 집합
 
 */

let str = "1" //string
type(of: str) //str라는 변수의 타입을 출력


let ch: Character = "1"//(1글자만 가능)character type




/*
 형식 추론 Type Inference
 
 type확인
 1) Otpion key를 누르고 변수클릭
 2) type(of: 변수명)
 
 
 Type annotation
 
 let name: Type = value
 var name: Type = value
 
 
 Type/value둘중 하나는 꼭 작성해야 한다
 
 
 비교
 "swift" == "swift" //문자비교가능
 
 "swift" > "Swift" //아스키 코드값으로 비교함 맨 왼쪽 글자부터 하나씩 아스키코드값으로 비교
 

 참고
  
 = : 할당 연산자, 값을 할당할 때 사용한다
 ** c언어등은 할당연산자가 값을 return하는데
    ex) if a = 68 {  } //사용가능
    swift는 할당연산자가 값을 return하지 않고 단순 할당의 기능만 한다 
 
 
 */


/*
 
 범위연산자 : 범위를 표현
    - 반복할 범위 표현
    - 배열에서 특정 부분을 추출할 때
 
    - 상수, 변수에 저장가능/파라미터로 전달 가능/함수 return값으로 사용 가능 => First Class citizen
 
    let range = ...5 (가능)
 
 
    
    오름 차순 범위만 생성 가능함  (lowerbound <= upperbound)
    1) closed range operators (닫힌 범위)
        - lower bound ... upper bound (lower bound <= 범위 <= upperbound)
        - lowerbound ...
        - ... upperbound
 
 
    내림차순 -> 오름차순 범위 만든 후 reversed() 함수 사용
    (1...10).reversed()
 
 
    2) Half-Open Ranger Operator
        Upper Bound는 범위에 포함되지 않음
        - lower bound ..< upper bound
        - ..< upperbound
 
 
 
 
    range.contain(num) -> 범위에 포함되는지 여부
 

 
 */







