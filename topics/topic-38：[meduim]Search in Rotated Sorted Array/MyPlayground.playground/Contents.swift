import UIKit


// 搜索旋转排序数组


//class Solution {
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        for i in 0..<nums.count {
//            if nums[i] == target {
//                return i
//            }
//        }
//        return -1
//    }
//}


// 设计一个 复杂度 为 O(log n) 的算法

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        if count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var l = 0
        var r = count - 1
        while r >= l {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[0] <= nums[mid] {
                if nums[0] <= target && target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[count - 1] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return -1
    }
}

let s = Solution()
s.search([4,5,6,7,0,1,2], 0)
