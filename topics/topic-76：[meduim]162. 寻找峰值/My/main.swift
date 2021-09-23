import Foundation

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let count = nums.count
        var left = 0
        var right = count - 1
        while right > left {
            let mid = (right + left) / 2
            if nums[mid] > nums[mid+1] && mid > 0 && nums[mid] > nums[mid-1]  {
                return mid
            } else if nums[mid] > nums[mid+1] {
                // 注意 nums[-1] = nums[n] = -∞ 。因此最小和最大位置处必定有可能存在峰值
                right = mid-1
            } else {
                left = mid+1
            }
        }
        return left
    }
}

let s = Solution()
let res = s.findPeakElement([1,2,3,1])
print(res)
