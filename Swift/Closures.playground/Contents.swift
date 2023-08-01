import UIKit

/*
 
 1등 시민 함수
 First Class Citizen Function
 
 함수가 어디든지 갈 수 있다는 뜻으로
 
 대표적으로 함수가 가기 어려워 보이는 곳인
 
 매개변수, 리턴, 변수/상수에 할당 부분에 함수가 들어갈 수 있다는 의미
 => 이런곳에 들어가는 대표적인 것들은 Type을 보유했다 (class, int, string... ) -> 그렇다면 함수도 타입을 가져야함
 
 */




/*
 
 함수의 타입
 
 (Int, Int) -> Int : 함수의 타입
 () -> Void
 
 어떤 일을 수행하는 함수 인지는 알 수 없지만
 어떤 타입의 매개변수를 몇개 받아 무엇을 리턴하는지는 같다
 
 
 */

var mathFunc: (Int, Int) -> Int //mathFunc은 무슨 일을 하는지는 모르지만 int2개를 받아 int 1개를 리턴하는 함수를 저장하는 변수임


func addTwoInts(a:Int, b:Int) -> Int {
    return a+b
}

func subTwoInts(a:Int, b:Int) -> Int {
    return a-b
}


mathFunc = addTwoInts
mathFunc(2,3)

mathFunc = subTwoInts
mathFunc(2,3)

//즉 이런게 가능






// 사례1 - 함수를 매개변수로 받음
func addVAT(source: Double) -> Double {
    return source * 1.1 //10% 부가세 발생
}

func couponDiscount(source: Double) -> Double {
    return source * 0.9 //10% 할인 쿠폰사용
}

/*
 source : Double
 additional:  (Double) -> Double
 
 을 받아 Double을 return하는 함수
 */
func finalPrice(source: Double, additional: (Double)->Double) -> Double {
    return additional(source)
}

let customer1 = finalPrice(source: 38.5, additional: addVAT)
let customer2 = finalPrice(source: 43.2, additional: couponDiscount)




// 사례2 - 함수를 리턴 ( currying )

/*
 필요한 사례
 
 인자를 매우 많이 받는 경우
 10개의 인자를 받아야 다 완성되는 함수를 작성하기 보다는
 
 일부의 인자만 받으면 할 수 있는 일을 미리 처리해두고 나머지 인자를 받았을떄 끝낼 수 있도록 하면 효율적임
 
 */

func makeAdder(x:Int) -> (Int) -> Int {
    
    func Adder(a:Int) -> Int {
        return x + a
    }
    return Adder
}


let add5 = makeAdder(x: 5) //return 5+a를 하는 함수
let add10 = makeAdder(x: 10)// return 10 + a를 하는 함수


print(add5(2))// return 5+a, a=2 대입
print(add10(2)) // return 10 + a, a=2 대입

print(makeAdder(x: 5)(2))




/*
 closure의 기본적인 표현식
 */


//기본 함수
func add(x:Int, y:Int) -> Int {
    return(x+y)
}


//closure -> 이 모양대로 상수/변수에 대입하거나.. 등등
let fuc = { //{}가 앞으로 나오고 그자리에 대신 in이 들어감
    (x:Int, y:Int) -> Int in
    return x+y
}


/*
 trailing closure
 : argument( not parameter )의 마지막이 function인 경우 매개변수 이름을 생략하여 작성할 수 있다
 */


//hadler 는 UIAlertAction -> Void Type의 function을 argument로 받는다 (이떄 handler가 마지막 매개변수이므로 trailing closure를 이용할 수 있다)
let removeAction = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: {
    ACTION in self.lamping.image = self.imgRemove
    self.isLampOn = false
})


//매개변수 이름 생략 / 소괄호 닫기 / {} 중괄호에 closure구현 
let removeAction2 = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive){
    ACTION in self.lamping.image = self.imgRemove
    self.isLampOn = false
}
