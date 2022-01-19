import Foundation


// 394. 字符串解码

class Solution {
    func decodeString(_ s: String) -> String {
        var res = ""
        
        // 通过栈的方式
        var stack: [String] = []
        var i = 0
        var nums = ""
        while i < s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            if isNum(c) {
                nums.append(c)
                i += 1
            } else {
                if !nums.isEmpty {
                    stack.append(nums)
                    nums = ""
                }
                if c == "]" {
                    var str: [String] = []
                    // 出栈
                    while let last = stack.last, last != "[" {
                        str.append(stack.popLast()!)
                    }
                    
                    // 把‘[’也出栈
                    let _ = stack.popLast()
                    
                    var repeatStr = ""
                    for s in str.reversed() {
                        repeatStr.append(s)
                    }
                    repeatStr = String.init(repeating: repeatStr, count: Int(stack.popLast()!) ?? 1)
                    stack.append(repeatStr)
                } else {
                    // 字母和‘[’
                    stack.append(String.init(c))
                }
                i += 1
            }
            print("i=\(i), c=\(c), stack=\(stack), nums=\(nums)")
        }
        
        for str in stack {
            res += str
        }
        
        return res
    }
    
    // 是否为数字
    func isNum(_ c: Character) -> Bool {
        if c.isASCII {
            let cf = c.unicodeScalars.first?.value ?? 0
            if cf >= 48 && cf <= 57 {
                return true
            }
        }
        return false
    }
}


let s = Solution()
let res = s.decodeString("3[a2[c]]")
print(res)



