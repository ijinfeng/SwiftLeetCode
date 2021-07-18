
# 三数之和

给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。


示例 1：
```
输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
```
示例 2：
```
输入：nums = []
输出：[]
```
示例 3：
```
输入：nums = [0]
输出：[]
```


提示：

* 0 <= nums.length <= 3000
* -105 <= nums[i] <= 105


解
```
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if  nums.count < 3 {
            return []
        }
        let _nums = nums.sorted(by: <)
        var res: [[Int]] = []
        
        print(_nums)
        
        for i in 0..<_nums.count {
            if i > 0 && _nums[i] == _nums[i - 1] {
                continue
            }
            var k = _nums.count - 1
            let target = -_nums[i]
            for j in i+1..<_nums.count {
                if j > i + 1 && _nums[j] == _nums[j - 1] {
                    continue
                }
                while j < k && _nums[j] + _nums[k] > target   {
                    k -= 1
                }
                if j == k {
                    break
                }
                if _nums[j] + _nums[k] == target {
                    res.append([_nums[i], _nums[j], _nums[k]])
                }
            }
        }
        print(res)
        return res
    }
}

```

