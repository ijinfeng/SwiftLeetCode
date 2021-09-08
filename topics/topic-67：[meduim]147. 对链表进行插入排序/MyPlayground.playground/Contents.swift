import UIKit


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let prev = ListNode.init(-1, head)
        var sort: ListNode? = prev.next
        while sort?.next != nil {
            let val = sort!.next!.val
            if val < sort!.val {
                // 从头部开始遍历
                var move = prev
                while move.next !== sort && move.next != nil {
                    if move.next!.val > val {
                         
                    }
                }
                prev.next = sort?.next
                sort?.next = sort?.next?.next
            } else {
                sort = sort?.next
            }
        }
    }
}

