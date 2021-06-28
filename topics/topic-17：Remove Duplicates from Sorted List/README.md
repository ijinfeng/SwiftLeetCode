
# 删除排序链表中的重复元素

存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。

返回同样按升序排列的结果链表。


解:

```
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        var prefix = head
//        var sufix = prefix?.next
//        while let next = sufix {
//            sufix = next.next
//            if prefix!.val == next.val {
//                // 去掉next
//                prefix?.next = sufix
//            } else {
//                prefix = next
//            }
//        }
//        return head
      
      var prefix = head
      while let next = prefix?.next {
          if prefix!.val == next.val {
              prefix?.next = next.next
          } else {
              prefix = next
          }
      }
      return head
  }
```
