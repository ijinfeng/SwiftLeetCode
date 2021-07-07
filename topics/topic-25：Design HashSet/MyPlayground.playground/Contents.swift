import UIKit

// 设计哈希集合

class MyHashSet {
private var set = [ListNode?].init(repeating: nil, count: 1000)
    
    class ListNode {
        var val: Int = 0
        var next: ListNode?
         init() { self.val = 0; next = nil }
         init(_ val: Int) { self.val = val; next = nil}
         init(_ val: Int, _ next: ListNode? ) { self.val = val; self.next = next }
    }
    
    init() {
        
    }
    
    func add(_ key: Int) {
        let index = hash(key)
        if index >= set.count {
            // 扩容
            for _ in set.count...index {
                set.append(nil)
            }
            set[index] = ListNode.init(key)
        } else {
            var node = set[index]
            if node != nil {
                if node!.val == key {
                    return
                }
                while node?.next != nil {
                    node = node?.next
                    if node!.val == key {
                        return
                    }
                }
                node?.next = ListNode.init(key)
            } else {
                set[index] = ListNode.init(key)
            }
        }
    }
    
    func remove(_ key: Int) {
        let index = hash(key)
        if index >= set.count {
            return
        }
        var node = set[index]
        if node == nil {
            return
        }
        if node!.val == key {
            set[index] = node?.next
            return
        }
        while node?.next != nil {
            if node?.next!.val == key {
                node?.next = node?.next?.next
                return
            }
            node = node?.next
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let index = hash(key)
        if index >= set.count {
            return false
        }
        var node = set[index]
        while node != nil {
            if node!.val == key {
                return true
            }
            node = node?.next
        }
        return false
    }
    

    func hash(_ key: Int) -> Int {
        key % 1001
    }
}
