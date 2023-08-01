import UIKit

/*
 값 형식 vs 참조형식
 
 
 Value Type
 - Structure (Int, String, Collection등등 Structure로 구현됨)
 - Enumeration - 연관된 상수의 묶음
 - Tuple - 코드 내에서 한번만 사용될 때
 
 객체지향 프로그래밍
    * 상속 필요 x, 적은 데이터가 필요
    값이 전달되는 시점마다 새로 복사본이 만들어져야할 때
 
 함수형/프로토콜 지향 프로그래밍에서 주로 사용
 
 Reference Type
 - class
 - closure
 
 객체지향 프로그래밍에서는 클래스가 기본
 
 함수형/프로토콜 지향 프로그래밍에서(swift)
 
 * 상속이 필요, 참조를 전달해야하는 경우
 
 
 
 
 */



struct PositionValue{
    var x = 0.0
    var y = 0.0
}


class PositionObject {
    var x = 0.0
    var y = 0.0
}



var v = PositionValue()
var o = PositionObject()


var v2 = v // v2는 v의 복사본으로 생성된 다른 값
var o2 = o // 참조를 전달


/*
 v2의 값을 바꿔도 v의 값은 변하지 않음
 -> v2와 v는 별개의 메모리 공간을 가짐
 
 
 o2의 값을 바꾸면 o의 값도 바뀜
 -> 복사본을 만들지 않음 , 메모리 주소를 전달함
    같은 주소를 통해 값에 접근하기때문에 같은 것을 참조
 o2와 o는 같은 객체를 가리키고 있기때문 (o2는 o를 참조함)
 
 */


//3시간 43분
