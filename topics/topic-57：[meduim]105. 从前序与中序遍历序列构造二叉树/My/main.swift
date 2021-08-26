import Foundation

// 从前序与中序遍历序列构造二叉树

// 前序：根左右
// 中序：左根右
// 后序：左右根

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


// 二叉树的根是前序的第一个元素：preorder[0]
// 根节点的左节点为前序的第二个元素：preorder[1]
//

class Solution {
    var map: [Int: Int] = [:]
    
   func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
       let count = preorder.count
       for i in 0..<count {
           map[inorder[i]] = i
       }
       return helper(preorder, inorder, 0, count - 1, 0, count - 1)
   }
    
    func helper(_ preorder: [Int], _ inorder: [Int], _ preorder_left: Int, _ preorder_right: Int, _ inorder_left: Int, _ inorder_right: Int) -> TreeNode? {
        if preorder_left > preorder_right {
            return nil
        }
        let preorder_root = preorder_left
        let inorder_root = map[preorder[preorder_root]]
        let root = TreeNode.init(preorder[preorder_root])
        let size_left_subtree = inorder_root! - inorder_left
        root.left = helper(preorder, inorder, preorder_left + 1, preorder_left + size_left_subtree, inorder_left, inorder_root! - 1)
        root.right = helper(preorder, inorder, preorder_left + size_left_subtree + 1, preorder_right, inorder_root! + 1, inorder_right)
        return root
    }
}



