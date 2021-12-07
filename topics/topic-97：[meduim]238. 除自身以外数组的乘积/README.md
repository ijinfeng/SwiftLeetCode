# [238. 除自身以外数组的乘积](https://leetcode-cn.com/problems/product-of-array-except-self/)

给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。

 

示例:

输入: [1,2,3,4]
输出: [24,12,8,6]
 

提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。

说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。

进阶：
你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/product-of-array-except-self
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


```swift
// 左右乘积法
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        let count = nums.count
//        var left = Array.init(repeating: 1, count: count)
//        var right = Array.init(repeating: 1, count: count)
//
//        for i in 1..<count {
//            left[i] = left[i - 1] * nums[i - 1]
//        }
//        for i in stride(from: count - 2, through: 0, by: -1) {
//            right[i] = right[i + 1] * nums[i + 1]
//        }
//
//        var res = Array.init(repeating: 1, count: count)
//
//        for i in 0..<count {
//            res[i] = left[i] * right[i]
//        }
//        return res
//    }
//}

// 优化
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var res = Array.init(repeating: 1, count: count)
        
        for i in 1..<count {
            res[i] = res[i - 1] * nums[i - 1]
        }
        var right = 1
        for i in stride(from: count - 1, through: 0, by: -1) {
            res[i] = res[i] * right
            right *= nums[i]
        }
        
        return res
    }
}

```
