import Foundation

/*
 堆排序
 
 设当前元素在数组中以R[i]表示，那么，

 (1) 它的左孩子结点是：R[2*i+1];

 (2) 它的右孩子结点是：R[2*i+2];

 (3) 它的父结点是：R[(i-1)/2];
 */


class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var _nums = nums
        quickSort(&_nums)
        return _nums[_nums.count - k]
    }
    
    func quickSort(_ arr: inout [Int]) {
       let left = 0
        let right = arr.count - 1
        quickSort(&arr, left, right)
    }

    func quickSort(_ arr: inout [Int], _ l: Int, _ r: Int) {
        var middle = 0
        if l < r {
            middle = quickSortHelp(&arr, l, r)
            quickSort(&arr, l, middle - 1)
            quickSort(&arr, middle + 1, r)
        }
    }

    func quickSortHelp(_ arr: inout [Int], _ l: Int, _ r: Int) -> Int {
        let pivot = arr[l]
        var left = l
        var right = r
        while left < right {
            while left < right && arr[right] >= pivot {
                right -= 1
            }
            arr[left] = arr[right]
            while left < right && arr[left] <= pivot {
                left += 1
            }
            arr[right] = arr[left]
            arr[left] = pivot
        }
        return left
    }

}
