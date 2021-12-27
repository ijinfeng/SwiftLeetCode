import Foundation

// 买卖股票的最佳时机

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        let count = prices.count
        
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 3), count: count)
        // 持有股票
        dp[0][0] = -prices[0]
        // 不持有，且处于冷冻期
        dp[0][1] = 0
        // 不持有，且不处于冷冻期
        dp[0][2] = 0
        
        for i in 1..<count {
            dp[i][0] = max(dp[i-1][0], dp[i-1][2] - prices[i])
            dp[i][1] = dp[i-1][0] + prices[i]
            dp[i][2] = max(dp[i-1][1], dp[i-1][2])
        }
        return max(dp[count - 1][1], dp[count - 1][2])
    }
}
