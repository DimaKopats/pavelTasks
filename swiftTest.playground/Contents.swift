//: Playground - noun: a place where people can play

import UIKit

let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

//print("\(quotation)")

print("🐥")

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let myString = "123"

print("\(myString.startIndex)")
print("\(myString.endIndex)")


let greeting1 = "Guten Tag!"
for index in greeting1.indices {
    
    print("\(greeting1[index])", terminator: " ")
}

//print("\n\n\(greeting.indices)")

// "Voulez-vous un café?" используем LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
// "Voulez-vous un café?" используем LATIN SMALL LETTER E и COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("\nЭти строки считаются равными")
}
