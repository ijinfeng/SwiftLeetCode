
# 二叉树的最大深度

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。


示例：
```
给定二叉树 [3,9,20,null,null,15,7]，

    3
   / \
  9  20
    /  \
   15   7
返回它的最大深度 3 。
```

解：
```
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
```


