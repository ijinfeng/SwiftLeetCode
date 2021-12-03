import Foundation

 
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
