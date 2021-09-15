import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        var strings: [String] = []
        var buffer: String = ""
        for c in s {
            if c != " " {
                buffer.append(c)
            } else {
                if buffer.isEmpty == false {
                    strings.append(buffer)
                    buffer = ""
                }
            }
        }
        
        if buffer.count > 0 {
            strings.append(buffer)
        }
        
        var res: String = ""
        let c = strings.count
        for i in stride(from: c, through: 1, by: -1) {
            let str = strings[i-1]
            res += str
            if i > 1 {
                res.append(" ")
            }
        }
        return res
    }
}


let s = Solution()
let p1 = s.reverseWords("the sky is blue")
print(p1)
let p2 = s.reverseWords("  hello world  ")
print(p2)
