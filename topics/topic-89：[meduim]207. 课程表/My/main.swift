import Foundation

// https://leetcode-cn.com/problems/course-schedule/
// 207. 课程表

//
//class Solution {
//    
//
//    // [1 0 1]
//    // 记录某个数的依赖
//    // 不能有环，有环就完不成
//    // 一个课程可能同时依赖多个课程
//
//
//    // 边和度
//
//    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//        // 边
//        var edges: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: 0), count: numCourses)
//        var indeg: [Int] = Array.init(repeating: 0, count: numCourses)
//
//
//        for info in prerequisites {
//            edges[info[1]].append(info[0])
//            indeg[info[0]] += 1
//        }
//
//        var q: [Int] = []
//        for i in 0..<numCourses {
//            if indeg[i] == 0 {
//                q.append(i)
//            }
//        }
//
//        var visited = 0
//        while !q.isEmpty {
//            visited += 1
//            let u = q[0]
//            q.remove(at: 0)
//            for v in edges[u] {
//                indeg[v] += 1
//                if indeg[v] == 0 {
//                    q.append(v)
//                }
//            }
//        }
//
//        return visited == numCourses
//    }
//}


let s = Solution()
let res = s.canFinish(2, [[1,0]])
print(res)
