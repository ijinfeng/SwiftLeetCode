import UIKit


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}


class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // 一开始快慢指针都在head位置
        var fast = head
        var slow = head
        
        // 快指针每次移动2个node，慢指针每次移动1个node，也就是快指针速度是慢指针速度的两倍
        
        while fast != nil {
            slow = slow?.next
            if fast?.next == nil {
                return nil
            }
            fast = fast?.next?.next
            if fast === slow { // 第一次相遇
                var ptr = head
                while ptr !== slow {
                    ptr = ptr?.next
                    slow = slow?.next
                }
                return ptr
            }
        }
        return nil
    }
}

