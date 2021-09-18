
# [155. 最小栈](https://leetcode-cn.com/problems/min-stack/)

设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

push(x) —— 将元素 x 推入栈中。
pop() —— 删除栈顶的元素。
top() —— 获取栈顶元素。
getMin() —— 检索栈中的最小元素。
 

示例:

输入：
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

输出：
[null,null,null,null,-3,null,0,-2]

解释：
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.
 

提示：

pop、top 和 getMin 操作总是在 非空栈 上调用。


解：
```
class MinStack {
    var minValue = 0
    var diffs: [Int]!
    /** initialize your data structure here. */
    init() {
        diffs = []
    }
    
    func push(_ val: Int) {
        if diffs.isEmpty {
            diffs.append(0)
            minValue = val
        } else {
            let diff = val - minValue
            diffs.append(diff)
            minValue = min(minValue, val)
        }
    }
    
    func pop() {
        let lastDiff = diffs[diffs.count - 1]
        diffs.remove(at: diffs.count - 1)
        if lastDiff < 0 { // 说明这个pop的值是当前最小值
            minValue = minValue - lastDiff
        }
    }
    
    func top() -> Int {
        let lastDiff = diffs[diffs.count - 1]
        return lastDiff < 0 ? minValue : minValue + lastDiff
    }
    
    func getMin() -> Int {
        minValue
    }
}
```
