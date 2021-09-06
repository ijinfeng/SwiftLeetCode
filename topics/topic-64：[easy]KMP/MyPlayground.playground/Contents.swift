import UIKit

// KMP： 模式匹配算法

func kmp(_ s: String, _ sub: String) -> Bool {
    let count = s.count
    let scount = sub.count
    let sa = Array(s)
    let suba = Array(sub)
    
    var i = 0
    var j = 0
    
    while i < count {
        if sa[i] != suba[j] {
            i += 1
        } else {
            while i + 1 < count && j + 1 < scount  {
                if sa[i+1] == suba[j+1] {
                    i += 1
                    j += 1
                } else {
                    print("i=\(i),iv=\(sa[i]),j=\(j),jv=\(suba[j])")
                    
                }
            }
        }
    }
}

func help(_ sa: [String], _ suba: [String], _ _i: Int, _ _j: Int) {
    let count = sa.count
    let scount = suba.count
    
    var i = _i
    var j = _j
    
    while i + 1 < count && j + 1 < scount  {
        if sa[i+1] == suba[j+1] {
            i += 1
            j += 1
        } else {
            print("i=\(i),iv=\(sa[i]),j=\(j),jv=\(suba[j])")
            help(sa, suba, i, j-1)
        }
    }
}



