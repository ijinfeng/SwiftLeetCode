import Foundation


// 子集


class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var collection = [Int]()
        var res: [[Int]] = [[]]
        let count = nums.count
        subsub(0, nums, count, &collection, &res)
        return res
    }
    
    func subsub(_ index: Int, _ nums: [Int], _ count: Int, _ collection: inout [Int], _ res: inout [[Int]]) {
        if index >= count {
            return
        }
        for i in index..<count {
            collection.append(nums[i])
            res.append(collection)
            subsub(i+1, nums, count, &collection, &res)
            collection.removeLast()
        }
    }
}

let s = Solution()
let res = s.subsets([1])
print(res)
