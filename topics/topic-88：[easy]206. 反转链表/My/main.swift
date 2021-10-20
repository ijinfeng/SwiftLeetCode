import Foundation

// 206. 反转链表
// https://leetcode-cn.com/problems/reverse-linked-list/

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
   func reverseList(_ head: ListNode?) -> ListNode? {
       var root = head
       var res: ListNode?
       while let _root = root {
           res = ListNode.init(_root.val, res)
           root = _root.next
       }
       return res
   }
}
