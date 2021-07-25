import UIKit


// 最长有效括号


// 找到第一个有效的'('，记录index为i
// 从i+1位开始，检查是否有合并现象（合并指的是格式正确且连续，如'(())','()()()'）
// 记‘(’=1,')'=-1，期间有和为0的，就记录一次end，知道到最后一位
// 第二次循环从begin+1开始，还是先寻找第一个有效的'('

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var begin = 0
        var end = 0
        
        
    }
}
