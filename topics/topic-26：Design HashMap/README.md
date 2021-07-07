
# 设计哈希映射

不使用任何内建的哈希表库设计一个哈希映射（HashMap）。

实现 MyHashMap 类：

* MyHashMap() 用空映射初始化对象
* void put(int key, int value) 向 HashMap 插入一个键值对 (key, value) 。如果 key 已经存在于映射中，则更新其对应的值 value 。
* int get(int key) 返回特定的 key 所映射的 value ；如果映射中不包含 key 的映射，返回 -1 。
* void remove(key) 如果映射中存在 key 的映射，则移除 key 和它所对应的 value 。


示例：
```
输入：
["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
[[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
输出：
[null, null, null, 1, -1, null, 1, null, -1]

解释：
MyHashMap myHashMap = new MyHashMap();
myHashMap.put(1, 1); // myHashMap 现在为 [[1,1]]
myHashMap.put(2, 2); // myHashMap 现在为 [[1,1], [2,2]]
myHashMap.get(1);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,2]]
myHashMap.get(3);    // 返回 -1（未找到），myHashMap 现在为 [[1,1], [2,2]]
myHashMap.put(2, 1); // myHashMap 现在为 [[1,1], [2,1]]（更新已有的值）
myHashMap.get(2);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,1]]
myHashMap.remove(2); // 删除键为 2 的数据，myHashMap 现在为 [[1,1]]
myHashMap.get(2);    // 返回 -1（未找到），myHashMap 现在为 [[1,1]]
```


解：
```
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
```
