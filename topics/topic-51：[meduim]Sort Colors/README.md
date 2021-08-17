
# [颜色分类](https://leetcode-cn.com/problems/sort-colors/)


给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 

示例 1：
```
输入：nums = [2,0,2,1,1,0]
输出：[0,0,1,1,2,2]
```
示例 2：
```
输入：nums = [2,0,1]
输出：[0,1,2]
```
示例 3：
```
输入：nums = [0]
输出：[0]
```
示例 4：
```
输入：nums = [1]
输出：[1]
```
提示：

* n == nums.length
* 1 <= n <= 300
* nums[i] 为 0、1 或 2

解：
```
// 0,1,2
// 定义left和right
// 将2往right方向移动
// 将0往0方向移动
// right > left
// current < right

class Solution {
    func sortColors(_ nums: inout [Int]) {
        let count = nums.count
        var left = 0
        var right = count - 1
        var index = 0
        while index <= right {
            if nums[index] == 0 {
              let temp = nums[left]
                nums[left] = nums[index]
                nums[index] = temp
                left += 1
                index += 1
            } else if nums[index] == 2 {
                let temp = nums[right]
                nums[right] = nums[index]
                nums[index] = temp
                // 因为我右侧的数据不知道，因此index不需要变，只要将右侧的索引往左移即可
                right -= 1
            } else {
                index += 1
            }
            print("arr=\(nums),index=\(index),left=\(left),right=\(right)")
        }
    }
}

```
