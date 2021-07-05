import UIKit

// 将有序数组转换为二叉搜索树

/*
 给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。

 高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。
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


func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    // [-10,-3,  0,   5,9,  12,   13,15,18,19,20]
    return help(nums, 0, nums.count - 1)
}

func help(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
    if l > r {
        return nil
    }
    let mid = l + (r - l) / 2
    let root = TreeNode.init(nums[mid])
    root.left = help(nums, l, mid - 1)
    root.right = help(nums, mid + 1, r)
    return root
}
