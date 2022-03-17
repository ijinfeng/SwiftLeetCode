import Foundation

// 494. 目标和
// 0,1背包问题 https://leetcode-cn.com/problems/target-sum/solution/mu-biao-he-by-leetcode-solution-o0cp/974956

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        /*
         sum(p): +
         sum(n): -
         sum(p) - sum(n) = target
         sum(p) + sum(n) = sum(nums)
         sum(p) + sum(p) - target = sum(nums)
         sum(p) = (sum(nums) + target) / 2
         */
        
        var sum = 0
        for num in nums {
            sum += num
        }
        
        if (sum < target || (sum + target) % 2 == 1) {
            return 0
        }
        
        // dp[i][j] 表示在数组 nums 的前 i 个数中选取元素，使得这些元素之和等于 j 的方案数。
        let w = (sum + target) / 2
        if (w <= 0) {
            return 0
        }
        var dp = Array.init(repeating: Array.init(repeating: 0, count: w + 1), count: nums.count + 1)
        dp[0][0] = 1
        for i in 1...nums.count {
            let num = nums[i - 1]
            for j in 0...w {
                dp[i][j] = dp[i - 1][j]
                if j >= num {
                    dp[i][j] += dp[i-1][j - num]
                }
            }
        }
        return dp[nums.count][w]
    }
}

let s = Solution()
var nums = [100]
let res = s.findTargetSumWays(nums, -200)
print(res)
