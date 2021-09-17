import Foundation



// 对于长度为 n 的数组nums，需要旋转 n 次才能回到原样
// 没回到原样的数组，它的 first>last

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        // 旋转了
        // 用二分法寻找
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = (right + left) / 2
            if nums[mid] < nums[right] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return nums[left]
    }
}


let s = Solution()
let res = s.findMin([4,5,6,7,0,1,2])
print(res)
