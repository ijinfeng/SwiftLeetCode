
# [200. 岛屿数量](https://leetcode-cn.com/problems/number-of-islands/)

给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

 

示例 1：

输入：grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
输出：1
示例 2：

输入：grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
输出：3
 

提示：

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] 的值为 '0' 或 '1'

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/number-of-islands
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


解:
```swift
class Solution {
    var row = 0
    var column = 0
    var _grid: [[Character]]!
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var num = 0
        column = grid[0].count
        row = grid.count
        _grid = grid
        for i in 0..<row {
            for j in 0..<column {
                if _grid[i][j] == "1" {
                    infect(i, j)
                    num += 1
                }
            }
        }
        return num
    }
    
    func infect(_ i: Int, _ j: Int) {
        if i < 0 || i >= row || j < 0 || j >= column || _grid[i][j] != "1" {
            return
        }
        _grid[i][j] = "2"
        infect(i + 1, j)
        infect(i, j + 1)
        infect(i - 1, j)
        infect(i, j - 1)
    }
}

```
