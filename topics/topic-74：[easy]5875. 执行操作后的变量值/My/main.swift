import Foundation

class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {

        let dic: [String: Int] = ["++X": 1, "X++": 1, "--X": -1, "X--": -1]
        var res = 0
        for op in operations {
            res += dic[op]!
        }
        return res
    }
}


let s = Solution()
let rs = s.finalValueAfterOperations(["X++","++X","--X","X--"])
print(rs)
