import Foundation

// 347. 前 K 个高频元素

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]

        for num in nums {
            map[num, default: 0] += 1
        }

        var sortArr: [Int] = []
        var keyArr: [Int] = []

        for (key, value) in map {
            sortArr.append(value)
            keyArr.append(key)
        }


        // 选择排序
        for i in 0..<sortArr.count {
            var minIndex = i
            for j in i+1..<sortArr.count {
                if sortArr[minIndex] < sortArr[j] {
                    minIndex = j
                }
            }
            sortArr.swapAt(i, minIndex)
            keyArr.swapAt(i, minIndex)
        }
        
        print(sortArr)
        print(keyArr)
        
        return Array(keyArr[0..<k])
    }
}


let s = Solution()
let res = s.topKFrequent([1,34,3,6,7,2,3,7,89,2,324,3,46,7,1,1,2,2,1,45,2,2,3], 2)
print(res)



