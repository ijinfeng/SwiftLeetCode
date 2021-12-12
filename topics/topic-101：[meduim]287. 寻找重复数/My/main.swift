import Foundation

// https://leetcode-cn.com/problems/find-the-duplicate-number/

// 寻找重复数


// 二分法

//class Solution {
//    func findDuplicate(_ nums: [Int]) -> Int {
//            // 总元素有 n + 1 个
//            var left = 1
//            var right = nums.count
//
//            while left < right {
//                let mid = (right + left) / 2
//                var count = 0
//                // 计算出中间的那个数，那么在不存在重复数的情况下，最多有mid个数，并且都是<=mid
//                for n in nums {
//                    if n <= mid {
//                        count += 1
//                    }
//                }
//
//                if count > mid {
//                    // 说明重复数在[1,mid]之间。
//                    right = mid
//                } else {
//                    // 重复数载【mid，nums.count】
//                    left = mid + 1
//                }
//            }
//
//            return right
//        }
//}


// 快慢指针
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        while true {
            fast = nums[nums[fast]]
            slow = nums[slow]
            if slow == fast {
                break
            }
        }
        
        var finder = 0
        while true {
            finder = nums[finder]
            slow = nums[slow]
            if finder == slow {
                break
            }
        }
        return finder
    }
}
