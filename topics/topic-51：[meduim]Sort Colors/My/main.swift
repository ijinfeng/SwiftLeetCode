import Foundation

// 颜色分类

// 0,1,2
// 定义left和right
// 将2往right方向移动
// 将0往0方向移动
// right > left
// current < right

class Solution {
    func sortColors(_ nums: inout [Int]) {
        let count = nums.count
        var left = 0
        var right = count - 1
        var index = 0
        while index <= right {
            if nums[index] == 0 {
              let temp = nums[left]
                nums[left] = nums[index]
                nums[index] = temp
                left += 1
                index += 1
            } else if nums[index] == 2 {
                let temp = nums[right]
                nums[right] = nums[index]
                nums[index] = temp
                // 因为我右侧的数据不知道，因此index不需要变，只要将右侧的索引往左移即可
                right -= 1
            } else {
                index += 1
            }
            print("arr=\(nums),index=\(index),left=\(left),right=\(right)")
        }
    }
}

let s = Solution()
var arr = [1,2,1,0,1,1,1,0,0,2,2,0,1,1,0,2]
s.sortColors(&arr)
print(arr)
