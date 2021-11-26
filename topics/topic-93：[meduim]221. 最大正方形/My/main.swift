import Foundation

// 221.最大正方形

// dp[i][j] = 记录连续为1的最大变长
// dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var res = 0
        let vcount = matrix.count
        let hcount = matrix[0].count
        
        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: hcount), count: vcount)
        
        for i in 0..<vcount {
            let vmatrix = matrix[i]
            for j in 0..<hcount {
                let c = vmatrix[j]
                if c == "0" {
                    dp[i][j] = 0
                } else {
                    if i < 1 || j < 1 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i-1][j-1], min(dp[i-1][j], dp[i][j-1]))  + 1
                    }
                }
                res = max(res, dp[i][j])
            }
        }
        
        return res * res
    }
}

let s = Solution()
//let res = s.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
let res = s.maximalSquare([["0","1"],["1","0"]])
print(res)
