import Foundation

//338. 比特位计数

/*
 0 --> 0    2^0
 1 --> 1
 
 2 --> 10   2^1
 3 --> 11
 
 4 --> 100  2^2
 5 --> 101
 6 --> 110
 7 --> 111
 
 8 --> 1000 2^3
 9  --> 1001
 10 --> 1010
 11 --> 1011
 12 --> 1100
 13 --> 1101
 14 --> 1110
 15 --> 1111
 
 16 --> 10000 2^4
 */

// 最高有效位
class Solution {
    func countBits(_ n: Int) -> [Int] {
        if n < 1 {
            return [0]
        }
        var res: [Int] = Array.init(repeating: 0, count: n + 1)
        var highBit = 0
        for i in 1...n {
            if i & (i - 1) == 0 {
                highBit = i
            }
            res[i] = res[i - highBit] + 1
        }
        return res
    }
}

let s = Solution()
let res = s.countBits(0)
print(res)


// 最低有效位
class Solution2 {
    func countBits(_ n: Int) -> [Int] {
        var res: [Int] = Array.init(repeating: 0, count: n+1)
        for i in 0...n {
            res[i] = res[i >> 1] + (i & 1)
        }
        return res
    }
}
