import UIKit

// 删除链表的倒数第 N 个结点


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

func printNode(_ node: ListNode?) {
    print("==========开始")
    var root = node
    while root != nil {
        print(root?.val)
        root = root?.next
    }
    print("===========结束")
}

//class Solution {
//   func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//    var res = head
//    var root = head
//    var nodes: [ListNode] = []
//    while root != nil {
//        nodes.append(root!)
//        root = root?.next
//    }
//
//    let deleteIndex = nodes.count - n
//    let deleteNode = nodes[deleteIndex]
//    if deleteIndex > 0 {
//        nodes[deleteIndex - 1].next = deleteNode.next
//    } else {
//        res = deleteNode.next
//    }
//
//    printNode(res)
//    return res
//   }
//
//
//
//}
    

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
            print("删头节点")
            printNode(head?.next)
            return head?.next
        } else {
            second?.next = second?.next?.next
            printNode(head)
            return head
        }
     }
}


let s = Solution()
s.removeNthFromEnd(ListNode.init(1, ListNode.init(2, ListNode.init(3, ListNode.init(4, ListNode.init(5))))), 5)
