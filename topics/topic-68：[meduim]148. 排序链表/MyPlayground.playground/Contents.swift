import UIKit


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}




// 暴力排序

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // 先提取成数组，再转链表
        var list = head
        var arr: [Int] = []
        while list != nil  {
            arr.append(list!.val)
            list = list?.next
        }
        
        
        arr.sort()
        
        let res: ListNode = ListNode.init(-1)
        var change = res
        for a in arr {
            change.next = ListNode.init(a)
            change = change.next!
        }

        
        return res.next
    }
}

let s = Solution()
s.sortList(ListNode.init(4, ListNode.init(2, ListNode.init(1, ListNode.init(3)))))
