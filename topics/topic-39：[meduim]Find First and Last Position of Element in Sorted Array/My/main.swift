import Foundation

// 在排序数组中查找元素的第一个和最后一个位置

// 先找到8，然后双指针往左右移动，需满足 nums[i-1] == nums[i+1]，否则表示其中一端 != target

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var l = 0
        var r = count - 1
        
        while l <= r {
            let mid = (r - l) / 2 + l
            if nums[mid] == target {
                // 双指针查找 begin 和 end
                var begin = mid
                var end = mid
                var enter = true
                
                while enter {
                    enter = false
                    if begin > 0 && nums[begin - 1] == target {
                        begin -= 1
                        enter = true
                    }
                    if end < count - 1 && nums[end + 1] == target {
                        end += 1
                        enter = true
                    }
                }
                return [begin, end]
            } else {
                // 继续找target
                if nums[mid] < target {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        
        return [-1, -1]
    }
}

let s = Solution()
let res = s.searchRange([5,7,7,8,8,10], 10)
print(res)
