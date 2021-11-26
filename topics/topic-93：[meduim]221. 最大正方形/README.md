
# [221. 最大正方形](https://leetcode-cn.com/problems/maximal-square/)

在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。

 

示例 1：


输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
输出：4
示例 2：


输入：matrix = [["0","1"],["1","0"]]
输出：1
示例 3：

输入：matrix = [["0"]]
输出：0
 

提示：

m == matrix.length
n == matrix[i].length
1 <= m, n <= 300
matrix[i][j] 为 '0' 或 '1'

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/maximal-square
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


``` swift
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
```
