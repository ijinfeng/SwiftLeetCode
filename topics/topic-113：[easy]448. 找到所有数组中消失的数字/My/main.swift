import Foundation

//448. 找到所有数组中消失的数字

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var _nums = nums
        // [1, n]
        var res: [Int] = []
        
        print("1=== \(_nums)")
        
        for num in _nums {
            _nums[num - 1] = 0
        }
        
        print("2=== \(_nums)")
        
        for i in 0..<_nums.count {
            if _nums[i] != 0 {
                res.append(i + 1)
            }
        }
        
        return res
    }
}


let s = Solution()
let nums = [1,1]
let res = s.findDisappearedNumbers(nums)
print(res)
