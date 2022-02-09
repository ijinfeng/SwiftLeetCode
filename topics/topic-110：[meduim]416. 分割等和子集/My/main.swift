import Foundation

// 416. 分割等和子集


// 要使得和相等，那么先将所有数相加/2，得到每一份子集的和
// 总和为奇数，直接排除
// 和为偶数，尝试凑出这个和，如果成功，那么表示可以分割，否则就是不可以
// 如何凑出这个和？也就是给定一个数组，如何凑出一个给定的数值？


class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        var sum = 0
        var maxNum = 0
        for num in nums {
            sum += num
            maxNum = max(maxNum, num)
        }
        if sum % 2 != 0 {
            return false
        }
        let half = sum / 2
        print("总和为:\(sum)，半数为：\(half)")
        
        if maxNum > half {
            return false
        }
        
        var dp = Array.init(repeating: Array.init(repeating: false, count: half + 1), count: nums.count)
        for i in 0..<nums.count {
            dp[i][0] = true
        }
        // 其中 dp[i][j] 表示从数组的 [0,i] 下标范围内选取若干个正整数（可以是 0 个）
        dp[0][nums[0]] = true
        for i in 1..<nums.count {
            let num = nums[i]
            for j in 1...half {
                if j >= num {
                    if dp[i - 1][j] || dp[i - 1][j - num] {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = false
                    }
//                    dp[i][j] = dp[i - 1][j] | dp[i - 1][j - num]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[nums.count - 1][half]
    }
}


let s = Solution()
let nums = [1,2,3,4,5,6,7]
let res = s.canPartition(nums)
print(res)
