import UIKit

// 寻找两个正序数组的中位数

/*
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 */

class Solution {
    // 法1：暴力破解法 O(m+n)
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        var nums = nums1 + nums2
//        nums.sort()
//        if nums.count % 2 == 0 {
//            let i = nums.count / 2
//            return Double((nums[i] + nums[i - 1])) / 2.0
//        } else {
//            return Double(nums[(nums.count - 1) / 2])
//        }
//    }
    
    // 法2：二分法 O(log(m+n))
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
    }
}


let s = Solution()
s.findMedianSortedArrays([2], [3,4])
