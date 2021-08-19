import Foundation

// 单词搜索


// 一行行扫描
// 取 word 的第 i 个字符，判断是否在某一行中
// 比如 word[i] 位于第 j 行的第 m 个位置，那么 word[i+1] 则需要在 board[j][m] 的上下左右寻找第二个位置
// 如果找不到，那么从 j 行的下一个 n 位置开始
// 直到遍历完所有行


class Solution {
    
    // 尝试使用动态规划思想解
    // 定义二维数组 dp
    
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var res = false
        
        
//
//        var dp = Array<[Character]>.init(repeating: Array<Character>.init(repeating: "A", count: m), count: n)
//
        
        findNext(0, 0, 0, board, word)
    
        
        return true
    }
    
    
    /// 寻找下一个字符
    /// - Parameters:
    ///   - index: 找word的第几个字符
    ///   - fm: 第几列
    ///   - fn: 第几行
    ///   - board: *
    ///   - word: *
    func findNext(_ index: Int, _ fm: Int, _ fn: Int, _ board: [[Character]], _ word: String) {
        let wc = word[word.index("".startIndex, offsetBy: index)]
        // 列
        let m = board[0].count
        // 行
        let n = board.count
        
        let c = board[fn][fm]
        if c != wc {
            if fm == m - 1 { // 最后一个了也没找到，说明这个点不存在
                
            }
            
        }
    }
    
}
