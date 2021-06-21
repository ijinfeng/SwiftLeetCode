import UIKit


// 实现 strStr()

/*
 实现 strStr() 函数。

 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

 
 
 说明：

 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-strstr
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty {
        return 0
    }
    if needle.count > haystack.count {
        return -1
    }
    for i in 0...haystack.count - needle.count {
        let s = haystack[haystack.index(haystack.startIndex, offsetBy: i)..<haystack.index(haystack.startIndex, offsetBy: i + needle.count)]
        if s == needle {
            return i
        }
    }
    return -1
}
//
strStr("hello", "ll")
strStr("aaaaaa", "bba")
strStr("", "")
strStr("a", "a")
