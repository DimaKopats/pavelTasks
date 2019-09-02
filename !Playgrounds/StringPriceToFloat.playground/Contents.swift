import UIKit

public extension String {
    var stringByRemovingPriceInfo: String {
        let removeCharacters: [String] = ["€", "R$", "$", " ", ".00"]
        var value: String = self
        removeCharacters.forEach { character in
            value = value.replacingOccurrences(of: character, with: "")
        }
        
        let comma = ","
        let dot = "."
        // check the option when a comma is used to divide the whole part and the number of cents, for example, "$3,99"
        if value.contains(comma) && !value.contains(dot) && value.split(separator: ",").last?.count == 2 {
            value = value.replacingOccurrences(of: comma, with: dot)
        } else {
            value = value.replacingOccurrences(of: comma, with: "")
        }
        
        return value
    }
}

let string32 = "32,"
let string319500 = "3,195.00"
let string39501 = "395.01"
let string39500 = "395.00"
let string39601 = "396,01"
let string39600 = "396,00"
let string397 = "397"


print(string32.stringByRemovingPriceInfo)
print(string319500.stringByRemovingPriceInfo)
print(string39501.stringByRemovingPriceInfo)
print(string39500.stringByRemovingPriceInfo)
print(string39601.stringByRemovingPriceInfo)
print(string39600.stringByRemovingPriceInfo)
print(string397.stringByRemovingPriceInfo)

Float(string32.stringByRemovingPriceInfo)
Float(string319500.stringByRemovingPriceInfo)
Float(string39501.stringByRemovingPriceInfo)
Float(string39500.stringByRemovingPriceInfo)
Float(string39601.stringByRemovingPriceInfo)
Float(string39600.stringByRemovingPriceInfo)
Float(string397.stringByRemovingPriceInfo)



