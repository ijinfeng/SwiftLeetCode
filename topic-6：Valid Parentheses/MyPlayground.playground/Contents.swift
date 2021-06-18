import UIKit

// 有效的括号

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 */

let s = "[{}]"

s.contains("[]")


func isValid(_ s: String) -> Bool {
//    var _s = s
//    while _s.contains("[]") || _s.contains("{}") || _s.contains("()") {
//        _s = _s.replacingOccurrences(of: "[]", with: "")
//        _s = _s.replacingOccurrences(of: "()", with: "")
//        _s = _s.replacingOccurrences(of: "{}", with: "")
//    }
//    return _s == ""
    
    let map: [Character : Character] = [
        "(": ")",
        "[": "]",
        "{": "}",
    ]

    var arr: [Character] = []
    var match = 0
    for c in s {
        if let _ = map[c] {
            match += 1
            arr.append(c)
        } else {
            match -= 1
            if match < 0 {
                return false
            }
            if let left = map[arr.last!], left != c {
                return false
            }
            arr.removeLast()
        }
    }

    return match == 0
}


isValid("()")
isValid("()[]{}")
isValid("(]")
isValid("([)]")
isValid("{[]}")
