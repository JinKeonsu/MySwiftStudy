//
//  ViewController.swift
//  MyClosure
//
//  Created by Keonsu Jin on 2023/03/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            sortTest()
        } else if sender.tag == 1 {
            closureTest()
        }
    }

    //MARK: sort..
    func moveBackward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    func moveForward(_ s1: String, _ s2: String) -> Bool {
        return s1 < s2
    }
    
    func sortTest() {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        //#1
//        let backNames = names.sorted(by: moveBackward)
        let forNames = names.sorted(by: moveForward)
//
//        print(backNames)
        print("forward names: \(forNames)")
        
        //#2
        let backNames1 = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
        let backNames2 = names.sorted(by: { s1, s2 in return s1 > s2 })
        let backNames3 = names.sorted(by: { s1, s2 in s1 > s2 })
        let backNames4 = names.sorted(by: { $0 > $1 })
        let backNames5 = names.sorted(by: > )
        let backNames6 = names.sorted { $0 > $1 }
        let backNames7 = names.sorted() { $0 > $1 }
        
        print("backNames1: \(backNames1)")
        print("backNames2: \(backNames2)")
        print("backNames3: \(backNames3)")
        print("backNames4: \(backNames4)")
        print("backNames5: \(backNames5)")
        print("backNames6: \(backNames6)")
        print("backNames7: \(backNames7)")
    }
    
    //MARK: - closure
    func closureTest() {
        
        // 1. simple closure parameter
        let greetUser = { (name: String) in
            print("Hey there, \(name)")
        }
        greetUser("Jin")
        
        
        // 2. closure that return value
        var findSquare = { (num: Int) -> Int in
            var squareValue = num * num
            return squareValue
        }
        var result = findSquare(29)
        print("square result: \(result)")
        
        
        // 3. closure as function parameter
        func grabLunch(search: () -> ()) {
            print("Let's go out for lunch")
            
            search()
        }
        
        func eatPizza() {
            print("Pizza okay")
        }
        
        func eatSteak() {
            print("Steak is good")
        }
        
//        grabLunch(search: eatPizza)
        grabLunch(search: eatSteak)
        grabLunch(search: { print("direct print statement") })
        
        
        // 4. trailing closure
        func trailingClosure(message: String, someFunc: ()->() ) {
            print("1st param message: \(message)")
            someFunc()
        }
        
        trailingClosure(message: "1st test", someFunc: eatSteak)
        trailingClosure(message: "2nd test", someFunc: {
            print("2nd direct print statement")
        })
        trailingClosure(message: "3rd test") {
            print("3rd direct print statement")
        }
        
        
        // 5. auto closure
        func normalPrint(_ closure: () -> Void) {
            closure()
        }
        func autoClosurePrint(_ closure: @autoclosure () -> Void) {
            closure()
        }
        normalPrint({ print("I'm normal expression") })
        autoClosurePrint(print("I'm autoclosure expression"))
        
        /*
         Swift에서 @autoclosure를 사용하는 대표적인 예로 assert()함수가 있습니다.
         assert() 함수는 대략 다음과 같이 정의 돼 있는데요. (@autoclosure와 상관없는 코드는 생략)
         public func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String())
         
         assert(false, "Error Occurred!")
         assert(0 < 1, "Error Occurred!")
         assert(false, (statusCode == .fileNotFound) ? "File Not Found!" : "Something going wrong!")
         */

        
    }
}

