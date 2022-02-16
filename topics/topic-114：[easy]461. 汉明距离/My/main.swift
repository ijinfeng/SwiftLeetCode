import Foundation

// 461. 汉明距离

//class Solution {
//    func hammingDistance(_ x: Int, _ y: Int) -> Int {
//        var s = x ^ y
//        var ret = 0
//        while s > 0 {
//            ret += s & 1
//            s >>= 1
//        }
//        return ret
//    }
//}


// Brian Kernighan 算法
// 删去其二进制表示中最右侧的1
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var s = x ^ y
        var ret = 0
        while s > 0 {
            s &= s - 1
            ret += 1
        }
        return ret
    }
}
