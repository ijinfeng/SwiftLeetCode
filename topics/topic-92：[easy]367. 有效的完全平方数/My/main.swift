import Foundation


// https://leetcode-cn.com/problems/valid-perfect-square/
// 367. 有效的完全平方数

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 1
        var right = num
        while left <= right {
            let mid = left + (right - left) / 2
            if mid * mid == num {
                return true
            } else if mid * mid < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
    
}


let s = Solution()
let res = s.isPerfectSquare(81)
print(res)
