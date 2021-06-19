import UIKit

// 合并两个有序链表

/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 提示：
 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列
 */

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    
    var res: ListNode?
    var head: ListNode?
    var _l1 = l1
    var _l2 = l2
    
//    debugNode(node: _l1)
//    debugNode(node: _l2)
//    debugNode(node: res)
    while true {
        if _l1 != nil && _l2 != nil {
            var val = 0
            if  _l1!.val < _l2!.val {
                val = _l1!.val
                _l1 = _l1!.next
            } else {
                val = _l2!.val
                _l2 = _l2!.next
            }
            let new = ListNode.init(val)
            if let r = head {
                r.next = new
                head = r.next
            } else {
                res = new
                head = res
            }
//            print("-------1")
//            debugNode(node: _l1)
//            debugNode(node: _l2)
//            debugNode(node: res)
        } else if _l1 != nil {
            head?.next = ListNode.init(_l1!.val)
            head = head?.next
            _l1 = _l1!.next
//            print("-------2")
//            debugNode(node: _l1)
//            debugNode(node: res)
        } else if _l2 != nil {
            head?.next = ListNode.init(_l2!.val)
            head = head?.next
            _l2 = _l2!.next
//            print("-------3")
//            debugNode(node: _l2)
//            debugNode(node: res)
        } else {
            break
        }
    }
    
    return res
}


func debugNode(node: ListNode?) {
    var n: ListNode? = node
    var arr: [Int] = []
    while n != nil {
        arr.append(n!.val)
        n = n!.next
    }
    print("node=\(arr)")
}

mergeTwoLists(ListNode.init(-10, ListNode.init(-10, ListNode.init(-9, ListNode.init(-4, ListNode.init(1, ListNode.init(6, ListNode.init(6))))))), ListNode.init(-7))
//mergeTwoLists(nil, nil)
//mergeTwoLists(ListNode.init(1, ListNode.init(2, ListNode.init(4))), ListNode.init(2, ListNode.init(4)))



