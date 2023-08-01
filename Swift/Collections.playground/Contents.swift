import UIKit

/*
 
 Collections
 
 어떤 물건, 개념을 공통적인 주제로 묶어놓은 것
 
 -> 프로그램에서는
 "데이터"묶음을 효율적으로 처리하는 특별한 Type이다
 
 - 가변 collection / 불변 collection (let)
    저장된 요소 추가/삭제 불가능
    ** 하지만 저장되어 있는 요소의 변경가능 여부는 해당 element에 달려있다(var/let)
 
 1) array : 데이터를 순서대로 저장
 2) dictionary : 데이터를 key-value의 묶음으로 저장
 3) set : 집합연산을 제공
 
 
 두가지 collection이 있는데 구현 방식이 다름
 Foundation Collection :
 - class -> 오브젝티브 씨에서 사용하던거
 - NSArray / NSDictionary / NSSet
 - 객체(object)만 저장가능
 - 하나의 컬렉션에 여러가지 타입 저장가능(어쩌피 object화 시켜서 저장하기떄문)
 - NSArray(불변) NSMutableArray(가변)->클래스 자체를 가변/불변을 지정해서 구현함
 
 
 Swift Collection : structure -> 주로 이거
 - Array / Dictionary / Set
 - value(int등)/Object 저장가능
 - 하나의 컬렉션에 하나의 타입만 저장가능
 - var:가변 let:불변 keyword로 가변성이 정해짐
 
 */






/*
 Array
 =ordered collection
 
 동일 타입
 중복 허용
 인덱스 사용 -> 추가/삭제시 배열 마지막부분을 이용하는 것이 오버헤드가 적다
 
 
 명명
 __List
 __Arrays
 __s(복수형)
 
 */



//Array literal

let nums = [1,2,3]
let multi = [[1,2,3], [4,5,6]] //2차배열



//Array Type 둘다사용가능
// Array<Type>
// [Type]
let strArray: Array<String>
let strArray2: [String]

let emptyArray: [Int] = [] //빈 배열인 경우 타입을 꼭 선언 (추론불가)
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()


//Array 접근
let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[0...1] //범위도가능
//범위 밖이라 nil이면 앱 죽음


//정수말고 속성(?)으로 하면 더안ㄴ전
fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]


fruits.first //맨 처음 인덱스에 접근 (Optional type이라 nil이어도 안전)
fruits.last//마지막 인덱스에 접근 (Optional type이라 nil이어도 안전)


fruits.prefix(20) // 요소 index 0 부터 20개 요소로 만든 배열 리턴
fruits.prefix(upTo: 3) // index 0 - 2까지 요소로 만든 배열 리턴
fruits.prefix(through: 2) //index 0 - 3까지 요소로 만든 배열 리턴

fruits.suffix(3) // 뒤에서부터 3개
fruits.suffix(from:3)// index 3부터 끝까지


/*
 Adding elements
 */

var mutableAlphabet = ["A", "B", "C"]
mutableAlphabet.append("E") //
mutableAlphabet.append(contentsOf: ["F","G"])
mutableAlphabet.insert("D", at: 3) // 넣을 요소 , at : 원하는 인덱스 위치
mutableAlphabet.insert(contentsOf: ["a","b"], at: 0)

//append은 맨 뒤에 추가되는 것 이기 때문에 insert보다 overhead가 적다


//1. subscript ( [] : 이게 subscript)
mutableAlphabet[...1] = ["g","f"]

//2. method사용
mutableAlphabet.replaceSubrange(2...4, with: ["j","k","l"]) // 변경을 원하는 범위의 길이와 새로운 배열의 길이가 같을 필요없음


/*
 배열 삭제
 
 - 인덱스가 범위를 벗어나지 않는지
 - 빈배열이 아닌지 확인하고 삭제해야함
 
 */

var deleteAlphabet = ["A","B","C","D"]

//배열의 요소를 하나씩 꺼내서 사용할 때도 자주 사용
var deleted = deleteAlphabet.remove(at: 1) //삭제된 것을 반환 -> 인덱스 범위 넘어가면 fatal error



var firstDeleted = deleteAlphabet.removeFirst() //()파라미터에 정수를 넣으면 처음부터 n개만큼 삭제됨(return void)
var lastDeleted = deleteAlphabet.removeLast() //()파라미터에 정수를 넣으면 뒤부터 n개만큼 삭제됨(return void)


deleteAlphabet.removeAll()//빈배열로 -> 배열이 비어있으면 에러임


var popAlphabet = ["A","B","C","D"]

var popedLast = popAlphabet.popLast() // return Optional<Type> -> nil return가능

if let popedLast = popedLast{ //unwraped
    print(popedLast)
}

//삭제 범위를 입력받기
popAlphabet.removeSubrange(1...)


//drop
//기존 배열을 복사한 후 삭제해서 그 배열을 반환해준다 (원본 배열이 변경되지 않음)

var dropAlphabet = ["A","B","C","D"]

dropAlphabet.dropFirst()
dropAlphabet.dropLast()
let dropped = dropAlphabet.drop { $0 != "C"} // closure에서 반환하는 값이 true인 동안 계속 drop
 


/*
 배열 비교
 */


let a = ["a","b","c"]
let b = ["A","B","C"]

a == b
a != b

//대소문자 sensitive
a.elementsEqual(b)


//대소문자 무관
a.elementsEqual(b, by: { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame
}
)



/*
 값 찾기
 
 
 .min() : 최솟값(문자면 아스키코드)
 .max() : 최댓값(문자면 아스키코드)
 .contains(e) :해당 요소가 포함되어 있는지 t/f
 .contains(closure) : closure로 정의된 조건에
 
 */


var randomNumber = [1,8,3,0,9,6,4,5,7,2] //randomNumber.shuffled() 랜덤으로 섞어주는 함수 

let r3 = randomNumber.contains{
    $0.isMultiple(of: 2) //짝수인지
}

//$0 : first Parameter, $1 : second parameter


randomNumber.first{ // 조건에 맞는 요소중에 가장 먼저 검색된 요소를 리턴 (Optional)
    $0.isMultiple(of: 2)
}

randomNumber.firstIndex{ // 조건에 맞는 요소중에 가장 먼저 검색된 요소의 인덱스를 리턴 (Optional)
    $0.isMultiple(of: 2)
}


//정렬

//오름차순 정렬
randomNumber.sorted() // 정렬된 새로운 배열을 리턴

//내림차순
let sorted = randomNumber.sorted{
    $0 > $1 //내림차순
}
//randomNumbers.sorted().reversed() 해도 가능한데 클래스가 다른 클래스임

var mutableNumbers = randomNumber


mutableNumbers.sort() //원본을 정렬



//swap
mutableNumbers.swapAt(0, 1) // 두 인덱스요소의 위치를 swap
