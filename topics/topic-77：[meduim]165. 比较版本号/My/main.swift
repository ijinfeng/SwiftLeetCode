import Foundation

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1s = version1.components(separatedBy: ".")
        let v2s = version2.components(separatedBy: ".")
        var p1 = 0
        var p2 = 0
        let v1Count = v1s.count
        let v2Count = v2s.count
        while p1 < v1Count || p2 < v2Count {
            let v1 = p1 < v1Count ? (Int(v1s[p1]) ?? 0) : 0
            let v2 = p2 < v2Count ? (Int(v2s[p2]) ?? 0) : 0
            if v1 > v2 {
                return 1
            } else if v1 < v2 {
                return -1
            } else {
                p1 += 1
                p2 += 1
            }
        }
        return 0
    }
}


let s = Solution()
let res = s.compareVersion("7.5.2.4", "7.5.3")
print(res)
