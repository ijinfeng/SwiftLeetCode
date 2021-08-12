import Foundation

// 最小路径和

class Solution {
    // 动态规划
    // f(m,n) = f(m-1,n) + f(m,n-1)
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid[0].count
        let n = grid.count
        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
        for x in 0..<m {
            for y in 0..<n {
                if x == 0 && y == 0 {
                    dp[x][y] = grid[y][x]
                } else if x == 0 && y > 0 {
                    dp[x][y] = grid[y][x] + dp[x][y - 1]
                } else if x > 0 && y == 0 {
                    dp[x][y] = grid[y][x] + dp[x - 1][y]
                } else {
                    dp[x][y] = min(dp[x-1][y], dp[x][y-1]) + grid[y][x]
                }
            }
        }
        return dp[m-1][n-1]
    }
    
}


let s = Solution()
let res = s.minPathSum([[1,2,3],[4,5,6]])
print(res)
