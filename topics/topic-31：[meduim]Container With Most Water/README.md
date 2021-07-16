
# 盛最多水的容器

给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

**说明**：你不能倾斜容器。

示例 1：


```
输入：[1,8,6,2,5,4,8,3,7]
输出：49 
解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
```
示例 2：
```
输入：height = [1,1]
输出：1
```
示例 3：
```
输入：height = [4,3,2,1,4]
输出：16
```
示例 4：
```
输入：height = [1,2,1]
输出：2
```

提示：

* n = height.length
* 2 <= n <= 3 * 104
* 0 <= height[i] <= 3 * 104

解1

``` 
// 暴力破解法【容易超时】
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        for l in 0..<height.count-1 {
            for r in l..<height.count {
                let h = min(height[l], height[r])
                let w = r - l
                res = max(res, h * w)
            }
        }
        return res
    }
}

```

解2
```
// 双指针
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // 面积取决于height短的那根
        var res = 0
        // 双指针
        var l = 0
        var r = height.count - 1
        while l < r {
            res = max(res, min(height[l], height[r]) * (r - l))
//            print("res=\(res),l=\(l),r=\(r),lh=\(height[l]),rh=\(height[r])")
            if height[l] > height[r] {
                r -= 1
            } else {
                l += 1
            }
        }
        return res
    }
}
```
