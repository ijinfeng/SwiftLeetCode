import Foundation

// https://leetcode-cn.com/contest/weekly-contest-259/problems/sum-of-beauty-in-the-array/

// i的范围：1 <= i <= nums.length - 2

// 情况1.美丽值=======2
// j的范围：0 <= j <= i -1
// k的范围：i+1 <= k <= nums.length - 1
// 满足：nums[j] < nums[i] < nums[k]
// 设 i = 4，如何得知 nums[0...3] < nums[4] ?
// dp数组定义如下
// dp[x][y] = nums[x] < nums[y]


// 情况2.美丽值=======1
// 满足：nums[i-1] < nums[i] < nums[i+1]


// 情况3.美丽值=======0
// 以上都不满足的时候

// 假设nums的length==100
// 当 i == 1 的时候，j==0，k==[2...99]
// if nums[0] < nums[1] < nums[2...99] {
//      v = 2
// } else if nums[0] < nums[1] < nums[2] {
//      v = 1
// } else {
//      v = 0
// }

// 动态规划

class Solution {
    func sumOfBeauties(_ nums: [Int]) -> Int {
        let c = nums.count
        var res = 0
        
        // 记录之前不行的j
        var pre: [Int] = Array.init(repeating: 0, count: c)
        var suf: [Int] = Array.init(repeating: 0, count: c)
        pre[0] = nums[0]
        for i in 1..<c {
            pre[i] = max(pre[i-1], nums[i])
        }
        suf[c-1] = nums[c-1]
        for i in stride(from: c-2, through: 0, by: -1) {
            suf[i] = min(suf[i+1], nums[i])
        }
        
        for i in 1..<c-1 {
            if pre[i-1] < nums[i] && nums[i] < suf[i+1] {
                res += 2
            } else if nums[i-1] < nums[i] && nums[i] < nums[i+1] {
                res += 1
            }
        }
        
        return res
    }
}



let s = Solution()
let res = s.sumOfBeauties([2,4,6,4])
print(res)
