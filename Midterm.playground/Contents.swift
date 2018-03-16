//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play


//////1. Create an instance of an immutable String, and print it out.
//let str1 = "Cannot change"
//let immutableString = str1
//print(immutableString)
//
//////2. Create an instance of a mutable String, and print it out, then prove that it is mutable.
//var mutableString = "Can change"
//print(mutableString)
//mutableString += " Hello World"

////3. Print out all of the characters in the following String: "abcdefghijklmnopqrstuvwxyz", one by one, using a for loop.
//let abc = "abcdefghijklmnopqrstuvwxyz"
//for char in abc {
//    print(char)
//}

////4. Write out a formula in Swift for printing out the 6th character in the String. (hint: you will need an Index).
//let str4 = "Hello, world!"
//let index = str4.index(str4.startIndex, offsetBy: 6)
//print(str4[index])

////5. Write out a formula in Swift (in one line) for finding the length of the String "Call me Ishmael".
//let str5 = "Call me Ishmael".count


//CHECK THIS
////6. Print out the unicode values (base 10) of the above String "Call me Ishmael".
//let cde = "Call me Ishmael"
//for char in cde.utf8 {
//    print("\(String(char)) ", terminator: "") //Encoding of each grapheme cluster for the UTF-8 encoding
//}
//
//7. Print out the unicode values (base 16) of the String "Call me Ishmael" (hint: use the String(format: arguments: terminator:) constructor).
//let abc = "Call me Ishmael"
//for char in abc.utf16 {
//    print("\(String(char)) ", terminator: "") //Encoding of each grapheme cluster for the UTF-16 encoding
//}

//8. Write out the formula for reversing a String.
//let str8 = "Hello, world!"
//let reversed = String(str8.reversed())
//print(reversed)

//NOT SURE
//9. Create the String equivalent of the number 2371.
//var numberFromString = Int("2371")

////10. Given that middle in Chinese is "zhong1", unicode 4e2d, and "kingdom" is "guo2", unicode 570d, print the Chinese characters for China (zhong1 guo2 中国) in unicode.
//let precomposed = "\u{4e2d}\u{570d}"
//print("\u{4e2d}\u{570d}")


//11. Convert the following String to all uppercase: "cal state fullerton".
//var uppercaseCSUF: String = "cal state fullerton".uppercased()

////12. Change all of the vowels in "cal state fullerton" to be 'Z'.
//let str12 = "cal state fullerton"
//
//let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
//var newStr12 = str12
//for vowel in vowels {
//    if str12.contains(vowel) {
//        newStr12 = newStr12.replacingOccurrences(of: vowel, with: "Z")
//    }
//}
//print(newStr12)

////13. In the string "Mississippi", change all instances of "ss" to be replaced by the string: "AMTRAK".
//let str13 = "Mississippi"
//let newStr13 = str13.replacingOccurrences(of: "ss", with: "AMTRAK")
//print(newStr13)

//14. Determine if the String "__add__" has the prefix or suffix: "__".
//let str3 : String = "__add__"
//if(str3.hasSuffix("__")){
//    print("The string has suffix")
//}
//if(str3.hasPrefix("__")){
//    print("The string has prefix")
//}


////15. For the String "__sMubtract__", strip off the prefix/suffix "__" to get just the String "subtract".
//let str15 = "__subtract__"
//let newStr15 = str15.replacingOccurrences(of: "__", with: "")

////16. Using a range, print out all of the cubes (x^3) of x from x=1 to 10 inclusive.
//let oneToTen = 1...10
//for i in oneToTen {
//    print(i*i*i)
//}

////17. Using a range, print out all of the squares (x^2) of x for x=1 to 100 inclusive, using only values of x divisible by 2, 3, or 5.
//let oneToHundred = 1...100
//for i in oneToHundred {
//    if (i % 2 == 0 && i % 3 == 0 && i % 5 == 0) {
//        print(i*i)
//    }
//}

////18.  Write an instance of a variable of type Int that declares the type and its value.
//var int18: Int = 18

////19. Write an Int instance that declares its value but not its type.
//var int19 = 19

//NOT SURE
//20. Write an instance of an Int more than 10000000 that uses underscores.
let _ : Int = 10000002

//21.  Declare several variables (at least five variables of different types) that describe the city of Los Angeles, and print out a String that describes the city.  Your code should include conditional statements (if/else).


//22. Write the code to determine the largest and smallest Int on your system.
let minValue = UInt8.min
let maxValue = UInt8.max

//23. Write the 8-bit Int that represents -1.  Then, write it as an unsigned value.
let a = Int8(-11)


////24.  Create a simple switch that handles the following Web error codes as separate cases.  Don't forget to have a default case.
////400: Bad request
////401: Unauthorized
////403: Forbidden
////404: Not found
//var statusCode: Int = 404
//var errorCode: String
//switch statusCode {
//case 400:
//    errorCode = "Bad request"
//case 401:
//    errorCode = "Unauthorized"
//case 403:
//    errorCode = "Forbidden"
//case 404:
//    errorCode = "Not found"
//default:
//    errorCode = "None"
//}

////25.  Create a different switch statement that handles each of these 400 error codes in a single case.  Don't forget to have a default case.
//var statusCode: Int = 404
//var errorString: String = "The request failed."
//switch statuCodes {
//case 400, 401, 403, 404:
//    errorString = "There was something wrong with the request."
//    fallthrough
//default:
//    errorString += " Please review the request and try again"
//}

////26. Create a switch statement that handles the following ranges of error codes:
////100 or 101: "Informational. 1xx"
////204: "Successful but not content. 204"
////300 to 307: "Redirection. 3xx"
////400 to 505: "Server error"
////otherwise: "Unknown error. Please retry"
//var statusCode: Int = 400
//var errorString: String = "The request failed with an error:"
//switch statusCode {
//case 100, 101:
//    errorString += "Informational, 1xx."
//
//case 204:
//    errorString += "Successful but not content. 204"
//
//case 300...307:
//    errorString += "Redirection, 3xx. "
//
//case 400...417:
//    errorString += " Client error, 4xx."
//
//case 500...505:
//    errorString += " Server error, 5xx."
//
//default:
//    errorString = "Unknown. Please review the request and try again"
//}

//27. Create a named tuple: lname, fname, cwid, gpa, that describes a student using only a typealias similar to this:
//typealias point = (x: Double, y: Double).
//Then, create a student, and print out the tuple's elements.
//typealias Student = (lname: String, fname: String, cwid: Int, gpa: Double)
//func createStudent(student: Student) {
//    print("You've entered, \(student.0), \(student.1), \(student.2), \(student.3)")
//}
//createStudent(student: ("tran","nguyen",890143654, 3.5))


//28.  If you have the following code, let point = (x:1, y:4),
//write a switch that uses cases and where statements to determine if the angle between the point and the x axis is acute, right, obtuse, or straight.

//let point = (x: 4, y: 1)
//switch point {
//case let (x, y) where atan(Double(y) / Double(x)) * 180.0 / Double.pi < 90 && atan(Double(y) / Double(x)) * 180.0 / Double.pi > 0:
//    print("The angle is acute")
//case let (x, y) where atan(Double(y) / Double(x)) * 180.0 / Double.pi > 90 && atan(Double(y) / Double(x)) * 180.0 / Double.pi < 180:
//    print("The angle is obtuse")
//case let (x, y) where atan(Double(y) / Double(x)) * 180.0 / Double.pi == 90:
//    print("The angle is right")
//case let (x, y) where atan(Double(y) / Double(x)) * 180.0 / Double.pi == 180:
//    print("The angle is straight")
//default:
//    break
//}

//29.  Write a switch statement that prints out:
//"I will study Swift every day" 10 times.
//Be sure that each statement is numbered, and that the lines are all
//right-justified.
//1. I will study Swift every day.
//2. I will study Swift every day.
//...
//10. I will study Swift every day.
//for var indextest in 1...10{
//    switch indextest {
//    case 1...10:
//        print("\(indextest). I will study Swift every day ")
//    default:
//        break;
//    }
//}


////30. Print out all of the multiples of 3 from 1 to 30 using a range and a where statement.
//let myRange: CountableRange<Int> = 1..<31
//for var idx in myRange where idx % 3 == 0{
//    print(idx)
//}

//31.  Print out on the same line the tuple of 14.Sep.2017 w/each field separated by a "/".


//32. Write a function that prints out a table of conversions from Fahrenheit to Celsius from -50 F to 150 F, in steps of 10 degrees Fahrenheit. Each line should have the Fahrenheit temperature and the corresponding Celsius temperature. Write the program using functions.
//func printFahtoCel(){
//    var fah : Double = -50
//    var cel : Double = 0
//    print("| Fahrenheit |\tCelcius |")
//
//    while(fah <= 150){
//        cel = ( 5.0 / 9.0) * (fah - 32)
//        print("| \(fah) | \t\(cel) |")
//        fah = fah + 10
//    }
//}
//printFahtoCel()

//33. Write a game that plays craps, a dice game where you roll two dice. If the sum of the dice is 7 on the first roll, you win. Otherwise, that's your spot, and you keep rolling until you hit your spot (you win), or you get seven (now you lose).
// Some of these function signatures may give you a hint

//func rollDie() -> Int {
//            return Int(round(drand48() * 5 + 1))
//}
//func roll() -> (one: Int, two: Int, sum: Int) {
//            // you fill this in
//            let one = rollDie()
//            let two = rollDie()
//            let sum = one + two
//
//            return (one, two, sum)
//
//}
//
//func rolledSpot(spotSum: Int) -> (hitSpot: Bool, bust: Bool) {
//    //    // you fill this in
//            let yourRoll = roll()
//            var hitSpot: Bool
//            var bust: Bool
//
//            if yourRoll.sum == spotSum {
//                        hitSpot = true
//                        bust = false
//                } else if yourRoll.sum == 7 {
//                        hitSpot = false
//                        bust = true
//
//                } else {
//                        hitSpot = false
//                        bust = false
//                }
//            return (hitSpot, bust)
//}
//
//let firstRoll = roll()
//
//if (firstRoll.sum == 7){
//            print("Win on first roll! The two dice add up to 7!")
//} else {
//
//            let spotSum = firstRoll.sum
//            var checkSpot = rolledSpot(spotSum: spotSum)
//            while (!checkSpot.hitSpot) {
//                        if (checkSpot.bust){
//                                    break;
//                            }
//                        checkSpot = rolledSpot(spotSum: spotSum)
//
//                }
//            if (checkSpot.hitSpot){
//                        print("Your roll adds up to your spotSum: \(spotSum)")
//                } else {
//                        print("Your rolls added up to 7 and you loose!")
//                }
//}

