import Foundation


// 检查是否所有字符出现次数相同

class Solution {
    func areOccurrencesEqual(_ s: String) -> Bool {
        let sarr = Array(s)
        var cmap: [Character: Int] = [:]
        for c in sarr {
            if let count = cmap[c] {
               cmap[c] = count + 1
            } else {
                cmap[c] = 1
            }
        }
        let first = cmap.popFirst()!
        for (_,i) in cmap {
            if i != first.value {
                return false
            }
        }
        return true
    }
}

let s = Solution()
let res = s.areOccurrencesEqual("aaabb")
print(res)
