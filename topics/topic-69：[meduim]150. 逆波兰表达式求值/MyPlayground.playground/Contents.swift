import UIKit



class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        
        // +
        func add(_ v1: Int, _ v2: Int) -> Int {
            return v1 + v2
        }
        
        // -
        func subtract(_ v1: Int, _ v2: Int) -> Int {
            return v1 - v2
        }
        
        // *
        func multiply(_ v1: Int, _ v2: Int) -> Int {
            return v1 * v2
        }
        // /
        func divide(_ v1: Int, _ v2: Int) -> Int {
            return v1 / v2
        }
        
        
        var values: [Int] = []
        let `operator`: [String: (Int, Int) -> Int] = ["+": add, "-": subtract, "*": multiply, "/": divide]
        for token in tokens {
            if let f = `operator`[token] {
                let v2 = values.popLast()
                let v1 = values.popLast()
                values.append(f(v1!, v2!))
            } else {
                values.append(Int(token)!)
            }
        }
        return values[0]
    }
}


let s = Solution()
s.evalRPN(["2","1","+","3","*"])

