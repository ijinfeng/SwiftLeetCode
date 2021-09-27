import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var res = 0
        var maxc = 0
        var dic: [Int: Int] = [:]
        for num in nums {
            let n = dic[num] ?? 0
            dic[num] = n + 1
            if n + 1 > maxc {
                maxc = n + 1
                res = num
            }
        }
        return res
    }
}
