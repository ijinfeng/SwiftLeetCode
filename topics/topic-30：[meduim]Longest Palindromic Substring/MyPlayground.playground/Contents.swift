import UIKit


// 最长回文字串

/*
 给你一个字符串 s，找到 s 中最长的回文子串。
 */

// 暴力枚举法
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let arr = Array(s)
        var res = ""
        for i in 0..<arr.count {
            for j in i..<arr.count {
                let ss = arr[i...j]
                if isPlalindrome(Array<String.Element>(ss)) && res.count < ss.count {
                    res = String(ss)
                }
            }
        }
        return res
    }

    func isPlalindrome(_ s: [String.Element]) ->Bool {
        if s.count == 1 {
            return true
        }
        var l = 0
        var r = s.count - 1
        while l < r {
            print("l=\(l),r=\(r),s=\(s)")
            if s[l] != s[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}

//class Solution {
//    // 中心扩散法
//    func longestPalindrome(_ s: String) -> String {
//        if s.count <= 1 {
//            return s
//        }
//        let arr = Array(s)
//        var begin = 0
//        var end = 0
//        for i in 0..<arr.count {
//            // 假设最长回文是偶数
//            let res1 = longest(i, i+1, arr)
//            // 假设是奇数
//            let res2 = longest(i, i, arr)
//            if res1.1 - res1.0 > end - begin {
//                begin = res1.0
//                end = res1.1
//            }
//            if res2.1 - res2.0 > end - begin {
//                begin = res2.0
//                end = res2.1
//            }
//        }
//        return String(arr[begin...end])
//    }
//
//    func longest(_ left: Int, _ right: Int, _ arr: [String.Element]) -> (Int,Int) {
//        var l = left
//        var r = right
//        while l >= 0 && r < arr.count {
//            if arr[l] != arr[r] {
//                break
//            }
//            l -= 1
//            r += 1
//        }
//        return (l+1,r-1)
//    }
//}


// 动态规划
// 妙啊~真是妙蛙种子吃着妙脆角妙进了米奇妙妙屋妙到家了
// 空间换时间
//class Solution {
//    func longestPalindrome(_ s: String) -> String {
//        if s.count < 2 {
//            return s
//        }
//        var begin = 0
//        var end = 0
//        let arr = Array(s)
//
//        // 存储dp[i][j]是否为回文,i~j是否为回文
//        var dp = Array<Array<Bool>>(repeating: Array(repeating: false, count: s.count), count: s.count)
//        for i in 0..<s.count {
//            dp[i][i] = true
//        }
//
//        for j in 1..<s.count {
//            for i in 0..<j {
//                if arr[i] != arr[j] {
//                    dp[i][j] = false
//                } else {
//                    if j - i <= 2 {
//                        // 最小奇数回文和最小偶数回文
//                        dp[i][j] = true
//                    } else {
//                        // 动态转移公式
//                        dp[i][j] = dp[i + 1][j - 1]
//                    }
//                }
//                // 记录最长回文位置
//                if dp[i][j] && j - i > end - begin {
//                    begin = i
//                    end = j
//                }
//            }
//        }
//        return String(arr[begin...end])
//    }
//}


// babad

let s = Solution()
s.longestPalindrome("cbbd")
s.longestPalindrome("bada")
s.longestPalindrome("bababc")

