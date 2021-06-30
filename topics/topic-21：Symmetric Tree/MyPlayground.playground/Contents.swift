import UIKit

// 对称二叉树

// 给定一个二叉树，检查它是否是镜像对称的。


// 每行的个数是固定的

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


func isSymmetric(_ root: TreeNode?) -> Bool {
    return isSame(root?.left, root?.right)
}

func isSame(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
    if l == nil && r == nil {
        return true
    }
    if l != nil && r == nil {
        return false
    }
    if l == nil && r != nil {
        return false
    }
    if l!.val != r!.val {
        return false
    }
    return isSame(l?.left, r?.right) && isSame(l?.right, r?.left)
}

