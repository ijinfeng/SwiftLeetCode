
# [字母异位词分组](https://leetcode-cn.com/problems/group-anagrams)

给定一个字符串数组，将字母异位词组合在一起。可以按任意顺序返回结果列表。

字母异位词指字母相同，但排列不同的字符串。


示例 1:
```
输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
```
示例 2:
```
输入: strs = [""]
输出: [[""]]
```
示例 3:
```
输入: strs = ["a"]
输出: [["a"]]
```

提示：

* 1 <= strs.length <= 104
* 0 <= strs[i].length <= 100
* strs[i] 仅包含小写字母

解1
```
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        for s in strs {
            let key = String(s.sorted())
            if var arr = map[key] {
                arr.append(s)
                map[key] = arr
            } else {
                map[key] = [s]
            }
        }
        var res: [[String]] = []
        for (_, strarr) in map {
            res.append(strarr)
        }
        return res
    }
}

```

解2
```
// 暴力解法
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let count = strs.count
        if count <= 1 {
            return [strs]
        }
        var res: [[String]] = []
        var handleStrs = strs

        while handleStrs.count > 0 {
            handleStr(handleStrs.removeLast(),  &res)
        }

        return res
    }

    func handleStr(_ s: String, _ res: inout [[String]]) {
        let c = res.count
        for i in 0..<c {
            var str = res[i]
            if isAnagrams(s, str.first!) {
                str.append(s)
                res[i] = str
                return
            }
        }
        res.append([s])
    }

    // 判断两个字符串是否为异位词
    func isAnagrams(_ s1: String, _ s2: String) -> Bool {
        let c1 = s1.count
        let c2 = s2.count
        if c1 != c2 {
            return false
        }
        var dic1: [Character: Int] = [:]
        for c in s1 {
            if let count = dic1[c] {
                dic1[c] = count + 1
            } else {
                dic1[c] = 1
            }
        }
        for c in s2 {
            if let count = dic1[c] {
                if count == 0 {
                    return false
                }
                dic1[c] = count - 1
            } else {
                return false
            }
        }
        for (_, count) in dic1 {
            if count > 0 {
                return false
            }
        }
        return true
    }
}
```
