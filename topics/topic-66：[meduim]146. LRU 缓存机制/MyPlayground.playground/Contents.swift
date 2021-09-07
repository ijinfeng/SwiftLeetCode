import UIKit


class LRUCache {
    
    private var maxCacheCount: Int!
    private var dic: [Int: ListNode] = [:]
    private var head: ListNode = ListNode.init(key: -1, val: -1)
    private var trail: ListNode = ListNode.init(key: -1, val: -1)
    
    class ListNode {
        var key: Int!
        var val: Int!
        var head: ListNode?
        var next: ListNode?
        
        init(key: Int, val: Int,_ head: ListNode? = nil ,_ next: ListNode? = nil) {
            self.key = key
            self.val = val
            self.head = head
            self.next = next
        }
    }
    

    init(_ capacity: Int) {
        maxCacheCount = capacity
        head.next = trail
        trail.head = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dic[key] else {
            return -1
        }
        moveToHead(node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dic[key] {
            moveToHead(node)
            node.val = value
        } else {
            let node = ListNode.init(key: key, val: value)
            addNode(node)
            dic[key] = node
        }
        if dic.values.count > maxCacheCount {
            let delete = deleteNode(trail.head!)
            dic.removeValue(forKey: delete.key)
        }
    }
    
    func addNode(_ node: ListNode) {
        node.head = head
        node.next = head.next
        head.next?.head = node
        head.next = node
    }
    
    func moveToHead(_ node: ListNode) {
        deleteNode(node)
        addNode(node)
    }
    
    func deleteNode(_ node: ListNode) -> ListNode {
        node.head?.next = node.next
        node.next?.head = node.head
        return node
    }
    
}


let lru = LRUCache.init(2)
lru.put(2, 1)
lru.put(3, 2)
lru.get(3)
lru.get(2)
lru.put(4, 3)
lru.get(2)
lru.get(3)
lru.get(4)


