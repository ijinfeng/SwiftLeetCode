
# [最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/)


给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号子串的长度。

 

示例 1：
```
输入：s = "(()"
输出：2
解释：最长有效括号子串是 "()"
```
示例 2：
```
输入：s = ")()())"
输出：4
解释：最长有效括号子串是 "()()"
```
示例 3：
```
输入：s = ""
输出：0
```


解1:
```
// 暴力破解

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var begin = 0
        var end = 0

        let sarr = Array(s)
        var p = findVaildLeft(sarr, 0)

        while p < sarr.count {
            findVaildEnd(sarr, &begin, &end, p)
            p = findVaildLeft(sarr, p + 1)
        }

        if end == begin {
            return 0
        }
        return end - begin + 1
    }

    // 寻找有效的')'，并返回其索引
    func findVaildEnd(_ sarr: [String.Element], _ begin: inout Int, _ end: inout Int, _ p: Int) {
        var q = p + 1
        var val = 1
        while q < sarr.count {
            let c = sarr[q]
            if c == "(" {
                val += 1
            } else {
                val -= 1
            }
            if val < 0 { // 说明有无效的')'出现，如：())(
                break
            }
            if val == 0 { // 表示一个有效的闭合
                if q - p > end - begin {
                    begin = p
                    end = q

                    print("end=\(end),begin=\(begin)")
                }
            }
            q += 1
        }
    }

    // 寻找第一个有效的 ‘(’
    func findVaildLeft(_ sarr: [String.Element], _ begin: Int) -> Int {
        for i in begin..<sarr.count {
            let c = sarr[i]
            if c == "(" {
                return i
            }
        }
        return sarr.count
    }
}
```

解2
```
// 栈
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var stack: [Int] = [-1]
        let sarr = Array(s)
        var maxVal = 0
        for i in 0..<sarr.count {
            let c = sarr[i]
            if c == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    maxVal = max(maxVal, i - (stack.last ?? 0))
                }
            }
        }
        return maxVal
    }
}

```
