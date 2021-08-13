import Foundation

class Solution {
    // 动态规划
    // 状态转移方程 f(n) = f(n-1) + f(n-2)
    
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var dp = [Int].init(repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2
        for i in 2..<n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n-1]
    }
}
