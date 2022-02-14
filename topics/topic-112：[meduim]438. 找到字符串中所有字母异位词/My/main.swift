import Foundation

// 438. 找到字符串中所有字母异位词

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count {
            return []
        }
        
        // 滑动窗口
        var sarr = Array.init(repeating: 0, count: 26)
        var parr = Array.init(repeating: 0, count: 26)
        
        var _s = Array(s)
        var _p = Array(p)
        
        var res: [Int] = []
        
        for i in 0..<p.count {
//            let c = Int(s[s.index(s.startIndex, offsetBy: i)].unicodeScalars.first?.value ?? 0) - 97
            let c = Int(_s[i].unicodeScalars.first?.value ?? 0) - 97
            sarr[c] += 1
            let pc = Int(_p[i].unicodeScalars.first?.value ?? 0) - 97
//            let pc = Int(p[p.index(p.startIndex, offsetBy: i)].unicodeScalars.first?.value ?? 0) - 97
            parr[pc] += 1
        }
        
        if sarr == parr {
            res.append(0)
        }
        
        print(sarr)
        print(parr)
        
        print("-------")
        
        var ptr = 1
        while ptr <= s.count - p.count {
//            var c = Int(s[s.index(s.startIndex, offsetBy: ptr - 1)].unicodeScalars.first?.value ?? 0) - 97
            var c = Int(_s[ptr - 1].unicodeScalars.first?.value ?? 0) - 97
            sarr[c] -= 1
            c = Int(_s[ptr + p.count - 1].unicodeScalars.first?.value ?? 0) - 97
//            c = Int(s[s.index(s.startIndex, offsetBy: ptr + p.count - 1 )].unicodeScalars.first?.value ?? 0) - 97
            sarr[c] += 1
            
            print("\(ptr), \(sarr)")
            if sarr == parr {
                res.append(ptr)
            }
            ptr += 1
        }
        
        return res
    }
}


let s = Solution()
let res = s.findAnagrams("cbaebabacd", "abc")
print(res)
