
# 最长公共前缀

> 编写一个函数来查找字符串数组中的最长公共前缀。
> 如果不存在公共前缀，返回空字符串 ""。


示例 1：
```
输入：strs = ["flower","flow","flight"]
输出："fl"
```

示例 2：
```
输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。
```


### 思路
https://leetcode-cn.com/problems/longest-common-prefix/solution/zui-chang-gong-gong-qian-zhui-by-leetcode-solution/


基于该结论，可以得到一种查找字符串数组中的最长公共前缀的简单方法。依次遍历字符串数组中的每个字符串，对于每个遍历到的字符串，更新最长公共前缀，当遍历完所有的字符串以后，即可得到字符串数组中的最长公共前缀。


解1:
```
func longestCommonPrefix(_ strs: [String]) -> String {
    var prefix = strs.first ?? ""
    for i in 1..<strs.count {
        while prefix.count > 0 && !strs[i].starts(with: prefix) {
            let substring = prefix.prefix(prefix.count - 1)
            prefix = String(substring)
        }
    }
    return prefix
}
```


