import Foundation

// 跳跃游戏


// 对于位置 i, 可以跳跃的距离位 0,1,2,...nums[i]
// 当对于位置 x，如果可以得到 x + nums[i] >= nums.count，那么我们就算可达
// 而位置 x怎么到达？它是由前一个位置 y 的到（y < x）

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



// 贪心算法
//class Solution {
//    func canJump(_ nums: [Int]) -> Bool {
//        let count = nums.count
//        var maxJump = 0
//        // 记录最远可达
//        for i in 0..<count {
//            if i <= maxJump {
//                maxJump = max(maxJump, i + nums[i])
//                if maxJump >= count - 1 {
//                    return true
//                }
//            } else {
//                return false
//            }
//        }
//        return false
//    }
//}


let s = Solution()
let res = s.canJump([3,2,1,0,4])
print(res)
