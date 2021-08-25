
# [二叉树的层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal)

给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

 

示例：
```
二叉树：[3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
返回其层序遍历结果：

[
  [3],
  [9,20],
  [15,7]
]
```


解：
```
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
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var nodes: [TreeNode?] = []
        nodes.append(root)
        var res = [[Int]]()
        while nodes.isEmpty == false {
            let size = nodes.count
            var list = [Int]()
            for _ in 0..<size {
                if let first = nodes.removeFirst() {
                    list.append(first.val)
                    if first.left != nil {
                        nodes.append(first.left)
                    }
                    if first.right != nil {
                        nodes.append(first.right)
                    }
                }
            }
            res.append(list)
        }
        return res
    }
}
```
