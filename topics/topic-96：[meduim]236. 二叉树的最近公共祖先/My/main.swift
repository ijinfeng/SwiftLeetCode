import Foundation

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }


class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        guard let p = p else {
            return nil
        }
        guard let q = q else {
            return nil
        }
        if root.val == p.val || root.val == q.val {
            return root
        }
        let leftNode = lowestCommonAncestor(root.left, p, q)
        let rightNode = lowestCommonAncestor(root.right, p, q)
        if leftNode != nil && rightNode != nil {
            return root
        } else if leftNode == nil {
            return rightNode
        } else {
            return leftNode
        }
    }
    
}
