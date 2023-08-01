import UIKit

var greeting = "Hello, playground"


/*
 
 조건문
 
 
 //순서대로 처리하므로 더 범위가 좁은 조건이 위에 쓰여야 한다
 
 if condition {
    statements
 } else if condition {
    statements
 } else {
    statements
 }
 
 else, else if Block은 불필요시 생략이 가능하다

 
 */




/*
 
    guard 문
        - condition을 평가한 후 실행할 코드를 결정한다
        - condiftion == false 이면, 실행중인 scope를 중지 -> "Early Exit"
        
 
 
    1.
        guard condition else {
            statements
        }
 
        - condition이 true이면, guard문을 종료한다
        - condition이 false이면, else Block을 실행한다
            * else scope은 반드시 종료되어야 한다
                
    //뒤에 Optional 파트에서 자세히
    2. guard optionalBinding else {
            statements
        }
 
 */


//조건이 많아도 중첩이 발생하지 않아 가독성이 좋다
    func validateGuard(id: String){
        
        guard id.count >= 6 else {
            print("invalid id : shorter than 6")
            return // scope종료
        }
        
        guard id.count <= 20 else {
            print("invalid id : id can not be longer than 20")
            return
        }
        
        print("valid id")
    }


func validateIf(id: String){
    
    //조건이 많으면 중첩이 발생한다
    if id.count >= 6 {
        if id.count <= 20 {
            print("valid id")
        }else{
            print("invalid id : id can not be longer than 20")
        }
    }else{
        print("invalid id : shorter than 6")
    }
    
}


/*
 switch 문
    - pattern/value matching : 값을 비교해서 동일하면 실행한다
    - interval matching : 구간 값에 속하면 실행한다 ( ... )
 
 
    swtich valueExpression {
        
        case pattern:
                statements //실행 부분은 생략 불가능하다
        case pattern, pattern:
                statements
        default:
                statements // 비우고 싶을때는 break
    }
 
 
     swtich valueExpression {
         
         case pattern where condition: // 상세 조건을 추가 가능하다
                 statements
         default:
                 statements
     }


 
    **fallthrough : 바로 아래있는 block의 statement를 조건 참거짓 유무와 무관하게 실행한다
                    버그가 발생하기 쉬워 반드시 필요한 경우에만 사용한다

 
 
 */

let num = 1

switch num {
    case 1:
        print("one")
    case 2,3:
        print("two or three")
        fallthrough // 바로 아래 있는 조건의 statements를 실행한다 (조건이 true인지 여부와는 무관)
    case 4...10:
        print("more than three")
    default:
        break // 비워두고 싶다면 break;
    
}



/*
 로그인 실패시 9번까지는 경고문구
 10번 부터는 계정을 잠그고 안내메일을 보내고
 그 이후로는 안내메일만 보내는 코드
 */

let attempts = 10

switch attempts {
    
case ...9:
    print("warning")
case 10:
    print("lock account")
    print("send warnig email")
default:
    print("send warning email")
}


//위와 동일하지만 코드중복을 없앰
switch attempts {
    
case ...9:
    print("warning")
case 10:
    print("lock account")
    fallthrough
default:
    print("send warning email")
}



/*
 
    for문
    
    
    for loopConstant in Range {
        statements
    }
 
 
    WILD CARD PATTERN
    *loopConstant를 사용하지 않는다면(ex index)
        "_" 를 사용하면 성능이 좋아진다
 
 */

let power = 10
var result = 1
    
for _ in 1...power { //범위는 1씩 증가한다
    result *= 2
}

//n 씩 증가시키고 싶을 떄
// stride (from: lowerbound(포함) , to: upperbound(포함x) , by: step(n) ) 사용
// stride (from: lowerbound(포함) , through: upperbound(포함) , by: step(n) ) 사용

for num in stride(from: 1, to: 10 , by: 2){
    print (num)
}



/*
 
 제어 전달문(흐름 제어구문)
    - 조건문,반복문에서 사용
    - 코드의 실행 흐름을 제어함
    
    break : 호출 즉시 실행중인 문장(statement)을 끝내고 다음 문장(statement)을 시작
            - 가장 인접한 statement에만 영향을 준다
            - if/switch/while문에서 사용
    continue : 제어를 다음 회차로 전달함 (해당 부분에서 밑부분 코드를 실행하지 않고 다음회차로 넘겨서 처음부터 실행)
    fallthrough
    return
    throw
 
 
    제어 전달이란?
        현재 실행중인 scope를 끝내고, 다음에 실행할 코드를 바로 실행하게함
 
 */
