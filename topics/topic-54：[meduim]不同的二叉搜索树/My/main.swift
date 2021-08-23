import Foundation

// 不同的二叉搜索树

// 二叉搜索树：
// 左节点 < 父节点 < 右节点


class Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var g = [Int].init(repeating: 0, count: n+1)
        g[0] = 1
        g[1] = 1
        for i in 2...n {
            for j in 1...i {
                g[i] += g[j - 1] * g[i - j]
            }
        }
        return g[n]
    }
}

let s = Solution()
let res = s.numTrees(3)
print(res)
