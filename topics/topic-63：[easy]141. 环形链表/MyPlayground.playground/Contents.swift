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
    
    // 快慢指针
    
    
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var fast = head?.next
        var slow = head
        
        while fast !== slow {
            if fast == nil || fast?.next == nil {
                return false
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return true
    }
}
