//: Playground - noun: a place where people can play

import UIKit

//var population: Int = 5422
//var message: String
//var hasPostOffice: Bool = true
//
//if population < 10000 {
//    message = "\(population) is a small town"
//} else if population >= 10000 && population < 50000 {
//    message = "\(population) is a medium town"
//} else {
//    message = "\(population) is pretty big"
//}
//print(message)
//
//if !hasPostOffice {
//    print("Where do we buy stamps?")
//}
//

//Chapter 4 - Numbers
//print("The maximum Int value is \(Int8.max).")
//print("The maximum Int value is \(Int8.min).")
//
//
//let numberOfPeople: UInt = 40
//let volumeAdjustment: Int8 = 30

////Oprator shorthand
//var x = 10
//x += 10
//x -= 5
//x *= 3
//x /= 5
//
////Convert Between Integer Types
//let a: Int16 = 200
//let b: Int8 = 50
//let c = a + Int16(b)

//Floating, duouble
//let d1 = 1.1
//let d2: Double = 1.1
//let f1: Float = 100.3
//
//print(10.0 + 11.4)
//print(11.0 / 3.0)
//
//if d1 == d2 {
//    print("d1 and d2 are the same")
//}
//
//print("d1 + 0.1 is \(d1+0.1)")
//if d1 + 0.1 == 1.2 {
//    print("d1 + 0.1 is equal to 1.2")
//}

//Bronze challenge

//Chapter 5 - Switch
//Switch
//Fallthrough is a control transfer statement , it will first excute its code and then transfer control to the case immediately below
var statusCode: Int = 418
var errorString: String = "The request failed:"
//switch statusCode {
//case 400,401,403,404:
//    errorString = "There was something wrong with the request."
//    fallthrough
//default:
//    errorString += " Please review the request and try again"
//    print (errorString)
//}

//Range (use ...) Value Binding: bind the matching value in certain case to a local constant or variable
//switch statusCode {
//case 100, 101:
//    //errorString += " Informational, 1xx."
//    errorString += " Informational, \(statusCode)."
//
//case 204:
//    errorString += " Successful but no content, 204."
//case 300...307:
//    //errorString += " Redirection, 3xx."
//    errorString += " Redirection, \(statusCode)."
//
//case 400...417:
//    //errorString += " Client error, 4xx."
//    errorString += " Client error, \(statusCode)."
//
//case 500...505:
//   // errorString += " Server error, 5xx."
//    errorString += " Server error, \(statusCode)."
//case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
//    errorString = "\(unknownCode) is not a known error code"
//
//default:
//    //errorString = "Unknown. Please review the request and try again"
//   // errorString = "\(statusCode). Please review the request and try again"
//    errorString = "Unexpected error encountered"
//}
//print (errorString)

//Using TUples (.0 first Element, .1 Second element
//let error = (statusCode, errorString)
//error.0
//error.1
/*Named Element*/
let error = (code: statusCode, error: errorString)
error.code
error.error

//Bronze Challenge
//let point = (x: 1, y: 4)
//switch point{
//case let q1 where (point.x > 0) && (point.y > 0):
//    print("\(q1) is in quadrant 1")
//case let q2 where(point.x < 0) && (point.y > 0):
//    print("\(q2) is in quadrant 2")
//case let q3 where (point.x < 0) && (point.y < 0):
//    print("\(q3) is in quadrant 3")
//case let q4 where (point.x > 0) && (point.y < 0):
//    print("\(q4) is in quadrant 4")
//case (_,0):
//    print("\(point) sits on the x-axis")
//case (0, _):
//    print("\(point) sits on the y-axis")
//default:
//    print("Case not covered")
//}

//Silver Challenge
// If case comma separated list, a) in the cool demographic, b) of drinking age in the United States, c) not in their thirties.
//let age = 25
//if case 18...35 = age, age >= 21, age < 30 {
//    print ("In cool demographic and of drinking age in the United States, and not in their thirties")
//}

//Chapter 6 - LOOPS
var myFirstInt: Int = 0
var mySecondInt: Int = 0
//for _ in 1...5{
//    myFirstInt += 1
//    myFirstInt
//    print(myFirstInt)
//}

//Using where condition
//for i in 1...100 where i % 3 == 0 {
//    print(i)
//}

//while loops
//var i = 1
//while i < 6 {
//    myFirstInt += 1
//    print(myFirstInt)
//    i+=1
//}

//repeat-while loops (do-while)
//repeat{
//    print("Go")
//}while i >= 1

//Continue - Control transfer statement

//var shields = 5
//var blasterFireCount = 0
//var blastersOverheating = false
//var spaceDemonDestroyed = 0
//while shields > 0{
//    if spaceDemonDestroyed == 500{
//        print("You beat the game!")
//        break
//    }
//
//    if blastersOverheating {
//        print("Blasters are overheated! cooldown initiated.")
//        sleep(5)
//        print("Blasters ready to fire")
//        sleep(1)
//        blastersOverheating = false
//        blasterFireCount = 0
//        continue
//    }
//
//    if blasterFireCount > 100 {
//        blastersOverheating = true
//        continue
//    }
//
//    print("fire blasters!")
//
//    blasterFireCount += 1
//    spaceDemonDestroyed += 1
//}

//Silver Challenge
var i = 1
//for i in 1...10 {
//    if(i % 3 == 0){
//        print("Fizz")
//    }else if(i % 5 == 0){
//        print("BUZZ")
//    }else if(i % 3 == 0 && i % 5 == 0){
//        print ("FIZZ BUZZ")
//    }else{
//        print(i)
//    }
//}

var loopTuple = (a:false, b: false)

for i in 1...100{
    loopTuple = (a: i % 3 == 0, b: i % 5 == 0)
    switch(loopTuple){
    case(a:true, b: true):
        print("FIZZ BUZZ")
    case(a:true, b:false):
        print("FIZZ")
    case(a:false, b:true):
        print("BUZZ)")
    default:
        print(i)
    }
    
}
