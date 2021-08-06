import Foundation

// 最大字序和

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var pre = 0
        for num in nums {
            pre = max(num + pre, num)
            res = max(res, pre)
            print("num=\(num),pre=\(pre),res=\(res)")
        }
        return res
    }
}

let s = Solution()
let res = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
print(res)
