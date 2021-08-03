import Foundation

// 全排列

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var componse: [Int] = []
        
        for i in 0..<nums.count {
            var _nums = nums
            _nums.remove(at: i)
            componse.append(nums[i])
            getComponse(_nums, &componse, &res)
            componse.removeLast()
        }
        
        return res
    }
    
    
    func getComponse(_ nums: [Int] ,_ componse: inout [Int], _ res: inout [[Int]]) {
        guard nums.count > 0 else {
            res.append(componse)
            return
        }
        for i in 0..<nums.count {
            var _nums = nums
            _nums.remove(at: i)
            componse.append(nums[i])
            getComponse(_nums, &componse, &res)
            componse.removeLast()
        }
    }
}

let s = Solution()
let res = s.permute([1,2,3])
print(res)
