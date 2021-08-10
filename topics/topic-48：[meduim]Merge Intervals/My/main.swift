import Foundation

// 合并区间

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted { (a, b) -> Bool in
            a[0] < b[0]
        }
        // 假设a1和a2不能合并，说明a2的a2[0] > a1[1]，因此直接取a2和a3比较即可
        
        var res: [[Int]] = [sorted[0]]
        for i in 1..<sorted.count {
            let a = sorted[i]
            let last = res[res.count - 1]
            if let merged = mergeTwo(last, a) {
                res.removeLast()
                res.append(merged)
            } else {
                res.append(a)
            }
        }
        
        return res
    }
    
    // 能合并就反悔合并后的区间
    func mergeTwo(_ s1: [Int], _ s2: [Int]) -> [Int]? {
        if s2[0] <= s1[1] && s2[0] >= s1[0] {
            return [s1[0], max(s1[1], s2[1])]
        } else if s1[0] <= s2[1] && s1[0] >= s2[0] {
            return [s2[0], max(s1[1], s2[1])]
        } else {
            return nil
        }
    }
}

let s = Solution()
let res = s.merge([[1,4],[0,2],[3,5]])
print(res)
