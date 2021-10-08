import Foundation

// https://leetcode-cn.com/problems/binary-search-tree-iterator/
// 二叉搜索树迭代器
// 中序：左根右

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


// 解1:转数组
class BSTIterator {

    var nodes: [Int] = []
    var p: Int = -1
    var count: Int!
    
    
   init(_ root: TreeNode?) {
       helper(root)
       count = nodes.count
   }
    
    func helper(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        helper(root.left)
        nodes.append(root.val)
        // 右节点
        helper(root.right)
    }
   
   func next() -> Int {
       p += 1
       return nodes[p]
   }
   
   func hasNext() -> Bool {
       p < count - 1
   }
}

let s = BSTIterator.init(TreeNode.init(7, TreeNode.init(3), TreeNode.init(15, TreeNode.init(9), TreeNode.init(20))))
print(s.next())

print(s.next())

print(s.hasNext())

print(s.next())

print(s.hasNext())

print(s.next())

print(s.hasNext())


print(s.next())

print(s.hasNext())
