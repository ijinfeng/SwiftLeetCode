
# [删除链表的倒数第N个节点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/)

给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

进阶：你能尝试使用一趟扫描实现吗？



示例 1：

```
输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]
```
示例 2：
```
输入：head = [1], n = 1
输出：[]
```
示例 3：
```
输入：head = [1,2], n = 1
输出：[1]
```

提示：

* 链表中结点的数目为 sz
* 1 <= sz <= 30
* 0 <= Node.val <= 100
* 1 <= n <= sz


```
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
```

解1:
```
class Solution {
   func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var res = head
    var root = head
    var nodes: [ListNode] = []
    while root != nil {
        nodes.append(root!)
        root = root?.next
    }

    let deleteIndex = nodes.count - n
    let deleteNode = nodes[deleteIndex]
    if deleteIndex > 0 {
        nodes[deleteIndex - 1].next = deleteNode.next
    } else {
        res = deleteNode.next
    }

    return res
   }



}
```


解2:
```
// 双指针法 ，两支针相隔n位
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var first = head
        var second = head
        for _ in 0..<n {
            first = first?.next
        }
        while first?.next != nil {
            first = first?.next
            second = second?.next
        }
        if first == nil { // 说明要删除头节点
            return head?.next
        } else {
            second?.next = second?.next?.next
            return head
        }
     }
}
```
