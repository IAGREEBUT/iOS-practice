import UIKit

/*
 
 Upcasting
 Downcasting
 
 
 */



class Figure {
    let name: String
    
    init(name: String)
    {
        self.name = name
    }
    
    func draw(){
        print("draw \(name)")
    }
    
}



class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    override func draw() {
        super.draw()
        print("\(width) x \(height)")
     }
}



class Sqaure: Rectangle {
    
}

let f = Figure(name: "Unknown")
f.name


let r = Rectangle(name: "Rectangle")
r.width
r.height
r.name



let s = Sqaure(name: "Sqaure")
s.name
s.width
s.height


/*
 upcasting (접근제한)
 
 Square 생성자를 이용해 생성했기 때문에
 sqaure의 method/property를 모두 가진다 -> 메모리 공간이 생겨남
 
 but
 Figure로 upcasting했기 때문에
 Figure가 가지지 않은 width/height가 저장된 메모리공간에는 접근할 수 없게 된다
 
 *존재하지 않는 것이 아니라 접근이 불가능한거임
 
 */

let sf: Figure = Sqaure(name: "Figure Sqaure")
sf.name

// sf.width 접근 불가능



/*
 downcasting : 에러가능성이 있음
 
 upcasting한 type을 원래대로 되돌릴 때 사용(본인 타입의 super class에 속하는 타입만 가능하다) -> Type casting을 사용
 */

let downCastedS = sf as! Sqaure // or Rectangle도 가능
downCastedS.name
downCastedS.width
downCastedS.height




class Rhombus: Sqaure {
    var angle = 45.0
}


let dr = sf as! Rhombus //sf의 원래 type인 Square보다 하위(자식)이므로 에러! -> 멤버에 관계없이 허용되지 않음


