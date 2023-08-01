import UIKit

var greeting = "Hello, playground"

/*
 변수 선언
 */
var variableName = "initialValue" //선언 및 (메모리)할당



var name = "Swift"
var thisYear = 2023 // int형으로 자동으로 타입이 추론되었기 떄문에 이제부터 정수만 저장가나ㅡㅇ
var valid = true

print(name)

name = "steve" //대치 (이전값은 사라짐)
print(name)



/*
 상수 : 값을 지정하면 바꿀 수 없음, 읽기 전용
 
 장점
    - 코드가 안전해짐
    - 값이 바뀌지 않아 컴파일러가 최적화(빠른코드)
 
 상수로 일단 선언하고 필요시에만 바꾸기
 
 
 */

let constName = "constName"



/*
    네이밍 규칙
 
    UpperCamelCase
        - Class, Structrue, Enumertion(열거형), Extension, Protocol
 
    lowerCamelCase
        - Variable, Constant, Function, Property, Parameter
 
 
 */
