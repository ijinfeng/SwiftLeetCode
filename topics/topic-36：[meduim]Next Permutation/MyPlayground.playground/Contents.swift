import UIKit

// 下一个排列


// 从十位数开始，每次都和其右边的数字比较大小，如果发现有超过当前数的，那么

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        next(&nums, nums.count - 2)
    }
    
    
    func next(_ nums: inout [Int], _ index: Int) {
        if index < 0 {
            print("---------> 来了， \(nums)")
            // 返回最大
            for i in 0..<nums.count {
                for j in i+1..<nums.count {
                    if nums[i]>nums[j] {
                        swapNums(&nums, i, j)
                    }
                }
            }
            return
        }
        if nums[index] < nums[index + 1] {
            // 这里需要找出第一个大于下标为 index 的值
            var target = index + 1
            for i in index+1..<nums.count {
                if nums[i] > nums[index] {
                    if nums[i] < nums[target] {
                        target = i
                    }
                }
            }
            swapNums(&nums, index, target)
            // p+1
            // nums.count - 1
            for i in index+1..<nums.count {
                for j in i+1..<nums.count {
                    if nums[i]>nums[j] {
                        swapNums(&nums, i, j)
                    }
                }
            }
        } else {
            next(&nums, index - 1)
        }
    }
    
    func swapNums(_ nums: inout [Int] ,_ index1: Int, _ index2: Int) {
        let left = nums[index1]
        let right = nums[index2]
        nums[index1] = right
        nums[index2] = left
        print("=====> \(nums), index1=\(index1),left=\(left),index2=\(index2),right=\(right)")
    }
}

let s = Solution()
var nums = [1,3,2]
s.nextPermutation(&nums)


nums
