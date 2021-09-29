import Foundation

// https://leetcode-cn.com/problems/factorial-trailing-zeroes/
// 172. 阶乘后的零

//class Solution {
//    // 两数想乘可能出现0， 5 * 2, 1 * 10, 5 * 4
//    func trailingZeroes(_ n: Int) -> Int {
//        var res = 0
//
//        var val = 1
//
//        if n < 1 {
//            return 0
//        }
//
//        for i in 1...n {
//            // 每次想乘，将结果除0外的数记录下来，比如，4 * 5 = 20， 记2， 累加0=1
//
//            val *= i
//
//            // 处理 val
//            while val % 10 == 0 {
//                val /= 10
//                res += 1
//            }
//            if val > 10 {
//                val %= 1000
//            }
//
//            print("i=\(i),val=\(val), res=\(res)")
//        }
//
//        return res
//    }
//}

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var count = 0
        var _n = n
        while _n > 0 {
            _n /= 5
            count += _n
        }
        return count
    }
}

let s = Solution()
let res = s.trailingZeroes(625)

print(res)


func ccc(n: Int) {
    var res = 1
    
    for i in 1...n {
        res *= i
    }
    print("res=\(res)")
}


ccc(n: 9)
