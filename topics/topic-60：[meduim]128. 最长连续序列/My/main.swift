import Foundation

//class Solution {
//    // 定义个map，key为num，value为一个bool值，表示是否查询过这个数
//    func longestConsecutive(_ nums: [Int]) -> Int {
//        var map: [Int: Bool] = [:]
//        for num in nums {
//            map[num] = false
//        }
//        var maxLength = 0
//        for i in 0..<nums.count {
//            var length = 1
//            var num = nums[i]
//            while let left = map[num-1] {
//                if left {
//                    break
//                }
//                map[num-1] = true
//                length += 1
//                num -= 1
//            }
//            num = nums[i]
//            while let right = map[num+1] {
//                if right {
//                    break
//                }
//                map[num+1] = true
//                length += 1
//                num += 1
//            }
//            maxLength = max(maxLength, length)
//        }
//        return maxLength
//    }
//}


class Solution {
    // 用一个字典去存，key为num，value为这个num相邻的长度
    func longestConsecutive(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var maxLength = 0
        for num in nums {
            if map[num] == nil {
                let left = map[num-1] ?? 0
                let right = map[num+1] ?? 0
                let length = left + right + 1
                maxLength = max(maxLength, length)
                
                map[num] = length
                map[num+right] = length
                map[num-left] = length
            }
        }
        return maxLength
    }
}

let s = Solution()
let res = s.longestConsecutive([0,3,7,2,5,8,4,6,0,1])

print(res)
