import UIKit


class MyHashMap {
    
    private var set = [ListNode?].init(repeating: nil, count: 1000)
        
    class ListNode {
        var key: Int = 0
        var value: Int = 0
        var next: ListNode?
        init(_ key: Int,_ val: Int) { self.key = key; self.value = val}
    }

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        if index >= set.count {
            // 扩容
            for _ in set.count...index {
                set.append(nil)
            }
            set[index] = ListNode.init(key, value)
        } else {
            if let node = set[index] {
                if node.key == key {
                    node.value = value
                } else {
                    var n: ListNode? = node
                    while n?.next != nil {
                        if n?.next!.key == key {
                            n?.next?.value = value
                            return
                        }
                        n = n?.next
                    }
                    n?.next = ListNode.init(key, value)
                }
            } else {
                set[index] = ListNode.init(key, value)
            }
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let index = hash(key)
        if index >= set.count {
            return -1
        }
        var n = set[index]
        while n != nil {
            if n!.key == key {
                return n!.value
            }
            n = n?.next
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let index = hash(key)
        if index >= set.count {
            return
        }
        if let node = set[index] {
            if node.key == key {
                set[index] = node.next
                return
            }
            var n: ListNode? = node
            while n?.next != nil {
                if n?.next?.key == key {
                    n?.next = n?.next?.next
                    return
                }
                n = n?.next
            }
        }
    }
    
    func hash(_ key: Int) -> Int {
        key % 1001
    }
}
