import Foundation

//func moveZeroes(_ nums: inout [Int]) {
//    let count = nums.count
//    var i = 0
//    var doCount = 0
//    while doCount < count {
//        let v = nums[i]
//        if v == 0 {
//            nums.remove(at: i)
//            i -= 1
//            nums.append(v)
//        }
//        i += 1
//        doCount += 1
//    }
//}

// 双指针法，将0冒泡上去
func moveZeroes(_ nums: inout [Int]) {
    // 有个指针每次都移动1 -- p
    // 有个指针只有遇到非0时才移动1 -- q
    var p = 0
    var q = 0
    let count = nums.count
    while p < count {
        if nums[p] != 0 {
            nums.swapAt(p, q)
            q += 1
        }
        p += 1
    }
}

var nums = [0,0,1]
moveZeroes(&nums)
print(nums)
