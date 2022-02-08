import Foundation

// 406. 根据身高重建队列

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        // 从大到小排序
        var so: [[Int]] = [people.first!]
        for i in 1..<people.count {
            let person = people[i]
            print("当前person=\(person)")
            var index = so.count - 1
            var insert = false
            while index >= 0 {
                let last = so[index]
                print("\t\t最后一位last=\(last),此时index=\(index)")
                if last[0] > person[0] {
                    so.insert(person, at: index+1)
                    insert = true
                    break
                } else if last[0] == person[0] {
                    if last[1] > person[1] {
                        index -= 1
                    } else {
                        so.insert(person, at: index+1)
                        insert = true
                        break
                    }
                } else {
                    index -= 1
                }
            }
            if insert == false {
                if index >= 0 {
                    so.insert(person, at: index)
                } else {
                    so.insert(person, at: 0)
                }
            }
        }
        
        print(so)
        
        for i in 0..<so.count {
            let e = so[i]
            if e[1] != i {
                so.remove(at: i)
                so.insert(e, at: e[1])
            }
        }
        
        print("排序完成")
        
        print(so)
        
        return so
    }
}


let s = Solution()
let res = s.reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]])



// 先从大到小排序，并且数组的第二个元素是从小到大排序，然后看people的第二位是几，那就插入到数组的第几位就好

// [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]

// [[7,0], [7,1], [6,1],[5,0],,[5,2].[4,4],

// [5,0],[[7,0],[5,2],[6,1],[4,4],[7,1],
