import Foundation

// 226. 翻转二叉树

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        swap(root)
        return root
    }
    
    func swap(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        let left = node.left
        node.left = node.right
        node.right = left
        if node.left != nil {
            swap(node.left)
        }
        if node.right != nil {
            swap(node.right)
        }
    }
}
