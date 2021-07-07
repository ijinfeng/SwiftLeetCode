
# 设计哈希集合

不使用任何内建的哈希表库设计一个哈希集合（HashSet）。

实现 MyHashSet 类：

* void add(key) 向哈希集合中插入值 key 。
* bool contains(key) 返回哈希集合中是否存在这个值 key 。
* void remove(key) 将给定值 key 从哈希集合中删除。如果哈希集合中没有这个值，什么也不做。

示例：
```
输入：
["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
[[], [1], [2], [1], [3], [2], [2], [2], [2]]
输出：
[null, null, null, true, false, null, true, null, false]

解释：
MyHashSet myHashSet = new MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // 返回 True
myHashSet.contains(3); // 返回 False ，（未找到）
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // 返回 True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // 返回 False ，（已移除）
```

解：
```

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

```
