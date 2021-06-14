import UIKit


// 两数相加

/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */



/* 示例 1：
 
 2->4->3
 
 5->6->4
 -----------------------
 7->0->8
 
 
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 */


/* 示例 2：
 
 输入：l1 = [0], l2 = [0]
 输出：[0]
 */


/* 示例 3：
 
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
 */

func pow(v: Int, n: Int) -> Int {
    if n <= 0 {
        return 1
    }
    var val = v
    for _ in 1..<n {
        val *= v
    }
    return val
}


pow(v: 10, n: 2)
pow(v: 10, n: 0)
pow(v: 10, n: 5)
pow(v: 10, n: 15)



public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil {
        return nil
    }

    func pow(v: Int, n: Int) -> Int {
        if n <= 0 {
            return 1
        }
        var val = v
        for _ in 1..<n {
            val *= v
        }
        return val
    }

    var v1 = 0
    var v2 = 0

    var next1: ListNode? = l1
    var i = 0
    while let next = next1 {
        v1 += (pow(v: 10, n: i) * next.val)
        next1 = next.next
        i += 1
    }

    var next2: ListNode? = l2
    i = 0
    while let next = next2 {
        v2 += (pow(v: 10, n: i) * next.val)
        next2 = next.next
        i += 1
    }

    var val = v1 + v2
    let node = ListNode.init(val % 10)
    var cur = node
    val /= 10
    while val > 0 {
        let n = ListNode.init(val % 10)
        cur.next = n
        cur = n
        val /= 10
    }

    return node
}

let l1 = ListNode.init(2, ListNode.init(4, ListNode.init(3, nil)))
let l2 = ListNode.init(5, ListNode.init(6, ListNode.init(4, nil)))
let n = addTwoNumbers(l1, l2)


let l3 = ListNode.init(0)
let l4 = ListNode.init(0)
let n1 = addTwoNumbers(l3, l4)

let l5 = ListNode.init(9, ListNode.init(9, ListNode.init(9, ListNode.init(9, ListNode.init(9, ListNode.init(9, ListNode.init(9, nil)))))))
let l6 = ListNode.init(9, ListNode.init(9, ListNode.init(9, ListNode.init(9, nil))))
let n2 = addTwoNumbers(l5, l6)
