import UIKit

// x 的平方根

/*
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */



// 对数公式：https://baike.baidu.com/item/%E5%AF%B9%E6%95%B0%E5%85%AC%E5%BC%8F/5557846?fr=aladdin
// 对数公式是数学中的一种常见公式，如果a^x=N(a>0,且a≠1)，则x叫做以a为底N的对数,记做x=log(a)(N)，其中a要写于log右下。其中a叫做对数的底，N叫做真数 [1]  。通常我们将以10为底的对数叫做常用对数，以e为底的对数称为自然对数。



// ans^2 <= x
// 二分法
func mySqrt(_ x: Int) -> Int {
    var l = 0
    var r = x
    var ans = -1
    while l <= r {
        let mid = l + (r - l) / 2
        if mid * mid <= x {
            ans = mid
            l = mid + 1
        } else {
            r = mid - 1
        }
        print("mid=\(mid),left=\(l),right=\(r),ans=\(ans)")
    }
    return ans
}


//mySqrt(4)
//mySqrt(9)
mySqrt(10)
//mySqrt(3)

//mySqrt(189)

