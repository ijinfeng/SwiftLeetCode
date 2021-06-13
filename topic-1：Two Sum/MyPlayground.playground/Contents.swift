import UIKit

/* 两数之和
 
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 */


/* 示例 1:
 
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 */

/* 示例 2：
 
 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 */

/* 示例 3：
 
 输入：nums = [3,3], target = 6
 输出：[0,1]
 */


//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    if nums.count <= 1 {
//        return []
//    }
//    for i in 0..<nums.count  {
//        let n1 = nums[i]
//        for j in i+1..<nums.count {
//            if n1 + nums[j] == target {
//                return [i, j]
//            }
//        }
//    }
//    return []
//}


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count <= 1 {
        return []
    }
    var dic = [Int:Int]()
    for i in 0..<nums.count {
        let n = nums[i]
        if let index = dic[target - n] {
            return [index, i]
        }
        dic[n] = i
    }
    return []
}


// MARK:TEST

twoSum([2,7,11,15], 9)
twoSum([3,2,4], 6)
twoSum([3,3], 6)
