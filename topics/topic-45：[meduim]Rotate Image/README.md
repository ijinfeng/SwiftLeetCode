
# [旋转图像](https://leetcode-cn.com/problems/rotate-image)

给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。

 

示例 1：

```
输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[[7,4,1],[8,5,2],[9,6,3]]
```
示例 2：

```
输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
```
示例 3：
```
输入：matrix = [[1]]
输出：[[1]]
```
示例 4：
```
输入：matrix = [[1,2],[3,4]]
输出：[[3,1],[4,2]]
```

提示：

* matrix.length == n
* matrix[i].length == n
* 1 <= n <= 20
* -1000 <= matrix[i][j] <= 1000

解1
```
// 使用额外矩阵
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var res: [[Int]] = []
        let count = matrix.count
        for i in 0..<count {
            var m: [Int] = []
            for j in stride(from: count-1, to: -1, by: -1) {
                let arr = matrix[j]
                m.append(arr[i])
            }
            res.append(m)
        }
        matrix = res
    }
}
```


解2
```
// 先水平翻转，后对角线翻转
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count
        for i in 0..<count/2 {
            for j in 0..<count {
               let t = matrix[i][j]
                matrix[i][j] = matrix[count - 1 - i][j]
                matrix[count - 1 - i][j] = t
            }
        }
        for i in 0..<count {
            for j in i..<count {
                let t = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = t
            }
        }
    }
}
```

解3
```
// 原地旋转
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count
        // 循环层数
        for i in 0..<count/2 {
            print("========i=\(i)")
            // 列
            for j in 0..<(count+1)/2 {
                let t = matrix[i][j]
                print("-------j=\(j)")
                // 每一边的对应元素旋转
                // 从左下角开始，逆时针赋值
                matrix[i][j] = matrix[count - 1 - j][i]
                
                matrix[count - 1 - j][i] = matrix[count - 1 - i][count - 1 - j]
                
                matrix[count - 1 - i][count - 1 - j] = matrix[j][count - 1 - i]
                
                matrix[j][count - 1 - i] = t
            }
        }
    }
}

```
