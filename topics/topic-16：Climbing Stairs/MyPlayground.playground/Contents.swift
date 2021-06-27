import UIKit

// 爬楼梯

/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。
 */



// 斐波那契数列
// f(n) = f(n-1) + f(n-2)
func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var a = 1
    var b = 2
    var res = 0
    for _ in 3...n {
        res = a + b
        a = b
        b = res
    }
    return res
}


climbStairs(2)
climbStairs(3)
climbStairs(10)
