import Foundation


// 238. 除自身以外数组的乘积


// 左右乘积法
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        let count = nums.count
//        var left = Array.init(repeating: 1, count: count)
//        var right = Array.init(repeating: 1, count: count)
//
//        for i in 1..<count {
//            left[i] = left[i - 1] * nums[i - 1]
//        }
//        for i in stride(from: count - 2, through: 0, by: -1) {
//            right[i] = right[i + 1] * nums[i + 1]
//        }
//
//        var res = Array.init(repeating: 1, count: count)
//
//        for i in 0..<count {
//            res[i] = left[i] * right[i]
//        }
//        return res
//    }
//}

// 优化
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var res = Array.init(repeating: 1, count: count)
        
        for i in 1..<count {
            res[i] = res[i - 1] * nums[i - 1]
        }
        var right = 1
        for i in stride(from: count - 1, through: 0, by: -1) {
            res[i] = res[i] * right
            right *= nums[i]
        }
        
        return res
    }
}

