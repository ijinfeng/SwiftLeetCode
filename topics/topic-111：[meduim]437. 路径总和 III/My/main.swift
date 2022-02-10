import Foundation

// 437. 路径总和 III

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

class Solution {
   func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
       if root == nil {
           return 0
       }
       var res = searchPath(root, targetSum)
       res += pathSum(root?.left, targetSum)
       res += pathSum(root?.right, targetSum)
       return res
   }
    
    func searchPath(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        if root.val == targetSum {
            // 这里其实还可以向下寻找
            res = 1
        }
        
        res += searchPath(root.left, targetSum - root.val)
        res += searchPath(root.right, targetSum - root.val)
        return res
    }
}



