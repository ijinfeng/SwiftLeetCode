
# [合并K个升序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists)

给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

 

示例 1：
```
输入：lists = [[1,4,5],[1,3,4],[2,6]]
输出：[1,1,2,3,4,4,5,6]
解释：链表数组如下：
[
  1->4->5,
  1->3->4,
  2->6
]
将它们合并到一个有序链表中得到。
1->1->2->3->4->4->5->6
```
示例 2：
```
输入：lists = []
输出：[]
```
示例 3：
```
输入：lists = [[]]
输出：[]
```

提示：

* k == lists.length
* 0 <= k <= 10^4
* 0 <= lists[i].length <= 500
* -10^4 <= lists[i][j] <= 10^4
* lists[i] 按 升序 排列
* lists[i].length 的总和不超过 10^4


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
// 顺序合并法
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count < 2 {
            return lists.first ?? nil
        }
        var next = 1
        var last: ListNode? = lists[0]
        while next < lists.count {
            last = mergeTwoNodes(last, lists[next])
            next += 1
        }

        p(last)
        return last
    }

    func mergeTwoNodes(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        if node2 == nil {
            return node1
        }
        var node: ListNode? = ListNode()
        let head = node
        var p1 = node1
        var p2 = node2
        while p1 != nil && p2 != nil {
            if p1!.val > p2!.val {
                node?.next = ListNode.init(p2!.val)
                p2 = p2?.next
            } else {
                node?.next = ListNode.init(p1!.val)
                p1 = p1?.next
            }
            node = node?.next
        }
        node?.next = p1 == nil ? p2 : p1
        return head?.next
    }
}

```

解2:

```
// 分治法
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return merge(lists, 0, lists.count - 1)
    }
    
    func merge(_ lists: [ListNode?], _ l :Int,_ r: Int) -> ListNode? {
        if l == r {
            return lists[l]
        }
        if l > r {
            return nil
        }
        let mid = (l + r) / 2
        return mergeTwoNodes(merge(lists, l, mid), merge(lists, mid + 1, r))
    }
    
    func mergeTwoNodes(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        if node2 == nil {
            return node1
        }
        var node: ListNode? = ListNode()
        let head = node
        var p1 = node1
        var p2 = node2
        while p1 != nil && p2 != nil {
            if p1!.val > p2!.val {
                node?.next = ListNode.init(p2!.val)
                p2 = p2?.next
            } else {
                node?.next = ListNode.init(p1!.val)
                p1 = p1?.next
            }
            node = node?.next
        }
        node?.next = p1 == nil ? p2 : p1
        return head?.next
    }
}
```
