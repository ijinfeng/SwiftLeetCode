import UIKit


// 最长公共前缀

/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。
 */


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

longestCommonPrefix(["flower","flow","flight"])
longestCommonPrefix(["dog","racecar","car"])
longestCommonPrefix([""])
