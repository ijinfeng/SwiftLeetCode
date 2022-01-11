import Foundation

// 322. 零钱兑换



// 解1:动态规划
class Solution {
    // f(a) = f(a - c) + 1
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array.init(repeating: amount + 1, count: amount + 1)
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


class Solution2 {
    var current = 0
    var count = 0
    var res = 0
    // f(a) = f(a - c) + 1
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        res = Int.max
        for i in stride(from: coins.count-1, through: 0, by: -1) {
            let v = coins[i]
            current = amount
            if v > current {
                continue
            }
            count += 1
            current -= v
            dfs(coins)
            current += v
            count -= 1
        }
        return res > amount ? -1 : res
    }
    
    func dfs(_ coins: [Int]) {
        if current == 0 {
            res = min(count, res)
            // 找到一种组合
          return
        }
        for i in stride(from: coins.count-1, through: 0, by: -1) {
            let v = coins[i]
            if v > current {
                continue
            }
            count += 1
            current -= v
            dfs(coins)
            current += v
            count -= 1
        }
    }
}


let s = Solution2()
let res = s.coinChange([1, 2,5], 100)
print(res)

