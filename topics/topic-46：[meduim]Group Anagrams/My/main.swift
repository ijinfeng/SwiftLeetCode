import Foundation

// 字母异位词分组

//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        let count = strs.count
//        if count <= 1 {
//            return [strs]
//        }
//        var res: [[String]] = []
//        var handleStrs = strs
//
//        while handleStrs.count > 0 {
//            handleStr(handleStrs.removeLast(),  &res)
//        }
//
//        return res
//    }
//
//    func handleStr(_ s: String, _ res: inout [[String]]) {
//        let c = res.count
//        for i in 0..<c {
//            var str = res[i]
//            if isAnagrams(s, str.first!) {
//                str.append(s)
//                res[i] = str
//                return
//            }
//        }
//        res.append([s])
//    }
//
//    // 判断两个字符串是否为异位词
//    func isAnagrams(_ s1: String, _ s2: String) -> Bool {
//        let c1 = s1.count
//        let c2 = s2.count
//        if c1 != c2 {
//            return false
//        }
//        var dic1: [Character: Int] = [:]
//        for c in s1 {
//            if let count = dic1[c] {
//                dic1[c] = count + 1
//            } else {
//                dic1[c] = 1
//            }
//        }
//        for c in s2 {
//            if let count = dic1[c] {
//                if count == 0 {
//                    return false
//                }
//                dic1[c] = count - 1
//            } else {
//                return false
//            }
//        }
//        for (_, count) in dic1 {
//            if count > 0 {
//                return false
//            }
//        }
//        return true
//    }
//}


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

let s = Solution()
let res = s.groupAnagrams( ["eat", "tea", "tan", "ate", "nat", "bat"])
print(res)
