# [179. 最大数](https://leetcode-cn.com/problems/largest-number/)


给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。

注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。

 

示例 1：

输入：nums = [10,2]
输出："210"
示例 2：

输入：nums = [3,30,34,5,9]
输出："9534330"
示例 3：

输入：nums = [1]
输出："1"
示例 4：

输入：nums = [10]
输出："10"
 

提示：

1 <= nums.length <= 100
0 <= nums[i] <= 109


解：
```
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let newNums = nums.sorted(by: than(_:_:))
        if newNums[0] == 0 {
            return "0"
        }
        var res = ""
        newNums.forEach { num in
            res += String(num)
        }
        return res
    }
    
    // 比较两数大小
    func than(_ num1: Int, _ num2: Int) -> Bool {
        let s1 = String(num1)
        let s2 = String(num2)
        return s1 + s2 > s2 + s1
    }
}
```
