import Foundation

// 二叉树展开为链表

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

let  s = Solution()
let root = TreeNode.init(1, TreeNode.init(2, TreeNode.init(3), TreeNode.init(4)), TreeNode.init(5, nil, TreeNode.init(6)))
s.flatten(root)
print(root)
