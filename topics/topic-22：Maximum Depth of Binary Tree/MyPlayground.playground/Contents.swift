import UIKit


// 二叉树的最大深度


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


//func maxDepth(_ root: TreeNode?) -> Int {
//    return increase(root, 0)
//}
//
//func increase(_ node: TreeNode?, _ depth: Int) -> Int {
//    guard let _ = node else {
//        return depth
//    }
//    let d = depth + 1
//    let dl = increase(node?.left, d)
//    let dr = increase(node?.right, d)
//    return max(dl, dr)
//}


func maxDepth(_ root: TreeNode?) -> Int {
    guard let _ = root else {
        return 0
    }
    return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}
