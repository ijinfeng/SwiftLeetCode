
# 合并两个有序链表


> 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

示例 1：
```
输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]
```
示例 2：
```
输入：l1 = [], l2 = []
输出：[]
```
示例 3：
```
输入：l1 = [], l2 = [0]
输出：[0]
```

### 思路

1、递归法
2、迭代法

本题我使用迭代法求解，建立哨兵节点`HEAD`，指向当前结果链表的末尾。开启while循环，每次循环判断`l1`和`l2`的头节点大小，将小的节点插入到结果链表中，更新`HEAD`，同时去掉小头链表的第一个节点。循环直到`l1`和`l2`都没有节点为止。

```
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

```




