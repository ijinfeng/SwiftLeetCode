import Foundation

class Solution {
    
    // 异或：相同为1，不同为0
    // 0 ^ x = x: 0异或任何数，结果为任何数
    // 异或满足交换律和结合律： a ^ b ^ c = a ^ c ^ b = c ^ (b ^ a)
    
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
        return res
    }
    
}
