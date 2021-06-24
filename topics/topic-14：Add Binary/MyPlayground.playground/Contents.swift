import UIKit


// 二进制求和

/*
 给你两个二进制字符串，返回它们的和（用二进制表示）。

 输入为 非空 字符串且只包含数字 1 和 0。
 
 示例 1:

 输入: a = "11", b = "1"
 输出: "100"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"
 */

func addBinary(_ a: String, _ b: String) -> String {
    var max = ""
    var min = ""
    var res = ""
    if a.count > b.count {
        max = a
        min = b
    } else {
        max = b
        min = a
    }
    var carry: UInt8 = 0
    for i in (0..<max.count).reversed() {
        var resv: UInt8 = 0
        let maxv = (max[max.index("".startIndex, offsetBy: i)].asciiValue ?? 0) - 48
        if i >= max.count - min.count {
            let minv = (min[min.index("".startIndex, offsetBy: i - max.count + min.count)].asciiValue ?? 0) - 48
            resv = maxv + minv
//            print("==value=\(resv), carry=\(carry), max=\(maxv), min=\(minv)")
        } else {
            resv = maxv
//            print("==value=\(resv), carry=\(carry), max=\(maxv)")
        }
        resv += carry
        carry = 0
        if resv > 1 {
            carry = 1
            resv = resv - 2
        }
//        res.insert(String(resv).first!, at: "".startIndex)
        res = String(resv) + res
        
//        print("i=\(i), value=\(resv), carry=\(carry), res=\(res)")
    }
    if carry == 1 {
        res = "1" + res
    }
    return res
}


addBinary("11", "1")
addBinary("1010", "1011")
addBinary("1010", "11101")
