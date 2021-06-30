# 二叉树的中序遍历

给定一个二叉树的根节点 root ，返回它的 中序 遍历。


示例 1：
```
输入：root = [1,null,2,3]
输出：[1,3,2]
```
示例 2：
```
输入：root = []
输出：[]
```
示例 3：
```
输入：root = [1]
输出：[1]
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


func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    pick(root, &res)
    return res
}

func pick(_ root: TreeNode?, _ arr: inout [Int]) {
    guard let root = root else {
        return
    }
    pick(root.left, &arr)
    arr.append(root.val)
    pick(root.right, &arr)
}

```

