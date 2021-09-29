
# [172. 阶乘后的零](https://leetcode-cn.com/problems/factorial-trailing-zeroes/)


给定一个整数 n ，返回 n! 结果中尾随零的数量。

提示 n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1

 

示例 1：

输入：n = 3
输出：0
解释：3! = 6 ，不含尾随 0
示例 2：

输入：n = 5
输出：1
解释：5! = 120 ，有一个尾随 0
示例 3：

输入：n = 0
输出：0
 

提示：

0 <= n <= 104
 

解：
```
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var count = 0
        var _n = n
        while _n > 0 {
            _n /= 5
            count += _n
        }
        return count
    }
}
```
