import Foundation

// 二叉树的层序遍历

public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init() { self.val = 0; self.left = nil; self.right = nil; }
 public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     self.val = val
     self.left = left
     self.right = right
 }
}

class Solution {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var nodes: [TreeNode?] = []
        nodes.append(root)
        var res = [[Int]]()
        while nodes.isEmpty == false {
            let size = nodes.count
            var list = [Int]()
            for _ in 0..<size {
                if let first = nodes.removeFirst() {
                    list.append(first.val)
                    if first.left != nil {
                        nodes.append(first.left)
                    }
                    if first.right != nil {
                        nodes.append(first.right)
                    }
                }
            }
            res.append(list)
        }
        return res
    }
}


func createTreeNode(from inputs: [Int?]) -> TreeNode? {
    if inputs.count == 0 {
        return nil
    }
    var row = 0
    var dic: [Int: [TreeNode?]] = [:]
    var max = intPow(0)
    
    var pdic: [Int: [Int?]] = [:]
    var pLine = false
    for i in 0..<inputs.count {
        // 0    [0,1]
        // 0,1  [1,2]
        // 2,3,4,5  [2,4]
        // 6,7,8,9,10,11,12,13 [3,8]
        if i >= max {
            row += 1
            max += intPow(row)
            pLine = true
        }
        if dic[row] == nil {
            dic[row] = []
        }
        if pdic[row] == nil {
            pdic[row] = []
        }
        if let v = inputs[i] {
            dic[row]!.append(TreeNode.init(v))
            pdic[row]!.append(v)
        } else {
            dic[row]!.append(nil)
            pdic[row]!.append(nil)
        }
        if pLine {
//            print("row=\(row-1), count=\(pdic[row-1]!.count), vs=\(pdic[row-1]!)")
            pLine = false
        }
    }
    
    func helper(row: Int)  {
        let topRow = row - 1
        let max = intPow(row)
        let nodes = dic[topRow]!
        let curNodes = dic[row]!
        for i in 0..<max {
            if i >= curNodes.count {
                return
            }
            let topIndex = i / 2
            if let node = nodes[topIndex] {
                
                if topIndex * 2 == i {
                    // 左
                    node.left = curNodes[i]
                } else {
                    // 右
                    node.right = curNodes[i]
                }
            }
        }
    }
    
    for i in 1...row {
        helper(row: i)
    }
    return dic[0]![0]
}

func intPow(_ count: Int) -> Int {
    var res = 1
    for _ in 0..<count {
        res *= 2
    }
    return res
}



let node = createTreeNode(from: [-150,nil,-149,nil,-148,nil,-147,nil,-146,nil,-145,nil,-144,nil,-143,nil,-142,nil,-141,nil,-140,nil,-139,nil,-138,nil,-137,nil,-136,nil,-135,nil,-134,nil,-133,nil,-132,nil,-131,nil,-130,nil,-129,nil,-128,nil,-127,nil,-126,nil,-125,nil,-124,nil,-123,nil,-122,nil,-121,nil,-120,nil,-119,nil,-118,nil,-117,nil,-116,nil,-115,nil,-114,nil,-113,nil,-112,nil,-111,nil,-110,nil,-109,nil,-108,nil,-107,nil,-106,nil,-105,nil,-104,nil,-103,nil,-102,nil,-101,nil,-100,nil,-99,nil,-98,nil,-97,nil,-96,nil,-95,nil,-94,nil,-93,nil,-92,nil,-91,nil,-90,nil,-89,nil,-88,nil,-87,nil,-86,nil,-85,nil,-84,nil,-83,nil,-82,nil,-81,nil,-80,nil,-79,nil,-78,nil,-77,nil,-76,nil,-75,nil,-74,nil,-73,nil,-72,nil,-71,nil,-70,nil,-69,nil,-68,nil,-67,nil,-66,nil,-65,nil,-64,nil,-63,nil,-62,nil,-61,nil,-60,nil,-59,nil,-58,nil,-57,nil,-56,nil,-55,nil,-54,nil,-53,nil,-52,nil,-51,nil,-50,nil,-49,nil,-48,nil,-47,nil,-46,nil,-45,nil,-44,nil,-43,nil,-42,nil,-41,nil,-40,nil,-39,nil,-38,nil,-37,nil,-36,nil,-35,nil,-34,nil,-33,nil,-32,nil,-31,nil,-30,nil,-29,nil,-28,nil,-27,nil,-26,nil,-25,nil,-24,nil,-23,nil,-22,nil,-21,nil,-20,nil,-19,nil,-18,nil,-17,nil,-16,nil,-15,nil,-14,nil,-13,nil,-12,nil,-11,nil,-10,nil,-9,nil,-8,nil,-7,nil,-6,nil,-5,nil,-4,nil,-3,nil,-2,nil,-1,nil,0,nil,1,nil,2,nil,3,nil,4,nil,5,nil,6,nil,7,nil,8,nil,9,nil,10,nil,11,nil,12,nil,13,nil,14,nil,15,nil,16,nil,17,nil,18,nil,19,nil,20,nil,21,nil,22,nil,23,nil,24,nil,25,nil,26,nil,27,nil,28,nil,29,nil,30,nil,31,nil,32,nil,33,nil,34,nil,35,nil,36,nil,37,nil,38,nil,39,nil,40,nil,41,nil,42,nil,43,nil,44,nil,45,nil,46,nil,47,nil,48,nil,49,nil,50,nil,51,nil,52,nil,53,nil,54,nil,55,nil,56,nil,57,nil,58,nil,59,nil,60,nil,61,nil,62,nil,63,nil,64,nil,65,nil,66,nil,67,nil,68,nil,69,nil,70,nil,71,nil,72,nil,73,nil,74,nil,75,nil,76,nil,77,nil,78,nil,79,nil,80,nil,81,nil,82,nil,83,nil,84,nil,85,nil,86,nil,87,nil,88,nil,89,nil,90,nil,91,nil,92,nil,93,nil,94,nil,95,nil,96,nil,97,nil,98,nil,99,nil,100,nil,101,nil,102,nil,103,nil,104,nil,105,nil,106,nil,107,nil,108,nil,109,nil,110,nil,111,nil,112,nil,113,nil,114,nil,115,nil,116,nil,117,nil,118,nil,119,nil,120,nil,121,nil,122,nil,123,nil,124,nil,125,nil,126,nil,127,nil,128,nil,129,nil,130,nil,131,nil,132,nil,133,nil,134,nil,135,nil,136,nil,137,nil,138,nil,139,nil,140,nil,141,nil,142,nil,143,nil,144,nil,145,nil,146,nil,147,nil,148,nil,149,nil,150,nil,151,nil,152,nil,153,nil,154,nil,155,nil,156,nil,157,nil,158,nil,159,nil,160,nil,161,nil,162,nil,163,nil,164,nil,165,nil,166,nil,167,nil,168,nil,169,nil,170,nil,171,nil,172,nil,173,nil,174,nil,175,nil,176,nil,177,nil,178,nil,179,nil,180,nil,181,nil,182,nil,183,nil,184,nil,185,nil,186,nil,187,nil,188,nil,189,nil,190,nil,191,nil,192,nil,193,nil,194,nil,195,nil,196,nil,197,nil,198,nil,199,nil,200,nil,201,nil,202,nil,203,nil,204,nil,205,nil,206,nil,207,nil,208,nil,209,nil,210,nil,211,nil,212,nil,213,nil,214,nil,215,nil,216,nil,217,nil,218,nil,219,nil,220,nil,221,nil,222,nil,223,nil,224,nil,225,nil,226,nil,227,nil,228,nil,229,nil,230,nil,231,nil,232,nil,233,nil,234,nil,235,nil,236,nil,237,nil,238,nil,239,nil,240,nil,241,nil,242,nil,243,nil,244,nil,245,nil,246,nil,247,nil,248,nil,249,nil,250,nil,251,nil,252,nil,253,nil,254,nil,255,nil,256,nil,257,nil,258,nil,259,nil,260,nil,261,nil,262,nil,263,nil,264,nil,265,nil,266,nil,267,nil,268,nil,269,nil,270,nil,271,nil,272,nil,273,nil,274,nil,275,nil,276,nil,277,nil,278,nil,279,nil,280,nil,281,nil,282,nil,283,nil,284,nil,285,nil,286,nil,287,nil,288,nil,289,nil,290,nil,291,nil,292,nil,293,nil,294,nil,295,nil,296,nil,297,nil,298,nil,299,nil,300,nil,301,nil,302,nil,303,nil,304,nil,305,nil,306,nil,307,nil,308,nil,309,nil,310,nil,311,nil,312,nil,313,nil,314,nil,315,nil,316,nil,317,nil,318,nil,319,nil,320,nil,321,nil,322,nil,323,nil,324,nil,325,nil,326,nil,327,nil,328,nil,329,nil,330,nil,331,nil,332,nil,333,nil,334,nil,335,nil,336,nil,337,nil,338,nil,339,nil,340,nil,341,nil,342,nil,343,nil,344,nil,345,nil,346,nil,347,nil,348,nil,349,nil,350,nil,351,nil,352,nil,353,nil,354,nil,355,nil,356,nil,357,nil,358,nil,359,nil,360,nil,361,nil,362,nil,363,nil,364,nil,365,nil,366,nil,367,nil,368,nil,369,nil,370,nil,371,nil,372,nil,373,nil,374,nil,375,nil,376,nil,377,nil,378,nil,379,nil,380,nil,381,nil,382,nil,383,nil,384,nil,385,nil,386,nil,387,nil,388,nil,389,nil,390,nil,391,nil,392,nil,393,nil,394,nil,395,nil,396,nil,397,nil,398,nil,399,nil,400,nil,401,nil,402,nil,403,nil,404,nil,405,nil,406,nil,407,nil,408,nil,409,nil,410,nil,411,nil,412,nil,413,nil,414,nil,415,nil,416,nil,417,nil,418,nil,419,nil,420,nil,421,nil,422,nil,423,nil,424,nil,425,nil,426,nil,427,nil,428,nil,429,nil,430,nil,431,nil,432,nil,433,nil,434,nil,435,nil,436,nil,437,nil,438,nil,439,nil,440,nil,441,nil,442,nil,443,nil,444,nil,445,nil,446,nil,447,nil,448,nil,449,nil,450,nil,451,nil,452,nil,453,nil,454,nil,455,nil,456,nil,457,nil,458,nil,459,nil,460,nil,461,nil,462,nil,463,nil,464,nil,465,nil,466,nil,467,nil,468,nil,469,nil,470,nil,471,nil,472,nil,473,nil,474,nil,475,nil,476,nil,477,nil,478,nil,479,nil,480,nil,481,nil,482,nil,483,nil,484,nil,485,nil,486,nil,487,nil,488,nil,489,nil,490,nil,491,nil,492,nil,493,nil,494,nil,495,nil,496,nil,497,nil,498,nil,499,nil,500,nil,501,nil,502,nil,503,nil,504,nil,505,nil,506,nil,507,nil,508,nil,509,nil,510,nil,511,nil,512,nil,513,nil,514,nil,515,nil,516,nil,517,nil,518,nil,519,nil,520,nil,521,nil,522,nil,523,nil,524,nil,525,nil,526,nil,527,nil,528,nil,529,nil,530,nil,531,nil,532,nil,533,nil,534,nil,535,nil,536,nil,537,nil,538,nil,539,nil,540,nil,541,nil,542,nil,543,nil,544,nil,545,nil,546,nil,547,nil,548,nil,549,nil,550,nil,551,nil,552,nil,553,nil,554,nil,555,nil,556,nil,557,nil,558,nil,559,nil,560,nil,561,nil,562,nil,563,nil,564,nil,565,nil,566,nil,567,nil,568,nil,569,nil,570,nil,571,nil,572,nil,573,nil,574,nil,575,nil,576,nil,577,nil,578,nil,579,nil,580,nil,581,nil,582,nil,583,nil,584,nil,585,nil,586,nil,587,nil,588,nil,589,nil,590,nil,591,nil,592,nil,593,nil,594,nil,595,nil,596,nil,597,nil,598,nil,599,nil,600])
print("\n\n===================")

 let s = Solution()
let res = s.levelOrder(node)
print(res)

