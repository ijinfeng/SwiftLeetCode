import Foundation

// https://leetcode-cn.com/problems/largest-number/
// 179. 最大数


// 9 > 89
// 2 > 20
// 2 < 27
// 21 > 20
// 444 > 442

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let newNums = nums.sorted(by: than(_:_:))
        if newNums[0] == 0 {
            return "0"
        }
        var res = ""
        newNums.forEach { num in
            res += String(num)
        }
        return res
    }
    
    // 比较两数大小
    func than(_ num1: Int, _ num2: Int) -> Bool {
        let s1 = String(num1)
        let s2 = String(num2)
        return s1 + s2 > s2 + s1
    }
}

let s = Solution()
let res = s.than(45, 4)
print(res)
