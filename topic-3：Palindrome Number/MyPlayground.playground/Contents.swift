import UIKit


/// 回文数

/*
 
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。
 */

/* 示例 1：
 
 输入：x = 121
 输出：true
 */

/* 示例 2：
 
 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 */

/* 示例 3：
 
 输入：x = 10
 输出：false
 解释：从右向左读, 为 01 。因此它不是一个回文数。
 */

/* 示例 4：
 
 输入：x = -101
 输出：false
 */

let s = "12345"
let a = s[s.index(s.endIndex, offsetBy: -1)]


//func isPalindrome(_ x: Int) -> Bool {
//    if x < 0 {
//        return false
//    }
//    let s = String(x)
//    let half = s.count / 2
//    for i in 0..<s.count {
//        if s[s.index(s.startIndex, offsetBy: i)] != s[s.index(s.endIndex, offsetBy: -i-1)] {
//            return false
//        }
//        if i == half {
//            break
//        }
//    }
//    return true
//}


// MARK:进阶：你能不将整数转为字符串来解决这个问题吗？


func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }

    var v = x
    var res = 0, l = 0
    while v != 0 {
        l = v % 10
        res = res * 10 + l
        v /= 10
    }

    return x == res
}




isPalindrome(121)
isPalindrome(-121)
isPalindrome(10)
isPalindrome(0)
isPalindrome(1234)
isPalindrome(-1)
