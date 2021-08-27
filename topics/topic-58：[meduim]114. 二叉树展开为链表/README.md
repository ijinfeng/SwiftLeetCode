
# [114. 二叉树展开为链表](https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/)

给你二叉树的根结点 root ，请你将它展开为一个单链表：

展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
展开后的单链表应该与二叉树 先序遍历 顺序相同。
 

示例 1：

```
输入：root = [1,2,5,3,4,null,6]
输出：[1,null,2,null,3,null,4,null,5,null,6]
```
示例 2：
```
输入：root = []
输出：[]
```
示例 3：
```
输入：root = [0]
输出：[0]
```

提示：

* 树中结点数在范围 [0, 2000] 内
* -100 <= Node.val <= 100
 

> 进阶：你可以使用原地算法（O(1) 额外空间）展开这棵树吗？

解
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
   func flatten(_ root: TreeNode?) {
       guard var root = root else {
           return
       }
       var nodes: [Int] = []
       preorder(root, &nodes)
       root.left = nil
       root.right = nil
       root.val = nodes[0]
       
       for i in 1..<nodes.count {
           let val = nodes[i]
           root.right = TreeNode.init(val)
           root = root.right!
       }
   }
    
    
//    func preorder(_ root: TreeNode?) -> [Int] {
//        var stack: [TreeNode] = []
//        var res: [Int] = []
//        func next(_ root: TreeNode?) {
//            if let node = root {
//                res.append(node.val)
//                stack.append(node)
//                if let left = node.left {
//                    next(left)
//                } else {
//                    if let right = stack.popLast()?.right {
//                        // 向上去读右边
//                        next(right)
//                    } else {
//                        while let lastRoot = stack.popLast() {
//                            next(lastRoot.right)
//                        }
//                    }
//                }
//            }
//        }
//        next(root)
//        return res
//    }
    
    func preorder(_ root: TreeNode?, _ res: inout [Int]) {
        guard let root = root else {
            return
        }
        res.append(root.val)
        preorder(root.left, &res)
        preorder(root.right, &res)
    }
}


// 前序遍历
func preorder(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var res: [Int] = []
    func next(_ root: TreeNode?) {
        if let node = root {
            res.append(node.val)
            stack.append(node)
            if let left = node.left {
                next(left)
            } else {
                if let right = stack.popLast()?.right {
                    // 向上去读右边
                    next(right)
                } else {
                    while let lastRoot = stack.popLast() {
                        next(lastRoot.right)
                    }
                }
            }
        }
    }
    next(root)
    return res
}

```
