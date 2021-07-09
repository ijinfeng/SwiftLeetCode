import UIKit

// 无重复字符的最长字串


class Solution {
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
    
//     滑动窗口
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        let ss = Array(s)
//        var set: Set<String.Element> = []
//        var r = -1
//        var maxc = 0
//        for l in 0..<s.count {
//            if l != 0 {
//                set.remove(ss[l - 1])
//            }
//            while r + 1 < ss.count && set.contains(ss[r + 1]) == false {
//                set.insert(ss[r + 1])
//                r += 1
//            }
//            maxc = max(maxc, r - l + 1)
//        }
//        return maxc
//    }
    
}



let s = Solution()
s.lengthOfLongestSubstring("abba")
