import Foundation

// https://leetcode-cn.com/problems/house-robber/
// 198. 打家劫舍

// 动态规划做
// 2 7 9 3 1
// 2 7 9
// 2 7 9 3
// 2 7 9 3 1


class Solution {
    func rob(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        if count == 1 {
            return nums[0]
        }
        var dp: [Int] = Array.init(repeating: 0, count: count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<count {
            dp[i] = max(dp[i-2] + nums[i], dp[i - 1])
        }
        return dp[count-1]
    }
}

let s = Solution()
let res = s.rob([0])
print(res)
