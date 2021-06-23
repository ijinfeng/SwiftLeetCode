import UIKit



// 搜索插入位置

/*
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 你可以假设数组中无重复元素。
 */


func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count {
        if nums[i] >= target {
            return i
        }
    }
    return nums.count
}

//searchInsert([1,3,5,6], 5)
//searchInsert([1,3,5,6], 2)
//searchInsert([], 1)
searchInsert([1,3,5,6], 7)
