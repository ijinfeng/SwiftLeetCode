import Foundation

class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var map: [String: (Double, String)] = [:]
        
        for i in 0..<equations.count {
            let equation = equations[i]
            let a = equation[0]
            let b = equation[1]
            let v = values[i]
            // a / b = v
            // a = v * b
            // b = 1/v * a
            map[a] = (v, b)
            map[b] = (1/v, a)
        }
        
        map.forEach { key, value in
            print("key=\(key), value=\(value)")
        }
        
        var res: [Double] = []
        for query in queries {
            let a = query[0]
            let b = query[1]
            if let va = map[a], var vb = map[b] {
                // 这里得保证'.1'得值一致
                // 这里需要考虑不能死循环
                let tag = vb.1
                var hasCyc = false
                while va.1 != vb.1 {
                    vb = (vb.0 * map[vb.1]!.0, map[vb.1]!.1)
                    if vb.1 == tag {
                        // 进入死循环
                        hasCyc = true
                        break
                    }
                }
                if hasCyc {
                    res.append(-1)
                }  else {
                    let value = va.0 / vb.0
                    res.append(value)
                }
            } else {
                res.append(-1)
            }
        }
        
        return res
    }
}


let s = Solution()

/*
 [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]]
 [3.0,4.0,5.0,6.0]
 [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]
 */
let equ = [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]]
let val = [3.0,4.0,5.0,6.0]
let que = [["x1","x5"]]
let res = s.calcEquation(equ, val, que)
print(res)

