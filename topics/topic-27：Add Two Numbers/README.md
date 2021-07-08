
#  两数相加

给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。


示例 1：

```
输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.
```
示例 2：
```
输入：l1 = [0], l2 = [0]
输出：[0]
```
示例 3：
```
输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]
```

提示：

* 每个链表中的节点数在范围 [1, 100] 内
* 0 <= Node.val <= 9
* 题目数据保证列表表示的数字不含前导零


解1：
```
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var res = addString(convert(l1), convert(l2))
        print("res=\(res)")
        if res.count == 0 {
            return ListNode.init(0)
        }
        var last = res.last
        res.remove(at: res.index(before: res.endIndex))
        let node: ListNode? = ListNode.init(Int(String(last ?? "0")) ?? 0)
        var next: ListNode? = node
        while res.count > 0 {
            last = res.last
            res.remove(at: res.index(before: res.endIndex))
            next?.next = ListNode.init(Int(String(last ?? "0")) ?? 0)
            next = next?.next
        }
        return node
    }


    func convert(_ node: ListNode?) -> String {
        var n = node
        var s = ""
        while n != nil {
            s = String(n!.val) + s
            n = n?.next
        }
        return s
    }

    func addString(_ s1: String, _ s2: String) -> String {
        var res = ""
        var carry = false
        var index = -1
        while -index <= max(s1.count, s2.count) {
            var i1 = 0
            var i2 = 0
            if -index <= s1.count {
                i1 = Int(String(s1[s1.index(s1.endIndex, offsetBy: index)])) ?? 0
            }
            if -index <= s2.count {
                i2 = Int(String(s2[s2.index(s2.endIndex, offsetBy: index)])) ?? 0
            }
            var v = i1 + i2 + (carry ? 1 : 0)
            carry = false
            if v > 9 {
                carry = true
                v = v - 10
            }
            index -= 1
            res = String(v) + res
        }
        if carry {
            res = "1" + res
        }
        return res
    }
}
```


解2
```
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
```
