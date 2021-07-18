import UIKit


// 三数之和

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if  nums.count < 3 {
            return []
        }
        let _nums = nums.sorted(by: <)
        var res: [[Int]] = []
        
        print(_nums)
        
        for i in 0..<_nums.count {
            if i > 0 && _nums[i] == _nums[i - 1] {
                continue
            }
            var k = _nums.count - 1
            let target = -_nums[i]
            for j in i+1..<_nums.count {
                if j > i + 1 && _nums[j] == _nums[j - 1] {
                    continue
                }
                while j < k && _nums[j] + _nums[k] > target   {
                    k -= 1
                }
                if j == k {
                    break
                }
                if _nums[j] + _nums[k] == target {
                    res.append([_nums[i], _nums[j], _nums[k]])
                }
            }
        }
        print(res)
        return res
    }
}

let s = Solution()
//s.threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6])
s.threeSum([-1,0,1,2,-1,-4])
//s.threeSum([])
//s.threeSum([1,-1,0,2,-3,-1,1])
//s.threeSum([1,2,-2,-1])
//s.threeSum([0,0,0])
