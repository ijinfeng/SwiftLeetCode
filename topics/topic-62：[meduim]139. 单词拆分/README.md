# [单词拆分](https://leetcode-cn.com/problems/word-break/)

给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。

说明：

* 拆分时可以重复使用字典中的单词。
* 你可以假设字典中没有重复的单词。
示例 1：
```
输入: s = "leetcode", wordDict = ["leet", "code"]
输出: true
解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
```
示例 2：
```
输入: s = "applepenapple", wordDict = ["apple", "pen"]
输出: true
解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
     注意你可以重复使用字典中的单词。
```
示例 3：
```
输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
输出: false
```

解
```
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let count = s.count
        var dp = Array.init(repeating: false, count: count+1)
        let set = Set.init(wordDict)
        dp[0] = true
        for i in 1...count {
            for j in 0..<i {
                if dp[j] && set.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[count]
    }
}
```
