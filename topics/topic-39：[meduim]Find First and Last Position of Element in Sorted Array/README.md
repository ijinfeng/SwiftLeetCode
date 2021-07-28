
# [在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)


给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 target，返回 [-1, -1]。

进阶：

* 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
 

示例 1：
```
输入：nums = [5,7,7,8,8,10], target = 8
输出：[3,4]
```
示例 2：
```
输入：nums = [5,7,7,8,8,10], target = 6
输出：[-1,-1]
```
示例 3：
```
输入：nums = [], target = 0
输出：[-1,-1]
```

解：
```
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var l = 0
        var r = count - 1
        
        while l <= r {
            let mid = (r - l) / 2 + l
            if nums[mid] == target {
                // 双指针查找 begin 和 end
                var begin = mid
                var end = mid
                var enter = true
                
                while enter {
                    enter = false
                    if begin > 0 && nums[begin - 1] == target {
                        begin -= 1
                        enter = true
                    }
                    if end < count - 1 && nums[end + 1] == target {
                        end += 1
                        enter = true
                    }
                }
                return [begin, end]
            } else {
                // 继续找target
                if nums[mid] < target {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        
        return [-1, -1]
    }
}
```
