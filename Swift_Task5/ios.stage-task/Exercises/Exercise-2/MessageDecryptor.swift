import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var numberArray = [String]()
        var stringArray = [String]()
        var result = ""
        var string = ""
        
        for char in message {
            
            if char.isNumber {
                
                string = string + String(char)
                
            } else if char == "[" {
                
                if string.isEmpty {
                    
                    numberArray.append("1")
                    
                } else {
                    
                    numberArray.append(string)
                    
                }
                
                string = ""
                stringArray.append(result)
                result = ""
                
            } else if char == "]" {
                var helpString = ""
                
                if let number = Int(numberArray.popLast() ?? "1") {
                    
                    for _ in 0..<number {
                        helpString += result
                    }
                }
                
                guard let newStringArray = stringArray.popLast() else { return "" }
                
                result = newStringArray + helpString
                
            } else if char.isLetter {
                result.append(char)
            }
        }
        
        return result
    }

}
