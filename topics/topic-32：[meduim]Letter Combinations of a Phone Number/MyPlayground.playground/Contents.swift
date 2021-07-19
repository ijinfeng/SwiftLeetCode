import UIKit


// 电话号码的字母组合

class Solution {
    let numMap: [String.Element: [String]] = ["1": [], "2": ["a", "b", "c"], "3": ["d", "e", "f"],"4": ["g","h","i"], "5": ["j", "k", "l"], "6": ["m","n","o"], "7": ["p","q","r","s"],"8": ["t","u","v"],"9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        guard let first = digits.first else {
            return []
        }
        var i = 1
        var last: [String] = numMap[first] ?? []
        while i < digits.count {
            let next = digits[digits.index(digits.startIndex, offsetBy: i)]
            last = getComine(last, numMap[next] ?? [])
            i += 1
        }
        return last
    }
    
    // 每次都是两个数组合并一次，依次往下推
    func getComine(_ a1: [String], _ a2: [String]) -> [String] {
        var s: [String] = []
        if a1.count == 0 {
            s = a2
        } else if a2.count == 0 {
            s = a1
        } else {
            for s1 in a1 {
                for s2 in a2 {
                    s.append(s1.appending(s2))
                }
            }
        }
        return s
    }
}


let s = Solution()
s.letterCombinations("2")
