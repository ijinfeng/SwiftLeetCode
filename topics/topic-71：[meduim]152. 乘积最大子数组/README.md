
# [152. 乘积最大子数组](https://leetcode-cn.com/problems/maximum-product-subarray/)

给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

 

示例 1:

输入: [2,3,-2,4]
输出: 6
解释: 子数组 [2,3] 有最大乘积 6。
示例 2:

输入: [-2,0,-1]
输出: 0
解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。


解：
```
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = Int.min
        var vmin = 1
        var vmax = 1
        let c = nums.count
        for i in 0..<c {
            let num = nums[i]
            if num < 0 {
                let temp = vmin
                vmin = vmax
                vmax = temp
            }
            vmin = min(num * vmin, num)
            vmax = max(num * vmax, num)
            
            res = max(res, vmax)
        }
        return res
    }
}
```
