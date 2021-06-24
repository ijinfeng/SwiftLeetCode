
# 加一

> 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
> 
> 高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
> 
> 你可以假设除了整数 0 之外，这个整数不会以零开头。


示例 1：
```
输入：digits = [1,2,3]
输出：[1,2,4]
解释：输入数组表示数字 123。
```
示例 2：
```
输入：digits = [4,3,2,1]
输出：[4,3,2,2]
解释：输入数组表示数字 4321。
```
示例 3：
```
输入：digits = [0]
输出：[1]
```

---

提示：

* 1 <= digits.length <= 100
* 0 <= digits[i] <= 9




解:
```
func plusOne(_ digits: [Int]) -> [Int] {
//    var res: [Int] = []
//    var needAdd = true
//    for i in (0..<digits.count).reversed() {
//        var e = digits[i]
//        if needAdd {
//            e += 1
//            needAdd = false
//        }
//        if e > 9 {
//            e = 0
//            needAdd = true
//        }
//        res.insert(e, at: 0)
//    }
//    if needAdd {
//        res.insert(1, at: 0)
//    }
//    return res
    
    var res = digits
    var carry = true
    for i in (0..<res.count).reversed() {
        if carry {
            res[i] += 1
            carry = false
            if res[i] > 9 {
                carry = true
                res[i] = 0
            }
        } else {
            return res
        }
    }
    if carry {
        res.insert(1, at: 0)
    }
    return res
}
```
