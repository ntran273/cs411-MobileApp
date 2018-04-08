//Nguyen Tran
//890143654

import UIKit

//: Playground - noun: a place where people can play


////1. Create an instance of an immutable String, and print it out.
print("\n#1. Create an instance of an immutable String, and print it out")
let immutableString = "Cannot change"
print(immutableString)

////2. Create an instance of a mutable String, and print it out, then prove that it is mutable.
print("\n#2.Create an instance of a mutable String, and print it out, then prove that it is mutable.")
var can_change = "CSUF is also a baseball titan!"
print(can_change, "(before changing it)")
can_change = "Year-after-year, " + can_change;
print(can_change, "(AFTER changing it)")

//3. Print out all of the characters in the following String: "Teachers open the door; you open by yourself", one by one, using a for loop
print("\n#3. Print out all of the characters in the following String: 'Teachers open the door; you open by yourself', one by one, using a for loop")
let abc = "Teachers open the door; you open by yourself"
for char in abc {
    print(char, terminator: "-")
}

//4. Write out a formula in Swift for printing out the 6th character in the String: "Studying is like rowing upstream: no advance is to drop back." (hint: you will need an Index).
print("\n\n#4. Write out a formula in Swift for printing out the 6th character in the String: 'Studying is like rowing upstream: no advance is to drop back.' (hint: you will need an Index).")
let s = "Studying is like rowing upstream: no advance is to drop back.!"
print(s[s.index(s.startIndex, offsetBy: 6)])

//CHECK
//5. Use the formula you used in the previous problem to print out the 27th character in the String. How are you performing sanity checks?
print("\n\n#5. Use the formula you used in the previous problem to print out the 27th character in the String. How are you performing sanity checks?")
print(s[s.index(s.startIndex, offsetBy: 27)])

//6. Write out a formula in Swift (in one line) for finding the length of the String "In the midst of chaos, there is also opportunity".
print("\n#6. Write out a formula in Swift (in one line) for finding the length of the String 'In the midst of chaos, there is also opportunity'")
let str6 = "In the midst of chaos, there is also opportunity"
print("the length of '\(str6)' is: \(str6.count)\n")

//7. Print out the unicode values (base 16) of the String "With great power comes great responsibility" (hint: use the String(format: arguments: terminator:) constructor).
print("\n#7. Print out the unicode values (base 16) of the String 'With great power comes great responsibility' (hint: use the String(format: arguments: terminator:) constructor).")
var call_me = "With great power comes great responsibility"
for c in call_me.utf16 {
    print(String(format: "%0X", c), terminator: "...")
}

//8. Write out the formula for reversing a String "Who wishes to fight must first count the cost"
print("\n\n#8. Write out the formula for reversing a String: 'Who wishes to fight must first count the cost'")
let str8 = "Who wishes to fight must first count the cost"
let reversed = String(str8.reversed())
print(reversed)

//9. Create the String equivalent of the number 17214.
print("\n\n#9. Create the String equivalent of the number 17214.")
let s17214 = String(format: "%d\n", 17214)
print(s17214)

//10) Split the following String into an Array of words, and sort them in alphabetical order. (Note: Capitalized words will be sorted first). The String is: "Mr and Mrs Potter of Number Four Privet Drive were proud to say that they were perfectly normal thank you very much".
let str10 = "Mr and Mrs Potter of Number Four Privet Drive were proud to say that they were perfectly normal thank you very much"
var str10Array = str10.split(separator: " ")
let sortedstr10 = str10Array.sorted(by: { $0 < $1})
print(sortedstr10)


//11) Using the above String, sort the words into alphabetical order, BUT FIRST make sure that case is ignored
print("\nUsing the above String, sort the words into alphabetical order, BUT FIRST make sure that case is ignored")
let str11 = "Mr and Mrs Potter of Number Four Privet Drive were proud to say that they were perfectly normal thank you very much"
var str11Array = str11.split(separator: " ")
let sortedstr11 = str11Array.sorted(by: { $0 < $1})
print(sortedstr11)

//12) Convert the following String to all lowercase: "CAL STATE FULLERTON".
print("\n#12. Convert the following String to all lowercase: 'CAL STATE FULLERTON'")
var lowercaseCSUF: String = "CAL STATE FULLERTON".lowercased()
print(lowercaseCSUF)

//13. Change the following consonants to words: C → California, S → State, U → University, F → Fullerton, L → Los, A → Angeles: "CSUF, CSULA, and UCLA are great universities"
print("\n#13. Change the following consonants to words: C → California, S → State, U → University, F → Fullerton, L → Los, A → Angeles: 'CSUF, CSULA, and UCLA are great universities'")
var str13 = "CaliforniaStateUniversityFullerton"
str13 = str13.replacingOccurrences(of: "California", with: "C")
str13 = str13.replacingOccurrences(of: "State", with: "S")
str13 = str13.replacingOccurrences(of: "University", with: "U")
str13 = str13.replacingOccurrences(of: "Fullerton", with: "F")
str13 = str13.replacingOccurrences(of: "Los", with: "L")
str13 = str13.replacingOccurrences(of: "Angeles", with: "A")
print("\(str13), CSULA, and UCLA are great universities")

////14.) In the string "PhoenixArizona", change instances of the vowels (aeiou) to be replaced by the string: "?"
print("\n#14. In the string 'PhoenixArizona', change instances of the vowels (aeiou) to be replaced by the string: '?'")
var lower = "PhoenixArizona"
var str14 = lower
for vowel in "aeiou" {
    lower = lower.replacingOccurrences(of: String(vowel), with: "?")
}
print(lower)


///CHECK
//15. Write the code to determine if the String "IONcalculation" has the prefix, suffix, or both for the following string: "ion". Make sure you ignore case.

print("\n#15. Write the code to determine if the String 'IONcalculation' has the prefix, suffix, or both for the following string: 'ion'. Make sure you ignore case.")

let str15 = "IONcalculation"
if (str15.hasPrefix("ion") || str15.hasPrefix("ION")){
    print("\(str15) has the prefix 'ion'")
}
if (str15.hasSuffix("ion") || str15.hasSuffix("ION")){
    print("\(str15) has the suffix 'ion'")
}


////16. For the String "__subtract__", strip off the prefix/suffix "__" to get just the String "subtract".
print("\n#16. For the String '__subtract__', strip off the prefix/suffix '__' to get just the String 'subtract'")
let str16 = "__subtract__"
let newStr16 = str16.replacingOccurrences(of: "__", with: "")
print(newStr16)

////17. ) Using a range, print out in a table, one value per line, the following formula: 3x^2 + 2x + 4, for x= -10 to 10 inclusive.
print("\n#17. Using a range, print out in a table, one value per line, the following formula: 3x^2 + 2x + 4, for x= -10 to 10 inclusive.")
for x in -10...10 {
    print("\(3 * (x * x) + 2 * x + 4)", terminator: " ")
}

////18. Using a range, print out all of the squares (x^2) and cubes (x^3) of x for x=1 to 35 inclusive, using only values of x divisible by 2, 3, or 5
print("\n\n#18.Using a range, print out all of the squares (x^2) and cubes (x^3) of x for x=1 to 35 inclusive, using only values of x divisible by 2, 3, or 5")
for var number1 in 1...35 {
    if (number1 % 2 == 0 || number1 % 3 == 0 || number1 % 5 == 0) {
        print("Square: \(number1 * number1) Cubes: \(number1 * number1 * number1)", terminator: " ")
    }
}

////19.  Write an instance of a variable of type Int that declares the type and its value.
print("\n\n#19.  Write an instance of a variable of type Int that declares the type and its value.")
let var1 : Int = 10
print("let var1 : Int = \(var1)")


////20. Write an Int instance that declares its value but not its type.
print("\n#20. Write an Int instance that declares its value but not its type.")
let var2 = 25
print("let var2 = \(var2)")

//21) Write a function that fills, in descending order, an Int array with the prime numbers less than n. Then call that function with n=100 to fill an array, and print out the array on a single line, e.g., primes (<100, descending) = 97 91 … 5 3 2
print("\n#21. Write a function that fills, in descending order, an Int array with the prime numbers less than n. Then call that function with n=100 to fill an array, and print out the array on a single line, e.g., primes (<100, descending) = 97 91 … 5 3 2")
func printPrimeNumbers(n: Int){
    var primeNum = [Int]()
    var num = n
    while (num != 0){
        if(num % 2 != 0 && num % 3 != 0 && num % 5 != 0 && num % 7 != 0){
            primeNum.append(num)
        }
        num = num - 1
    }
    primeNum.append(7)
    primeNum.append(5)
    primeNum.append(3)
    primeNum.append(2)
    
    for i in 0...(primeNum.count - 1){
        print(primeNum[i], terminator: " ")
    }
}

printPrimeNumbers(n: 100)

//22. Write an instance of an Int more than 10000000 that uses underscores.
print("\n#22. Write an instance of an Int more than 10000000 that uses underscores.")
let bignumber = 10_000_000
print("let bignum = \(bignumber)")

//23.  Declare several variables (at least five variables of different types) that describe the city of Los Angeles, and print out a String that describes the city.  Your code should include conditional statements (if/else).
print("\n#23.  Declare several variables (at least five variables of different types) that describe the city of Los Angeles, and print out a String that describes the city.  Your code should include conditional statements (if/else).")
let la_weather = "sunny and warm"
let la_days_of_sunshine = 320
let la_temp_cels = 25
let la_population = 16_000_000
let la_traffic = "terrible"
let la_annual_precip_cm = 6    // cm
print("LA has \(la_days_of_sunshine) days of annual sunshine, and has average temperature of: \(la_temp_cels) C, and has only: \(la_annual_precip_cm) cm of annual precipitation.")
let sky = (la_days_of_sunshine > 250 ? "sunny" : "cloudy")
var temp : String
if (la_temp_cels < 17) { temp = "cold"
} else if (la_temp_cels < 30) { temp = "warm"
} else { temp = "hot" }
let rain = (la_annual_precip_cm > 50 ? "rainy" : "dry")
print("That is to say, LA's weather is...\(sky), \(temp), and \(rain).")


//24. Write the code to determine the largest and smallest Double on your system.
print("\n#24. Write the code to determine the largest and smallest Int on your system.")
print(DBL_MAX)
print(DBL_MIN)

////25. Create a switch statement that handles the following ranges of error codes:
////100 or 103: "Informational. 1xx"
////200 to 208: "Successful but not content. 204"
////300 to 308: "Redirection. 3xx"
////400 to 451: "Client error"
////500 to 511: "Server error"
////otherwise: "Unknown error. Please retry"
print("\n#25. Create a switch statement that handles the following ranges of error codes")
var errorCode = 204
var result = ""
switch(errorCode) {
case 100...103: result = "Informational. 1xx"
case 200...208: result = "Successful. 204"
case 300...308: result = "Redirection. 3xx"
case 400...451: result = "Client error"
case 500...511: result = "Server error"
default: result = "Unknown error. Please retry"
}
print("Result for errorCode \(errorCode) was: \(result)")


//26.Create a named tuple: name, manufacturer, sku, price, weight, that describes an item in a grocery store using only a typealias. Then, create three different instances of store items, and print them out.
print("\n#26.Create a named tuple: name, manufacturer, sku, price, weight, that describes an item in a grocery store using only a typealias. Then, create three different instances of store items, and print them out.")
typealias item = (name: String, manafacturer: String, sku: String, price: Float, weight: Float)
let item1 = (name: "Macbook PRo", manafacuturer: "Apple", sku: "1EDAD232", price: 1100, weight: 15)
let item2 = (name: "Bunnie Hat", manafacuturer: "Obey", sku: "23DE2039", price: 40.5, weight: 0.5)
let item3 = (name: "Roshes Run", manafacuturer: "Nike", sku: "35DDE332", price: 99, weight: 3)

print("The item 1 is: \(item1)")
print("The item 2 is: \(item2)")
print("The item 3 is: \(item3)")

////27.  Print out all of the multiples of 3 and 7 from 1 to 67 using a range and a where statement
print("\n#27. Print out all of the multiples of 3 and 7 from 1 to 67 using a range and a where statement")
for var idx in 1...67 where idx % 3 == 0 && idx % 7 == 0{
    print(idx, terminator: " ")
}

//28. Print on the same line the tuple of 19.Mar.2018 in this order: mm/yy/dddd, fields separated by a "/"
print("\n\n#28. Print on the same line the tuple of 19.Mar.2018 in this order: mm/yy/dddd, fields separated by a '/'")
let today = (day: 19, month: "Mar", year: 2018)
print("for the date: \(today)...")
print("\(today.month)/\(today.year)/\(today.day)\n")

//29.Write a function that prints out a table of conversions from RMB to USD from 0 RMB to 1000 RMB, in steps of 50 RMB. (Currently, 100 RMB equals $15.80 USD.) Each line should have the number of RMB and the corresponding USD. Write the program using functions.
print("\n#29. Write a function that prints out a table of conversions from RMB to USD from 0 RMB to 1000 RMB, in steps of 50 RMB. (Currently, 100 RMB equals $15.80 USD.) Each line should have the number of RMB and the corresponding USD. Write the program using functions.\n")

func rmb_table() {
    for rmb in stride(from: 0.0, to: 1000.0, by: 50.0) {
        let s = String(format: "%6.2f RMB = $%6.2f USD", rmb, (rmb * 15.8) / 100)
        print(s)
    }
}
rmb_table()


