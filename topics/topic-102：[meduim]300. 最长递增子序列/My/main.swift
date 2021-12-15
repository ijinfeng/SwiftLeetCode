import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // 记录当前递增序列的长度
        let count = nums.count
        var dp = Array.init(repeating: 1, count: nums.count)
    
        var res = 1
        
        for i in 0..<count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        
        return res
    }
}
