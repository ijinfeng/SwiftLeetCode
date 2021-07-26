import Foundation

print("Hello world!")


class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var begin = 0
        var end = 0
        
        let sarr = Array(s)
        var p = findVaildLeft(sarr, 0)
        
        while p < sarr.count {
            findVaildEnd(sarr, &begin, &end, p)
            p = findVaildLeft(sarr, p + 1)
        }
        
        if end == begin {
            return 0
        }
        return end - begin + 1
    }
    
    // 寻找有效的')'，并返回其索引
    func findVaildEnd(_ sarr: [String.Element], _ begin: inout Int, _ end: inout Int, _ p: Int) {
        var q = p + 1
        var val = 1
        while q < sarr.count {
            let c = sarr[q]
            if c == "(" {
                val += 1
            } else {
                val -= 1
            }
            if val < 0 { // 说明有无效的')'出现，如：())(。此时应该更新begin的位置
                break
            }
            if val == 0 { // 表示一个有效的闭合
                if q - p > end - begin {
                    begin = p
                    end = q
                    
                    print("end=\(end),begin=\(begin)")
                }
            }
            q += 1
        }
    }
    
    // 寻找第一个有效的 ‘(’
    func findVaildLeft(_ sarr: [String.Element], _ begin: Int) -> Int {
        for i in begin..<sarr.count {
            let c = sarr[i]
            if c == "(" {
                return i
            }
        }
        return sarr.count
    }
}


let s = Solution()
print(s.longestValidParentheses("(((((()))))))))))()()())((((()))()()()()))))"))
