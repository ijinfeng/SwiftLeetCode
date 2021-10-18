import Foundation

// 199. 二叉树的右视图
// https://leetcode-cn.com/problems/binary-tree-right-side-view/


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
    var nodes: [TreeNode] = []
    var res: [Int] = []
    
   func rightSideView(_ root: TreeNode?) -> [Int] {
       guard let root = root else {
           return []
       }
       nodes.append(root)
       helper()
       return res
   }
    
    func helper()  {
        if nodes.isEmpty {
            return
        }
        if let last = nodes.last {
            res.append(last.val)
        }
        var newNodes: [TreeNode] = []
        for node in  nodes {
            if let left = node.left {
                newNodes.append(left)
            }
            if let right = node.right {
                newNodes.append(right)
            }
        }
        nodes = newNodes
        helper()
    }
}

let s = Solution()
let res = s.rightSideView(TreeNode.init(1, TreeNode.init(2, nil, TreeNode.init(5)), TreeNode.init(3, nil, TreeNode.init(4))))
print(res)
