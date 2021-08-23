
# [96. 不同的二叉搜索树](https://leetcode-cn.com/problems/unique-binary-search-trees/)


给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树 有多少种？返回满足题意的二叉搜索树的种数。

 

示例 1：

```
输入：n = 3
输出：5
```
示例 2：
```
输入：n = 1
输出：1
```

提示：

* 1 <= n <= 19

解

```
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
```
