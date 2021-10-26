import Foundation

// https://leetcode-cn.com/problems/implement-trie-prefix-tree/

class Trie {

    private var isEnd = false
    private var children: [Trie?] = Array.init(repeating: nil, count: 26)
    
    init() {

    }
    
    func insert(_ word: String) {
        var node = self
        for c in word {
            let index = Int(c.asciiValue! - 97)
            if node.children[index] == nil {
                node.children[index] = Trie()
            }
            node = node.children[index]!
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = searchPrefix(prefix: word) else {
            return false
        }
        return node.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = searchPrefix(prefix: prefix) else {
            return false
        }
        return true
    }
    
    private func searchPrefix(prefix: String) -> Trie? {
        var node = self
        for c in prefix {
            let index = Int(c.asciiValue! - 97)
            if node.children[index] == nil {
                return nil
            }
            node = node.children[index]!
        }
        return node
    }
}
