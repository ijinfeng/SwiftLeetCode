
# 无重复字符的最长子串

给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。


示例 1:
```
输入: s = "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```
示例 2:
```
输入: s = "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```
示例 3:
```
输入: s = "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```
示例 4:
```
输入: s = ""
输出: 0
```

提示：

* 0 <= s.length <= 5 * 104
* s 由英文字母、数字、符号和空格组成



解1
```
func lengthOfLongestSubstring(_ s: String) -> Int {
    let ss = Array(s)
    var maxCount = 0
    var cmap = [String.Element: Int]()
    var count = 0
    var i = 0
    var last = -1
    while i < ss.count {
        let c = ss[i]
        if let index = cmap[c], index > last {
            maxCount = max(maxCount, count)
            count = i - index
            last = index
        } else {
            count += 1
        }
        cmap[c] = i
        i += 1
//            print("c=\(c),i=\(i),count=\(count),mac=\(maxCount),cmap=\(cmap)")
    }
    return max(maxCount, count)
}
```


解2
```
// 滑动窗口
func lengthOfLongestSubstring(_ s: String) -> Int {
   let ss = Array(s)
   var set: Set<String.Element> = []
   var r = -1
   var maxc = 0
   for l in 0..<s.count {
       if l != 0 {
           set.remove(ss[l - 1])
       }
       while r + 1 < ss.count && set.contains(ss[r + 1]) == false {
           set.insert(ss[r + 1])
           r += 1
       }
       maxc = max(maxc, r - l + 1)
   }
   return maxc
}
```
