import Foundation

// 240. 搜索二维矩阵 II

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 左下角的元素是这一行最小的元素，也是这一列最大的元素
        let hcount = matrix.count
        return helper(matrix, hcount - 1, 0, target)
    }
    
    func helper(_ matrix: [[Int]], _ h: Int, _ v: Int, _ target: Int) -> Bool {
        if h < 0 || v >= matrix[0].count {
            return false
        }
        if matrix[h][v] < target {
            // 抛弃最边一列
            return helper(matrix, h, v + 1, target)
        } else if matrix[h][v] > target {
            // 抛弃最下面一行
            return helper(matrix, h - 1, v, target)
        } else {
            return true
        }
    }
}

//let arr = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
let arr = [[1,1]]
//let arr = [[-1, 3]]

let s = Solution()
let res = s.searchMatrix(arr, 1)
print(res)
