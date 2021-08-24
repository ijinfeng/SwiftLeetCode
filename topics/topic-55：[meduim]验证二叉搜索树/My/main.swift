import Foundation

// 验证二叉搜索树


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
    func isValidBST(_ root: TreeNode?) -> Bool {
        helper(root, Int.min, Int.max)
    }
    
    func helper(_ root: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let node = root else {
            return true
        }
        if node.val <= lower || node.val >= upper {
            return false
        }
        return helper(node.left, lower, node.val) && helper(node.right, node.val, upper)
    }
}
