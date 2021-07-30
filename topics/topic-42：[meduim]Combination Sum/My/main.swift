import Foundation

// 组合总和

//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        var res:[[Int]] = []
//        var combine: [Int] = []
//        leftSum(candidates, target, 0, &res, &combine)
//
//        return res
//    }
//
//    func leftSum(_ arr: [Int], _ target: Int, _ index: Int/*下次搜索的起始点*/, _ res: inout [[Int]], _ collection: inout [Int]) {
//        if index >= arr.count {
//            return
//        }
//        if target == 0 {
//            res.append(collection)
//            return
//        }
//
//        leftSum(arr, target, index + 1, &res, &collection)
//
//        if target - arr[index] >= 0 {
//            collection.append(arr[index])
//            leftSum(arr, target - arr[index], index, &res, &collection)
//            collection.removeLast()
//        }
//    }
//}


class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res:[[Int]] = []
        var combine: [Int] = []
        let arr = candidates.sorted()
        searchCombine(arr, candidates.count, target, 0, &res, &combine)
        return res
    }
    
    func searchCombine(_ candidates: [Int], _ len: Int, _ target: Int, _ index: Int, _ res: inout [[Int]], _ combine: inout [Int] ) {
        if target == 0 {
            res.append(combine)
            return
        }
        
        for i in index..<len {
            if target - candidates[i] < 0 {
                return
            }
            combine.append(candidates[i])
            searchCombine(candidates, len, target - candidates[i], i, &res, &combine)
            combine.removeLast()
        }
    }
}


let s = Solution()
let res = s.combinationSum([2,3,5], 8)
print(res)
