import Foundation
//
//class Solution {
//    // 注意 grid[r][c] r为纵轴，c为横轴
//    // 如何使第一个机器人拿到的点数最大
//    // 使得第二个机器人拿到的点数最大
//
//    // 使用动态规划
//    // 对于最大的点 g[r][c] ，必定有g[r-1][c] 或g[r][c-1]为最大的点
//    // dp[r][c] = max(dp[r-1][c], dp[r][c-1])
//
//    struct maxP {
//        var val: Int
//        var lastV: Int
//        var lastH: Int
//
//        init() {
//            self.val = 0
//            self.lastH = 0
//            self.lastV = 0
//        }
//
//        init(val: Int, v: Int, h: Int) {
//            self.val = val
//            self.lastV = v
//            self.lastH = h
//        }
//    }
//
//    func gridGame(_ grid: [[Int]]) -> Int {
//
//        let vc = grid.count
//        let hc = grid[0].count
//        // 存点[r][c]能取得的最大点数，需加上当前点数[r][c]
//        var dp: [[maxP]] = Array.init(repeating: Array.init(repeating: maxP(), count: hc), count: vc)
//
//        var mv = 0
//        for v in 0..<vc {
//            let carr = grid[v]
//            dp[v][0] = maxP.init(val: carr[0] + mv, v: v > 0 ? v-1:0, h: 0)
//            mv = dp[v][0].val
//        }
//
//        var mh = 0
//        for h in 0..<hc {
//            let rarr = grid[0]
//            dp[0][h] = maxP.init(val: rarr[h] + mh, v: 0, h: h > 0 ? h-1:0)
//            mh = dp[0][h].val
//        }
//
////        dp[0][0] = 0
//
//        for v in 1..<vc  {
//            for h in 1..<hc {
//                if dp[v-1][h].val > dp[v][h-1].val {
//                    dp[v][h] = maxP.init(val: dp[v-1][h].val + grid[v][h], v: v-1, h: h)
////                    dp[v-1][h] = 0
////                    if h > 1 {
////                        dp[v][h-1] = max(dp[v-1][h-1], dp[v][h-2]) + grid[v][h-1]
////                    } else {
////                        dp[v][h-1] = dp[v-1][h-1] + grid[v][h-1]
////                    }
//                } else {
//                    dp[v][h] = maxP.init(val: dp[v][h-1].val + grid[v][h], v: v, h: h-1)
////                    dp[v][h-1] = 0
////                    if v > 1 {
////                        dp[v-1][h] = max(dp[v-2][h], dp[v-1][h-1]) + grid[v-1][h]
////                    } else {
////                        dp[v-1][h] = dp[v-1][h-1] + grid[v-1][h]
////                    }
//                }
//            }
//        }
////        dp[vc-1][hc-1] = max(dp[vc-1][hc-2], dp[vc-2][hc-1])
//
//        var nums = grid
//
//        var pv = vc-1
//        var ph = hc-1
//        while pv > 0 || ph > 0 {
//            let p = dp[pv][ph]
//            nums[pv][ph] = 0
//            pv = p.lastV
//            ph = p.lastH
//            let last = dp[pv][ph]
//            dp[pv][ph] = maxP.init(val: 0, v: last.lastV, h: last.lastH)
//        }
//        dp[0][0] = maxP.init()
//
//        nums[0][0] = 0
//        mv = 0
//        for v in 0..<vc {
//            let carr = nums[v]
//            dp[v][0] = maxP.init(val: carr[0] + mv, v: v > 0 ? v-1:0, h: 0)
//            mv = dp[v][0].val
//        }
//
//        mh = 0
//        for h in 0..<hc {
//            let rarr = nums[0]
//            dp[0][h] = maxP.init(val: rarr[h] + mh, v: 0, h: h > 0 ? h-1:0)
//            mh = dp[0][h].val
//        }
//
//        for v in 1..<vc  {
//            for h in 1..<hc {
//                if dp[v-1][h].val > dp[v][h-1].val {
//                    dp[v][h] = maxP.init(val: dp[v-1][h].val + nums[v][h], v: v-1, h: h)
//                } else {
//                    dp[v][h] = maxP.init(val: dp[v][h-1].val + nums[v][h], v: v, h: h-1)
//                }
//            }
//        }
//
//        for v in 0..<vc {
//            var arr: [Int] = []
//            for h in 0..<hc {
//                arr.append(dp[v][h].val)
//            }
//            print(arr)
//        }
//
//        return dp[vc-1][hc-1].val
//    }
//}


class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {

        let vc = grid.count
        let hc = grid[0].count

        // 存点[r][c]能取得的最大点数，需加上当前点数[r][c]
        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: hc+1), count: vc)
        for i in 1...hc {
            dp[0][i] = dp[0][i-1] + grid[0][i-1]
            dp[1][i] = dp[1][i-1] + grid[1][i-1]
        }
        
        var res = Int.max
        for i in 1...hc {
            res = min(res, max(dp[0][hc] - dp[0][i], dp[1][i-1]))
        }
        
        return res
    }
}

let s = Solution()
// 63
//let res = s.gridGame([[20,3,20,17,2,12,15,17,4,15],[20,10,13,14,15,5,2,3,14,3]])
let res = s.gridGame([[20,3,20,17,2,12,15,17,4,15],[20,10,13,14,15,5,2,3,14,3]]
)
print(res)

// 1,3,1,15
// 1,3,3,1

// 0,0,0,0
// 1,3,3,0

// 2,5,4
// 1,5,1

// 0,0,4
// 1,0,0
