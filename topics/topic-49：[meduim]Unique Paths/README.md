
# [不同路径](https://leetcode-cn.com/problems/unique-paths)

一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

问总共有多少条不同的路径？

 

示例 1：

```
输入：m = 3, n = 7
输出：28
```
示例 2：
```
输入：m = 3, n = 2
输出：3
解释：
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下
```
示例 3：
```
输入：m = 7, n = 3
输出：28
```
示例 4：
```
输入：m = 3, n = 3
输出：6
```


解
```
class Solution {
    
    // 使用动态规划可解
    // 知终点，必定是从其左边，或者是上边那一点下来的
    // 可得动态转移方程：f(m, n) = f(m-1,n) + f(m, n-1)
    // 起点（1，1），终点（m,n）
    
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var res = 0
        var map: [String: Int] = [:]
        for x in 1...n {
            for y in 1...m {
                if x == 1 || y == 1 {
                    res = 1
                    map["\(y),\(x)"] = 1
                } else {
                    res = map["\(y-1),\(x)"]! + map["\(y),\(x-1)"]!
                    map["\(y),\(x)"] = res
                }
            }
        }
        
        return res
    }
}
```
