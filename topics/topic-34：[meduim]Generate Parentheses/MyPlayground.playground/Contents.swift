import UIKit

// 括号生成

// 知道了前面一半的括号，就知道了后面一半的括号
// 从第2位开始，每次向后移动一位，比如 "("，假定第二位是"("，那么就有字符串"(("，第三位就一定是"("或")"，在n>=3的情况下，都属于有效

class Solution {
    var res: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        res = []
        createOne(1, n, "(", 1, 1)
        print("=======> \(res)")
        return res
    }
    
    // 有两个条件：
    // 1、一个是val必须 >=0
    // 2、相同的单个括号的个数最大 ==n
    func createOne(_ i: Int, _ n: Int, _ str: String, _ val: Int, _ left: Int) {
        print("i=\(i),n=\(n),str=\(str),val=\(val),left=\(left)")
        if i < n * 2 - 1 {
            if val > 0 {
                createOne(i+1, n, str.appending(")"), val - 1, left)
            }
            if left < n {
                createOne(i+1, n, str.appending("("), val + 1, left + 1)
            }
        } else {
            res.append(str.appending(")"))
        }
    }
}


let s = Solution()
s.generateParenthesis(3)
