import Foundation

// 322. 零钱兑换

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if (amount == 0) { return 0 }
        // 当金额为i时，所需最小金币数
// dp[i] = dp[i - coins[j]] + 1
        var dp = Array.init(repeating: amount + 1, count: amount + 1)
        // 金额为0时，有0个数量
        dp[0] = 0
        for i in 1...amount {
            for j in 0..<coins.count {
                if coins[j] <= i {
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

let s = Solution()
let res = s.coinChange([1], 0)
print(res)
