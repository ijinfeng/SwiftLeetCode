# [跳跃游戏](https://leetcode-cn.com/problems/jump-game)

给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个下标。

 

示例 1：
```
输入：nums = [2,3,1,1,4]
输出：true
解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
```
示例 2：
```
输入：nums = [3,2,1,0,4]
输出：false
解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
```

解1
```
// 贪心算法
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let count = nums.count
        var maxJump = 0
        // 记录最远可达
        for i in 0..<count {
            if i <= maxJump {
                maxJump = max(maxJump, i + nums[i])
                if maxJump >= count - 1 {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
}
```

解2
```
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let count = nums.count
        var lastPosition = count - 1
        for i in stride(from: count - 1, through: 0, by: -1) {
            let num = nums[i]
            if num == 0 {
                continue
            } else {
                if i + nums[i] >= lastPosition {
                    lastPosition = i
                }
            }
        }
        return lastPosition == 0
    }
}
```
