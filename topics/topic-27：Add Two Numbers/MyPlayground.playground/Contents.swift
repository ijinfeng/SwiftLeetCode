//import UIKit
//
//
//
//var s = "654"

//s.remove(at: s.index(before: s.endIndex))
//s



// 两数相加


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }


// int的长度为11位

//class Solution {
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var res = addString(convert(l1), convert(l2))
//        print("res=\(res)")
//        if res.count == 0 {
//            return ListNode.init(0)
//        }
//        var last = res.last
//        res.remove(at: res.index(before: res.endIndex))
//        let node: ListNode? = ListNode.init(Int(String(last ?? "0")) ?? 0)
//        var next: ListNode? = node
//        while res.count > 0 {
//            last = res.last
//            res.remove(at: res.index(before: res.endIndex))
//            next?.next = ListNode.init(Int(String(last ?? "0")) ?? 0)
//            next = next?.next
//        }
//        return node
//    }
//
//
//    func convert(_ node: ListNode?) -> String {
//        var n = node
//        var s = ""
//        while n != nil {
//            s = String(n!.val) + s
//            n = n?.next
//        }
//        return s
//    }
//
//    func addString(_ s1: String, _ s2: String) -> String {
//        var res = ""
//        var carry = false
//        var index = -1
//        while -index <= max(s1.count, s2.count) {
//            var i1 = 0
//            var i2 = 0
//            if -index <= s1.count {
//                i1 = Int(String(s1[s1.index(s1.endIndex, offsetBy: index)])) ?? 0
//            }
//            if -index <= s2.count {
//                i2 = Int(String(s2[s2.index(s2.endIndex, offsetBy: index)])) ?? 0
//            }
//            var v = i1 + i2 + (carry ? 1 : 0)
//            carry = false
//            if v > 9 {
//                carry = true
//                v = v - 10
//            }
//            index -= 1
//            res = String(v) + res
//        }
//        if carry {
//            res = "1" + res
//        }
//        return res
//    }
//}


// 解2
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let res = ListNode.init(0)
        var next: ListNode? = res
        var carry = false
        var n1 = l1, n2 = l2
        while n1 != nil || n2 != nil || carry {
            let v1 = n1 == nil ? 0 : n1!.val
            let v2 = n2 == nil ? 0 : n2!.val
            var v = v1 + v2 + (carry ? 1 : 0)
            carry = false
            if v > 9 {
                v = v - 10
                carry = true
            }
            next?.next = ListNode.init(v)
            next = next?.next
            n1 = n1?.next
            n2 = n2?.next
        }
        return res.next
    }
}


let s = Solution()
s.addTwoNumbers(ListNode.init(2, ListNode.init(4, ListNode.init(3))), ListNode.init(5, ListNode.init(6, ListNode.init(4))))
