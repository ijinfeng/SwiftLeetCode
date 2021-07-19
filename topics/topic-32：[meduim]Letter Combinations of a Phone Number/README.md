
# 电话号码的字母组合

给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。


示例 1：

输入：digits = "23"
输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
示例 2：

输入：digits = ""
输出：[]
示例 3：

输入：digits = "2"
输出：["a","b","c"]



提示：

* 0 <= digits.length <= 4
* digits[i] 是范围 ['2', '9'] 的一个数字。


解：
```
class Solution {
    let numMap: [String.Element: [String]] = ["1": [], "2": ["a", "b", "c"], "3": ["d", "e", "f"],"4": ["g","h","i"], "5": ["j", "k", "l"], "6": ["m","n","o"], "7": ["p","q","r","s"],"8": ["t","u","v"],"9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        guard let first = digits.first else {
            return []
        }
        var i = 1
        var last: [String] = numMap[first] ?? []
        while i < digits.count {
            let next = digits[digits.index(digits.startIndex, offsetBy: i)]
            last = getComine(last, numMap[next] ?? [])
            i += 1
        }
        return last
    }
    
    // 每次都是两个数组合并一次，依次往下推
    func getComine(_ a1: [String], _ a2: [String]) -> [String] {
        var s: [String] = []
        if a1.count == 0 {
            s = a2
        } else if a2.count == 0 {
            s = a1
        } else {
            for s1 in a1 {
                for s2 in a2 {
                    s.append(s1.appending(s2))
                }
            }
        }
        return s
    }
}
```
