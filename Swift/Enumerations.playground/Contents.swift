import UIKit

var greeting = "Hello, playground"


/*
 
 Enumerations : 열거형
 연관된 상수를 하나의 타입으로 묶은것
 
 열거형에 포함된 상수 : (Enumeration) Case
 
 
 가독성 -> 이름만 봐도 어떤값인지 추론이 쉬움
 안정성 -> 오타 등등에서 자유로움
 이 높아짐
 
 */



/*
 열거형의 선언
 
 enum TypeName {
    case caseName
    case caseName
    ...
 }
 
 -> 주로 switch문과 함께 사용된다
 
 */

enum Alignment{
    case left //열거형 케이스는 독립적인값
    case center
    case right
}



var textAlignment = Alignment.center
textAlignment = .left //Alignment(TypeName)은 생략 가능


/*
 default값을 가지는 열거형
 
 RawValueType : String, Character, Number Type만 가능
 
 enum TypeName : RawValueType {
    case caseName = Value //상수 (값을 정하면 바꿀 수 없음) --> Value는 생략할 시에 자동으로 정해지는데 ex RawValueType  == Int이면, 0,1,2...로 정해짐
 
 }
 
 */


enum AlignmentInt: Int{
    case left //0
    case center = 100//100
    case right //101 -> 이전값을 기준으로 지정됨
}


AlignmentInt.left.rawValue //0
AlignmentInt.center.rawValue //1

//원시값은 변경 불가능함




AlignmentInt(rawValue: 100) //center
AlignmentInt(rawValue: 200) //nil



enum Weekdays: String{ //String으로 rawvalue선언시
    case monday //default = monday (동일)
    case tuesday
    case wednesday
    case thursday = "THUR"
    case friday
}
