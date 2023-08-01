import UIKit

/*
 Dictionary : key-value 쌍을 이뤄 저장됨
  
 key : unique 각각 타입이 같아야함 -> 주로 String
 value : not unique 각각 타입이 같아야함
 
 정렬x (index는 존재) -> orderedDictionary라는게 있음
 key값은 hash가 필수인데 그냥 String을 사용하면 알아서 자동으로 됨
 
 
 */


var dict = ["A": "Apple", "B": "Banana"]


//Dictionary<K,V>
//[K:V]


let dict1: Dictionary<String,Int>
let dict2: [String:Int]


dict=[:]//empty dic
dict = [String:String]() //생성자로 empty dic
dict = Dictionary<String, String>()




//값에 접근하기 -> key로 접근


var words = ["A": "Apple", "B": "Banana", "C": "Corn"]

words["A"] //Apple
words["D"] // nil -> Optional
words["D", default: "Empty"] //nil인 경우 기본값 return -> NonOptional



//순회


//정렬 x -> 실행시마다 순서가 달라짐
for k in words.keys {
    print(k)
    print(words[k, default: "Empty"])
}

for v in words.values {
    print(v)
}


//항상 동일한 순서(정렬된) 버전으로 출력하고 싶다면
for k in words.keys.sorted() {
    print(k)
    print(words[k, default: "Empty"])
}


// dictionary -> array
let keys = Array(words.keys) //key값들로 배열
let values = Array(words.values) // value값들로 배열




/*
 
 adding keys and values
 
 */

var mutableDict = [String:String]()
mutableDict["key"] = "value" //이미 존재하는 키인 경우에는 값 변경, 없으면 새로운 값 추가 (Upsert)

mutableDict//["key": "value"]


//제거
mutableDict.removeValue(forKey: "key") //해당 값 삭제 -> 존재하지 않는 경우에는 nil이 반환됨



//비교


//dictionary에는 순서가 없기 떄문에 둘은 같다
var first = ["A": "Apple", "B": "Banana", "C": "Corn"]
var second = ["A": "Apple", "C": "Corn", "B": "Banana"]

first == second // true
first != second // false



//검색

//closure를 상수에 담음
let find: ((key: String, value: String)) -> Bool = {
    $0.key == "B" || $0.value.contains("i") //key에 "B"가 포함되었거나 value에 'i'가 포함되었거나 한 요소를 찾는 조건
}



first.contains(where: find) //포함되어 있는지 여부
first.filter(find) //검색된 모든 메소드를 딕셔너리로 리턴해줌

/*
 first(where : )
 firstIndex(where:)
 도있는데 어쩌피 순서가 매번 달라져서...
 */
