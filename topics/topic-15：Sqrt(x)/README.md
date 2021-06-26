# x 的平方根

实现 int sqrt(int x) 函数。

计算并返回 x 的平方根，其中 x 是非负整数。

由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。


> 示例 1:
> 
> 输入: 4
> 输出: 2
> 示例 2:
> 
> 输入: 8
> 输出: 2
> 说明: 8 的平方根是 2.82842..., 
>      由于返回类型是整数，小数部分将被舍去。


解1: 二分法

```
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

```


解2:牛顿迭代法
>  https://leetcode-cn.com/problems/sqrtx/solution/niu-dun-die-dai-fa-by-loafer/

```
func mySqrt(_ x: Int) -> Int {
    let c = x
    var res = x
    while x / res < res {
        res = (res + c / res) / 2
    }
    return res
}
```
