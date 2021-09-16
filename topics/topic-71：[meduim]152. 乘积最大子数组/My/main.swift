import Foundation

// 遇到负数前，先记录下最大值
// 最大的乘积，要不以负数分割，要不以0分割

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = Int.min
        var vmin = 1
        var vmax = 1
        let c = nums.count
        for i in 0..<c {
            let num = nums[i]
            if num < 0 {
                let temp = vmin
                vmin = vmax
                vmax = temp
            }
            vmin = min(num * vmin, num)
            vmax = max(num * vmax, num)
            
            res = max(res, vmax)
        }
        return res
    }
}

let s = Solution()
let res = s.maxProduct([-3,-1,-1])
print(res)
