
# [234. 回文链表](https://leetcode-cn.com/problems/palindrome-linked-list/)

给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。

 

示例 1：


输入：head = [1,2,2,1]
输出：true
示例 2：


输入：head = [1,2]
输出：false
 

提示：

链表中节点数目在范围[1, 105] 内
0 <= Node.val <= 9
 

进阶：你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/palindrome-linked-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


``` swift 
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
            var nodes: [Int] = []
            var root: ListNode? = head
            while root != nil {
                nodes.append(root!.val)
                root = root?.next
            }
            let count = nodes.count
            var left = 0
            var right = 0
            if count % 2 == 0 {
                right = count / 2
                left = right - 1
            } else {
                left = count / 2
                right = left
            }
            
            while left >= 0 {
                if nodes[left] != nodes[right] {return false}
                left -= 1
                right += 1
            }
            return true
        }
}


```

