
# [全排列](https://leetcode-cn.com/problems/permutations)


给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

 

示例 1：
```
输入：nums = [1,2,3]
输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```
示例 2：
```
输入：nums = [0,1]
输出：[[0,1],[1,0]]
```
示例 3：
```
输入：nums = [1]
输出：[[1]]
```

提示：

* 1 <= nums.length <= 6
* -10 <= nums[i] <= 10
* nums 中的所有整数 互不相同

解：
```
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var componse: [Int] = []
        
        for i in 0..<nums.count {
            var _nums = nums
            _nums.remove(at: i)
            componse.append(nums[i])
            getComponse(_nums, &componse, &res)
            componse.removeLast()
        }
        
        return res
    }
    
    
    func getComponse(_ nums: [Int] ,_ componse: inout [Int], _ res: inout [[Int]]) {
        guard nums.count > 0 else {
            res.append(componse)
            return
        }
        for i in 0..<nums.count {
            var _nums = nums
            _nums.remove(at: i)
            componse.append(nums[i])
            getComponse(_nums, &componse, &res)
            componse.removeLast()
        }
    }
}

```
