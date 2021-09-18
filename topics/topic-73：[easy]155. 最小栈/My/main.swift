import Foundation


//class MinStack {
//    var stack = [Int](), minValue = 0
//            // 3, 2 -> last = -1
//            // 2, 3 -> last = 1
//            func push(_ val: Int) {
//                if stack.isEmpty {
//                    stack.append(0)
//                    minValue = val
//                } else {
//                    let diff = val - minValue
//                    stack.append(diff)
//                    minValue = diff < 0 ? val : minValue
//                }
//            }
//            func pop() {
//                let diff = stack.popLast()!
//                if diff < 0 {
//                    minValue -= diff
//                }
//            }
//            func top() -> Int { stack.last! < 0 ? minValue : minValue + stack.last! }
//            func getMin() -> Int {
//                minValue
//
//            }
//}


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
            // 这一步很妙
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



let minStack =  MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
print( minStack.getMin());

