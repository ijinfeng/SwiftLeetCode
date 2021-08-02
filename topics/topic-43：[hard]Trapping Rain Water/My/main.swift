import Foundation

// 接雨水


// 分析：
// 两个最大的数字之间的雨水为 min(h1,h2) * (h2 - h1) - /*中间的数字之和*/


// 暴力解法
//class Solution {
//    func trap(_ height: [Int]) -> Int {
//        var res = 0
//        var max_left_index = 0
//        var max_right_index = 0 // 比左边高的第一根
//        for i in 0..<height.count {
//            let h = height[i]
//            if max_left_index < i && height[max_left_index] > h {
//                // 寻找右边最大的柱子
//                if i >= max_right_index {
//                    var max_right = h
//                    for j in i..<height.count {
//                        if height[j] > max_right {
//                            max_right_index = j
//                            max_right = height[j]
//                            print("- find max_right_index=\(j),right_value=\(height[j]), current max_left=\(max_left_index)")
//                        }
//                        if height[j] > max_right {
//                            max_right_index = j
//                            max_right = height[j]
//                            print("- find max_right_index=\(j),right_value=\(height[j]), current max_left=\(max_left_index)")
//                        }
//                    }
//                }
//                if height[max_right_index] > h && max_right_index > max_left_index && max_right_index > i {
//                    res += min(height[max_right_index], height[max_left_index]) - h
//                    print(">> res=\(res), index=\(i),v=\(h),left=\(max_left_index),left_value=\(height[max_left_index]),right=\(max_right_index),right_value=\(height[max_right_index])")
//                }
//            } else {
//                max_left_index = i
//            }
//        }
//        return res
//    }
//}


// 动态规划
//class Solution {
//    // 找到左边最大，和右边最大
//    func trap(_ height: [Int]) -> Int {
//        if height.isEmpty {
//            return 0
//        }
//        var res = 0
//        let count = height.count
//        var left_maxs = [Int].init(repeating: 0, count: count)
//        var right_maxs = [Int].init(repeating: 0, count: count)
//        left_maxs[0] = height[0]
//        for left in 1..<count {
//            left_maxs[left] = max(height[left], left_maxs[left - 1])
//        }
//        right_maxs[count - 1] = height[count - 1]
//        for right in stride(from: count - 2, to: 0, by: -1) {
//            right_maxs[right] = max(height[right], right_maxs[right + 1])
//        }
//        for i in 1..<count {
//            res += min(left_maxs[i], right_maxs[i]) - height[i]
//        }
//        return res
//    }
//}



// 双指针法
class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var left_max = 0, right_max = 0
        var res = 0
        
        // 当left_max < right_max，只要height[left] < left_max，那么我就能得出，当前下边能存的水为：left_max - height[left]，反之亦然
        
        while left <= right {
            if left_max < right_max {
                res += max(0, left_max - height[left])
                left_max = max(left_max, height[left])
                left += 1
            } else {
                res += max(0, right_max - height[right])
                right_max = max(height[right], right_max)
                right -= 1
            }
        }
        return res
    }
}



let s = Solution()
let res = s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
//let res = s.trap([4,2,0,3,2,5])
print(res)
