import Foundation

// 不同路径

class Solution {
    
    // 使用动态规划可解
    // 知终点，必定是从其左边，或者是上边那一点下来的
    // 可得动态转移方程：f(m, n) = f(m-1,n) + f(m, n-1)
    // 起点（1，1），终点（m,n）
    
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var res = 0
        var map: [String: Int] = [:]
        for x in 1...n {
            for y in 1...m {
                if x == 1 || y == 1 {
                    res = 1
                    map["\(y),\(x)"] = 1
                } else {
                    res = map["\(y-1),\(x)"]! + map["\(y),\(x-1)"]!
                    map["\(y),\(x)"] = res
                }
            }
        }
        
        return res
    }
}

let s = Solution()
let res = s.uniquePaths(1, 2)
print(res)
