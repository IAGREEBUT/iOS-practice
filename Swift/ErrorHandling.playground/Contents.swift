import UIKit
import Foundation

/*
 
 ERROR
 
 Compile error
  - 컴파일 과정에서 발생하는 에러 (주로 문법에러)
 
 
 
 Runtime error
  - 프로그램이 실행되는 동안에 발생하는 에러 (프로그램이 강제 종료되는 경우가 생김)
 
 */




/*
 ERROR TYPE
 
 */

enum DataParsingErorr: Error { //에러 프로토콜을 채용하면 에러 타입이됨
    case invalidType
    case inavlidField
    case missingRequiredField(String)
}



/*
 
 throw   VS   throws
 
 throw expression : 에러를 던지는 키워드
 
 
 함수/생성자/클로저 가 에러를 던질 수 있을 때 : throws
 
 func name(parameters) throws -> ReturnType {
    statements
 }
 
 
 init(parameters) throws {
    statements
 }
 
 
 closure
 
 { (parameters) throws -> ReturnType in
    statements
 }
 
 */





func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingErorr.missingRequiredField("name") //throw는 scope의 실행을 즉시 종료함
    }
    
    
    guard let _ = data["age"] as? Int else { //age를 INT로 파싱불가능하다면 에러
        throw DataParsingErorr.invalidType
    }
    
}

/*
    try statements
 
    throws func을 호출할 때는 try statements를 호출함
 
 
    - try expression
    - try? expression : expression에서 error를 던지면 nil을 리턴하고 끝
    - try! expression : expression에서 error를 던지면 runtime error
    
    try? parsing(data: [:])
    
 
    try expression사용의 3가지 방법
        - do-catch statements
        -
 
*/
    
    
    
    
    
/*
    
    do-catch statements
        :
        do-block : 필수블록 try에서 에러가 발생할 수있는 코드를 호출
        catch-block : 에러가 발생하는 경우 실행됨
 
        catch block의 순서 중요 - 좁은 범위부터 작성해야함
 
            do {
                try expression
                statements
            }catch pattern {
                statements
            }catch pattern where condition {
                statements
            }
     
     
*/
    
    

func test() {
    
    do {
        try parsing(data: [:])
    }catch DataParsingErorr.invalidType, DataParsingErorr.missingRequiredField{ //나열 가능
        print("handle invalidType error")
    }catch { //위에서 나오지 않은 나머지 에러들이 여기서 처리됨
        print("handle error")
        
        //나머지 모든 에러들이 모였으므로 구분하는 방법
        if let error = error as? DataParsingErorr{
            switch error {
            case .invalidType:
                print("invalid Type")
            default:
                print("handle Error")
            }
        }
    }
}


func test2() throws { //위의 2가지 경우가 아닌 에러들은 test2를 호출한 함수로 던져짐
    
    do {
        try parsing(data: [:])
    }catch DataParsingErorr.invalidType, DataParsingErorr.missingRequiredField{ //나열 가능
        print("handle invalidType error")
    }
}



try? test2() //error가 던져질 가능성이 있으므로







