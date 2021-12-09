import Foundation

class Solution {
    // 先找到最接近他的最大整数
    // 12 -》 （3）
    
    
    func numSquares(_ n: Int) -> Int {
        var dp = Array.init(repeating: 0, count: n + 1)
        for i in 1...n {
            var minv = i
            
            var j = 1
            while j * j <= i {
                minv = min(minv, dp[i - j * j])
                j += 1
            }
            dp[i] = minv + 1
            
            print("dp[\(i)]=\(dp[i])")
        }
        return dp[n]
    }
}

let s = Solution()
let res = s.numSquares(12)

