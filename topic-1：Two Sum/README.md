
# 两数之和


> 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。<br>
你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。<br>
你可以按任意顺序返回答案。<br>

示例 1:
``` 
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
```

示例 2：
```
 输入：nums = [3,2,4], target = 6
 输出：[1,2]
```

示例 3：
```
 输入：nums = [3,3], target = 6
 输出：[0,1]
```

### 思路

1、暴力破解法，通过枚举值 `x`，查找后面元素是否为 `target-x`。此算法时间复杂度为O(N^2)，空间复杂度为O(1)
2、通过枚举数组 `num` 得值 `x`，去字典 `dic` 中获取 `target-x`，如果获取不到，那么将 `x` 存入 `dic` 中，以字典的特性降低时间复杂度。此算法时间复杂度为O(1)，空间复杂度为O(N)

### 解题

解1：
```Swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count <= 1 {
        return []
    }
    for i in 0..<nums.count  {
        let n1 = nums[i]
        for j in i+1..<nums.count {
            if n1 + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}
```

解2：
```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count <= 1 {
        return []
    }
    var dic = [Int:Int]()
    for i in 0..<nums.count {
        let n = nums[i]
        if let index = dic[target - n] {
            return [index, i]
        }
        dic[n] = i
    }
    return []
}
```
