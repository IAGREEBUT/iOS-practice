import UIKit

//문자열 리터럴

let s = "Hello World" // NSString이 아닌 String으로 추론됨


let line = "Join us for online sessions August 1 through 24 to learn about the latest App Store features and get your questions answered. Live presentation with Q&A are being held in multiple time zones and languages."



//문자열과 같은 line에 """가 존재해서는 안됨
// enter, tab 등 모두 반영 가능
// \ 를 누르면 줄바꿈이 출력되지 않음
let multiline = """
Join us for online sessions August 1 through 24 to learn about the latest App Store features and get your questions answered.
    Live presentation with Q&A are being held in multiple time zones and languages.
""" //출력되는 문자열의 시작위치를 결정한다




/*
 
 String Types
 
 
 1)String : Swift 문자열
  - 구조체로 구현, 값 형식
 
 2)NSString : Foundation 문자열
 
 
 서로 호환가능 **Toll-free Bridged Type (서로 호환이 가능하며 언제든지 바꾸어 쓸 수 있는 Type을 의미)
 
 
 */


var nsstr: NSString = "str"
var swiftStr: String = nsstr as String
nsstr = swiftStr as NSString
// but 두 타입이 유니코드를 처리하는 방식에 차이가 있기 때문에 그냥 하나만쓰기



/*
 
let 타입으로 선언시 append등의 문자열 수정 불가
 
 */





/*
 
 문자열을 동적으로 구성하는 방법
 
 */

/*
 
 1.String Interpolation (문자열 보간/삽입)
    
    \(expression) : placeholder
    문자열 내 아무 곳이나 placeholder를 추가하여 문자열을 보간/삽입할 수 있다
 
 -> format을 세부적으로 지정할 수 없다
 */

var size = 56.78
var strr = "\(size)KB" //size는 String type이 아니지만 가능


/*
 
 
 2. Format Specifier 포맷 지정자
 
 ex) 위의 size 를 소수 5자리까지 출력하고 싶음
 
 %@ : String
 %d : 정수
 (%ad : 전체 차지하는 칸을 a 로 하고 오른쪽 정렬)
 (%-ad : 전체 차지하는 칸을 a 로 하고 왼쪽 정렬)
 %f : 실수
 (%a.bf : 전체 차지하는 칸을 a 그 중 소수 b자리까지 출력 - 남는 것은 앞쪽 공백 )
 (%0a.bf : 전체 차지하는 칸을 a 그 중 소수 b자리까지 출력 - 앞쪽 빈자리를 0으로 채움)
 
 
 */


print(String(format: "%.5fKB", size))



/*
 
 Extended String Delimeters
 
 #"charSequence"# -> #으로 감싸면 \이나"등을 실제 문자열처럼 출력한다
 
 */



print(#""hello" he said."#)



/*
 
 String indices 스트링 인덱스
 다른 언어와 다르게 index 0으로 접근불가능
 
 String.Index라는 특수한 자료형을 사용한다
 
 
 */

let str = "Swift"


//1번째 인덱스
let firstIndex = str.startIndex //0번째 인덱스
let firstCh = str[firstIndex]



//2번째 인덱스
let secondIndex = str.index(after: str.startIndex)
let secondCh = str[secondIndex]


//3번째 인덱스
var thirdIndex = str.index(str.startIndex, offsetBy: 2)
var thirdCh = str[thirdIndex]

thirdIndex = str.index(str.endIndex, offsetBy: -3)
thirdCh = str[thirdIndex]


//마지막 인덱스
let lastIndex = str.index(before: str.endIndex) // endIndex는 마지막 인덱스의 바로 다음 인덱스 이기때문에 범위를 벗어난다
let lastCh = str[lastIndex]

/*
 
 
 범위를 벗어난 인덱스에 접근하면 앱이 죽는 큰 오류가 발생하기 때문에
 확신할 수 없는 경우 if/guard를 이용해 체크하고 사용
 
 
 */

if thirdIndex < str.endIndex && thirdIndex >= str.startIndex{} //이런식
