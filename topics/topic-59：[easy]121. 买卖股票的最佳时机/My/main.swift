import Foundation


// prices[y] - prices[x] 为最大
// y > x
// 价格最小不一定是最佳的买入时机，因为可能价格最小的那一天，后面没有更合适的卖出时机


// 从左侧开始，找第一个最小的值

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        let c = prices.count
        
        // 记最左侧第一个数为最小的
        var minLeft = 0
        var index = 0
        
        while index < c {
            if prices[minLeft] < prices[index] {
                res = max(res, prices[index] - prices[minLeft])
            } else {
                minLeft = index
            }
            index += 1
        }
        return res
    }
}

let s = Solution()
let res = s.maxProfit([7,1,5,3,6,4])
print(res)
