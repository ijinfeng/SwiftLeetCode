import Foundation

// 337. 打家劫舍 III

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
    struct SubTreeStatus {
        var selected: Int
        var unselected: Int
    }
    
    func rob(_ root: TreeNode?) -> Int {
         let s = dfs(root)
        return max(s.selected, s.unselected)
    }
    
    func dfs(_ node: TreeNode?) -> SubTreeStatus {
        if (node == nil) {
            return SubTreeStatus(selected: 0, unselected: 0)
        }
        let l = dfs(node?.left)
        let r = dfs(node?.right)
        let selected = (node?.val ?? 0) + l.unselected + r.unselected
        let unselected = max(l.selected, l.unselected) + max(r.selected, r.unselected)
        return SubTreeStatus.init(selected: selected, unselected: unselected)
    }
}
