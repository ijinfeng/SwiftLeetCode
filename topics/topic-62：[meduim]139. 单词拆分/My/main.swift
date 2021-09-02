import Foundation

class Solution {
    
    // 动态规划
    // dp[i] 表示字符串 s 的前i个字符[0..<i]是否符合 wordDict
    //
    
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

let s = Solution()
let res = s.wordBreak("leetcode", ["leet", "code"])
print(res)
