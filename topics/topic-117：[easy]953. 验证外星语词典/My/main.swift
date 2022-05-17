import Foundation


class Solution {
    
    
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var orderMap: [Character: Int] = [:]
        for i in 0..<order.count  {
            let c = order[order.index(order.startIndex, offsetBy: i)]
            orderMap[c] = i
        }
        
        print(orderMap)
        
        for i in 0..<words.count-1 {
            let first = words[i]
            let second = words[i+1]
            var ptr = 0
            var sorted = false
            while (ptr < first.count && ptr < second.count) {
                let fc = first[first.index(first.startIndex, offsetBy: ptr)]
                let sc = second[second.index(second.startIndex, offsetBy: ptr)]
                if (orderMap[fc]! > orderMap[sc]!) {
                    return false
                } else if (orderMap[fc]! < orderMap[sc]!) {
                    sorted = true
                    break
                }
                ptr += 1
            }
            if (!sorted && first.count > second.count) {
                return false
            }
        }
        return true
    }
    

}

let s = Solution()
let ret = s.isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")
print(ret)
