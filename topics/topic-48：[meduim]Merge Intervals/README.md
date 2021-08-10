
# [合并区间](https://leetcode-cn.com/problems/merge-intervals)

以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。

 

示例 1：
```
输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
输出：[[1,6],[8,10],[15,18]]
解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
```
示例 2：
```
输入：intervals = [[1,4],[4,5]]
输出：[[1,5]]
解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
```

提示：

* 1 <= intervals.length <= 104
* intervals[i].length == 2
* 0 <= starti <= endi <= 104



解:
```
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
```
