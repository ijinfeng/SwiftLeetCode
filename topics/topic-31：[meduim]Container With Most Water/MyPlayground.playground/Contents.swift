import UIKit


// 盛最多水的容器
// 计算面积最大

// 暴力破解法【容易超时】
//class Solution {
//    func maxArea(_ height: [Int]) -> Int {
//        var res = 0
//        for l in 0..<height.count-1 {
//            for r in l..<height.count {
//                let h = min(height[l], height[r])
//                let w = r - l
//                res = max(res, h * w)
//            }
//        }
//        return res
//    }
//}

// 双指针
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // 面积取决于height短的那根
        var res = 0
        // 双指针
        var l = 0
        var r = height.count - 1
        while l < r {
            res = max(res, min(height[l], height[r]) * (r - l))
//            print("res=\(res),l=\(l),r=\(r),lh=\(height[l]),rh=\(height[r])")
            if height[l] > height[r] {
                r -= 1
            } else {
                l += 1
            }
        }
        return res
    }
}


let s = Solution()
s.maxArea([4,3,2,1,4])
s.maxArea([1,8,6,2,5,4,8,3,7])
s.maxArea([1,1])
