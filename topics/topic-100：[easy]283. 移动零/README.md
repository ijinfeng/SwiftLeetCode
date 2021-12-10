
# [283. 移动零](https://leetcode-cn.com/problems/move-zeroes/)

给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

示例:

输入: [0,1,0,3,12]
输出: [1,3,12,0,0]
说明:

必须在原数组上操作，不能拷贝额外的数组。
尽量减少操作次数。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/move-zeroes
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


```swift
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

```
