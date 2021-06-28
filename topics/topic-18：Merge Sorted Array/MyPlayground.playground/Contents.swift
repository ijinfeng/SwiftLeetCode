import UIKit

// 合并两个有序数组

/*
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。

 */


/*
 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = nums1.count - n - 1
    var p2 = n - 1
    for i in stride(from: m + n - 1, through: 0, by: -1) {
        if p2 < 0 {
            break
        }
        if p1 < 0 {
            p1 = 0
        }
        if nums1[p1] < nums2[p2] {
            nums1[i] = nums2[p2]
            p2 -= 1
        } else {
            let t = nums1[p1]
            nums1[i] = t
            nums1[p1] = 0
            p1 -= 1
        }
    }
}

//var nums = [1,2,3,0,0,0]
//merge(&nums, 3, [2,5,6], 3)
//nums

var nums = [2,0]
merge(&nums, 1, [1], 1)
nums
