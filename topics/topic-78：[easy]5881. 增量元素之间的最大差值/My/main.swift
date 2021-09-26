import Foundation

class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var res = -1
        let n = nums.count
        for i in 0..<n {
            for j in i+1..<n {
                if nums[j] > nums[i] {
                    res = max(res, nums[j] - nums[i])
                }
            }
        }
        
        return res
    }
}

let s = Solution()
let res = s.maximumDifference([9,4,3,2])
print(res)
