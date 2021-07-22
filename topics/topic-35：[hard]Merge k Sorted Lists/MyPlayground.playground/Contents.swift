import UIKit

// 合并K个升序链表

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func p(_ node: ListNode?) {
    var h = node
    print("========= 开始")
    while h != nil {
        print(h!.val)
        h = h?.next
    }
    print("======== 结束")
}

//class Solution {
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        if lists.count < 2 {
//            return lists.first ?? nil
//        }
//        var next = 1
//        var last: ListNode? = lists[0]
//        while next < lists.count {
//            last = mergeTwoNodes(last, lists[next])
//            next += 1
//        }
//
//        p(last)
//        return last
//    }
//
//    func mergeTwoNodes(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
//        if node2 == nil {
//            return node1
//        }
//        var node: ListNode? = ListNode()
//        let head = node
//        var p1 = node1
//        var p2 = node2
//        while p1 != nil && p2 != nil {
//            if p1!.val > p2!.val {
//                node?.next = ListNode.init(p2!.val)
//                p2 = p2?.next
//            } else {
//                node?.next = ListNode.init(p1!.val)
//                p1 = p1?.next
//            }
//            node = node?.next
//        }
//        node?.next = p1 == nil ? p2 : p1
//        return head?.next
//    }
//}



// 分治

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

let s = Solution()
s.mergeKLists([ListNode.init(1, ListNode.init(4, ListNode.init(5))), ListNode.init(1, ListNode.init(3, ListNode.init(5))) , ListNode.init(2, ListNode.init(6)) ])



//protocol ProrityQueue {
//    associatedtype DataType: Comparable
//}


