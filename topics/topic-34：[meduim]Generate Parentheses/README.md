
# [括号生成](https://leetcode-cn.com/problems/generate-parentheses)

数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

 

示例 1：
```
输入：n = 3
输出：["((()))","(()())","(())()","()(())","()()()"]
```
示例 2：
```
输入：n = 1
输出：["()"]
```

提示：

* 1 <= n <= 8

解：
```
class Solution {
    var res: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        res = []
        createOne(1, n, "(", 1, 1)
        print("=======> \(res)")
        return res
    }
    
    // 有两个条件：
    // 1、一个是val必须 >=0
    // 2、相同的单个括号的个数最大 ==n
    func createOne(_ i: Int, _ n: Int, _ str: String, _ val: Int, _ left: Int) {
        print("i=\(i),n=\(n),str=\(str),val=\(val),left=\(left)")
        if i < n * 2 - 1 {
            if val > 0 {
                createOne(i+1, n, str.appending(")"), val - 1, left)
            }
            if left < n {
                createOne(i+1, n, str.appending("("), val + 1, left + 1)
            }
        } else {
            res.append(str.appending(")"))
        }
    }
}
```
