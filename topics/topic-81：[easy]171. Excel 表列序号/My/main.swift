import Foundation

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        // A: 65 --> 1
        // Z: 90 --> 26
        
        var res = 0
        
        for (i, c) in columnTitle.reversed().enumerated() {
            if let value = c.unicodeScalars.first?.value {
                let realValue = value - 64
                
                print("\(i) | \(c)")
                
                res = res + Int(pow(Float(26), Float(i))) * Int(realValue)
            
            }
        }
        
        return res
    }
}

let s = Solution()
let res = s.titleToNumber("ZZ")
print(res)
