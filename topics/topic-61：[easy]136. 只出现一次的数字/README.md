
# [只出现一次的数字](https://leetcode-cn.com/problems/single-number/)

给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

说明：

> 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

示例 1:
```
输入: [2,2,1]
输出: 1
```
示例 2:
```
输入: [4,1,2,1,2]
输出: 4
```

解：
```swift
class Solution {
    
    // 异或：相同为1，不同为0
    // 0 ^ x = x: 0异或任何数，结果为任何数
    // 异或满足交换律和结合律： a ^ b ^ c = a ^ c ^ b = c ^ (b ^ a)
    
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
        return res
    }
    
}
```
