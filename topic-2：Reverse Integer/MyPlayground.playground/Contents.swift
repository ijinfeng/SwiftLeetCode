import UIKit


// 整数反转

/*
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
 */


/* 示例 1：
 
 输入：x = 123
 输出：321
 */

/* 示例 2：
 
 输入：x = -123
 输出：-321
 */


/* 示例 3：
 
 输入：x = 120
 输出：21
 */


/* 示例 4：
 
 输入：x = 0
 输出：0
 */

-123 % 10


let a = Int32.max

let b = pow(2, 31) - 1

func reverse(_ x: Int) -> Int {
    var res = 0
    var y = x
    
    while y != 0 {
        res = res * 10 + y % 10
        if res > Int32.max || res < Int32.min {
            return 0
        }
        y /= 10
    }

    return res
}

reverse(123)
reverse(-123)
reverse(0)
reverse(120)
reverse(1534236469)
