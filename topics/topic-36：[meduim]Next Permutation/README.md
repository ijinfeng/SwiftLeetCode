
# [下一个排列](https://leetcode-cn.com/problems/next-permutation/)

实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

必须 原地 修改，只允许使用额外常数空间。


示例 1：
```
输入：nums = [1,2,3]
输出：[1,3,2]
```
示例 2：
```
输入：nums = [3,2,1]
输出：[1,2,3]
```
示例 3：
```
输入：nums = [1,1,5]
输出：[1,5,1]
```
示例 4：
```
输入：nums = [1]
输出：[1]
```

提示：

* 1 <= nums.length <= 100
* 0 <= nums[i] <= 100

解：
```
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        next(&nums, nums.count - 2)
    }
    
    
    func next(_ nums: inout [Int], _ index: Int) {
        if index < 0 {
            print("---------> 来了， \(nums)")
            // 返回最大
            for i in 0..<nums.count {
                for j in i+1..<nums.count {
                    if nums[i]>nums[j] {
                        swapNums(&nums, i, j)
                    }
                }
            }
            return
        }
        if nums[index] < nums[index + 1] {
            // 这里需要找出第一个大于下标为 index 的值
            var target = index + 1
            for i in index+1..<nums.count {
                if nums[i] > nums[index] {
                    if nums[i] < nums[target] {
                        target = i
                    }
                }
            }
            swapNums(&nums, index, target)
            // p+1
            // nums.count - 1
            for i in index+1..<nums.count {
                for j in i+1..<nums.count {
                    if nums[i]>nums[j] {
                        swapNums(&nums, i, j)
                    }
                }
            }
        } else {
            next(&nums, index - 1)
        }
    }
    
    func swapNums(_ nums: inout [Int] ,_ index1: Int, _ index2: Int) {
        let left = nums[index1]
        let right = nums[index2]
        nums[index1] = right
        nums[index2] = left
        print("=====> \(nums), index1=\(index1),left=\(left),index2=\(index2),right=\(right)")
    }
}
```
