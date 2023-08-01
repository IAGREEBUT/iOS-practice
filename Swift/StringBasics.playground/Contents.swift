import UIKit

/*
 문자열 만들기
 */



//1. 문자열 리터럴 사용
var str = "Hello, world"
var emptyStr = ""


//2. String 생성자 사용
var s = String() // ""

//3. 다른 타입(String포함)의 값을 casting
let a = String(12)

let hex = String(123, radix: 16) //16진수 문자열로 바꾸기 , 다른 값 대입ㄱ ㅏ능




/*
 문자열 삽입

 
 *TIP*
    함수 이름에 ed/ing 가 포함되어 있음 -> 원본을 변경시키지 않고 새로운 값을 리턴
    포함 x -> 원본을 수정함

 */


/*
 문자열 replace


 str.replaceSubString(substring의 range, "변경할 값")

 */

var sampleString = "Hello, Objective-C"

if let range = sampleString.range(of: "Objective-C") {
    sampleString.replaceSubrange(range, with: "Swift") // 원본을 변경
}

sampleString


//새로운 값을 리턴(-ing 형태)
var sampleString2 = sampleString.replacingOccurrences(of: "Swift", with: "Awesome Swift") //대소문자 구분
//대소문자 구분x ampleString.replacingOccurrences(of: "Swift", with: "Awesome Swift", options: [.caseInsensitive])
//of를 찾아 존재하면 with로 변경


sampleString2




/*
 문자열 삭제
 
 */

var sample = "Hello, Awesome Swift!!!"


//remove

let lastCharIndex =  sample.index(before: sample.endIndex)

//특정 인덱스의 값을 삭제
var removed = str.remove(at: lastCharIndex) // 삭제된 문자를 반환 -> Character type을 반환하기 떄문에 index가 잘못되어 nil이 반환되면 앱이 죽는다

//맨 앞 인덱스(+n개)의 값을 삭제
sample.removeFirst(3) //lo, Awesome Swift!!

//맨 뒤 인덱스(-n개)의 값을 삭제
sample.removeLast(2)//lo, Awesome Swift

//특정 범위의 값을 삭제
if let range = sample.range(of: "Awesome"){
    sample.removeSubrange(range)
}


//drop : 원본을 바꾸지 않고 drop결과를 반환함
sample = "Hello, Awesome Swift!!!"


var substr = sample.dropLast()
substr

substr = sample.dropLast(3)
substr

substr = sample.dropFirst()
substr

substr = sample.dropFirst(7)
substr




       
substr = sample.drop {$0 != ","} // , 이전의 문자열 droop
/*
 문자열에 있는 character를 순서대로 전달받아 true를 return하는 동안만
 해당 순서의 문자를 제거함
 */



//문자열 비교


/*
 비교 연산자를 통한 비교 -> 아스키코드 값을 사용함
 .asciiValue
 를 치면 해당 문자의 아스키 코드값 확인 가능
 */


let bigA = "Apple"
let smallA = "apple"
let b = "Banana"



/*
 메소드를 통한 비교
 
 str1.compare(_ aString: options: range: locale: _
 
 */



//순서가 같은지 비교

bigA.compare(smallA) == .orderedSame // false (대소문자 고려)

//대소문자 무관하게
bigA.caseInsensitiveCompare(smallA) == .orderedSame // true
bigA.compare(smallA, options: [.caseInsensitive]) == .orderedSame


/*
 문자열 검색
 finding substrings
 
 
 str.contains(str에 포함된 substring)
 
 */

let ss = "Hello, Swift"
ss.contains("Swift") //true

//대소문자 무관하게 검색 -> 별다른 option등이 존재하지 않으므로
ss.lowercased().contains("swift")


//common prefix 검색

let str1 = "Hello, Swift"
let str2 = "Hello, Programming"
let str3 = "hello, programming"


var common = str1.commonPrefix(with: str2)
common = str1.commonPrefix(with: str3)
common = str1.commonPrefix(with: str3, options: [.caseInsensitive]) //대소문자 무관

/*
 위의 함수를 사용하여 return되는 common의 경우
 함수를 호출한 string의 substring이다
 
 -> 여기서는 str1의 substring인 Hello
 */
