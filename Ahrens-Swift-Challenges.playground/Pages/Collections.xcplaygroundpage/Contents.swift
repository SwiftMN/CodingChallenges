//: [Previous](@previous)

import Foundation

// Find smallest N elements in a collection (sorted low to high)

extension Collection where Element: Comparable {
  func smallest(count: Int) -> [Element] {
    let sorted = self.sorted()
    let upper = count > self.count ? self.count : count
    let slice = sorted[..<upper]
    return Array(slice)
  }
}

[1, 2, 3, 4].smallest(count: 3)
["q", "f", "k"].smallest(count: 10)
[256, 16].smallest(count: 3)
[String]().smallest(count: 3)

//: [Next](@next)
