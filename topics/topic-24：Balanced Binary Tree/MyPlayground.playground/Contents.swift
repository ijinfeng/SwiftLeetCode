import UIKit


// 平衡二叉树

/*
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
 */



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


func isBalanced(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    if abs(depth(root?.left) - depth(root?.right)) > 1 {
        return false
    }
    if !isBalanced(root?.left) {
        return false
    }
    if !isBalanced(root?.right) {
        return false
    }
    return true
}


func depth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
   return max(depth(root?.left), depth(root?.right)) + 1
}

isBalanced(TreeNode.init(3, TreeNode.init(9, nil, nil), TreeNode.init(20, TreeNode.init(15), TreeNode.init(7))))
