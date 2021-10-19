import Foundation


// https://leetcode-cn.com/problems/number-of-islands/
// 200. 岛屿数量

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
