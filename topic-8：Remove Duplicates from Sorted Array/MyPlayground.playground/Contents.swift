import UIKit


// 删除有序数组中的重复项


/*
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */




func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {return nums.count}
    var index = 1
    while true {
        var d = false
        for i in index..<nums.count {
            if nums[i] == nums[i-1] {
                index = i
                d = true
                break
            }
        }
        if d {
            nums.remove(at: index)
        } else {
            break
        }
    }
    
    print("\(nums.count), \(nums)")
    
    return nums.count
}

//var arr = [1,1,2]
//removeDuplicates(&arr)

//var a1 = [0,0,1,1,1,2,2,3,3,4]
//removeDuplicates(&a1)


var a2: [Int] = []
removeDuplicates(&a2)
