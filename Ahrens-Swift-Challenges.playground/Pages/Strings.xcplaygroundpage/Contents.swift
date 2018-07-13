//: [Previous](@previous)

import Foundation

//
// Determine if a string is a palindrome
//

let first = "rotator"
let second = "Red rum, sir, is murder"
let third = "Top spot"
let fourth = "Was it a cat I saw?"
let fifth = "A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!"

let notPalindrome = "This should fail"

func isPalindrome(_ string: String) -> Bool {
  let range = string.startIndex..<string.endIndex
  let sanitized = string.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: range)
  let lowered = sanitized.lowercased()
  let reversed = lowered.reversed()
  let reversedString = String(reversed)
  return lowered == reversedString
}

func isPalindromeSimple(_ string: String) -> Bool {
  return string.lowercased() == String(string.lowercased().reversed())
}

extension String {
  var isPalindrome: Bool {
    let range = self.startIndex..<self.endIndex
    let sanitized = self.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: range)
    let lowered = sanitized.lowercased()
    let reversed = lowered.reversed()
    let reversedString = String(reversed)
    return lowered == reversedString
  }
}

assert(isPalindromeSimple(first), "\(first) is a palindrome")
assert(isPalindrome(first), "\(first) is a palindrome")
assert(isPalindrome(second), "\(second) is a palindrome")
assert(isPalindrome(third), "\(third) is a palindrome")
assert(isPalindrome(fourth), "\(fourth) is a palindrome")
assert(isPalindrome(fifth), "\(fifth) is a palindrome")
assert(isPalindrome(notPalindrome) == false, "\(notPalindrome) is not a palindrome")
assert(first.isPalindrome, "Using an extension")


//
// Count characters in a String (case sensitive) a differs from A
//

let state = "Mississippi"
let hacking = "Hacking with Swift"
let kangaroo = "This is kangaroo court"

func numberOf(character: Character, in string: String) -> Int {
  var result = 0
  string.forEach { if $0 == character { result += 1 } }
  return result
}

func numberOfPartDeux(character: Character, in string: String) -> Int {
  return string.reduce(0) { total, char in
    if character == char {
      return total + 1
    }

    return total
  }
}

func numberOfPartThree(character: Character, in string: String) -> Int {
  let replaced = string.replacingOccurrences(of: String(character), with: "")
  return string.count - replaced.count
}

assert(numberOf(character: "i", in: state) == 4, "Should have 4 i's")
assert(numberOf(character: "t", in: hacking) == 2, "Should have 2 t's")
assert(numberOf(character: "o", in: kangaroo) == 3, "Should have 3 o's")
assert(numberOf(character: "X", in: hacking) == 0, "No X should be found")

assert(numberOfPartDeux(character: "i", in: state) == 4, "Should have 4 i's")
assert(numberOfPartDeux(character: "t", in: hacking) == 2, "Should have 2 t's")
assert(numberOfPartDeux(character: "o", in: kangaroo) == 3, "Should have 3 o's")
assert(numberOfPartDeux(character: "X", in: hacking) == 0, "No X should be found")

assert(numberOfPartThree(character: "i", in: state) == 4, "Should have 4 i's")
assert(numberOfPartThree(character: "t", in: hacking) == 2, "Should have 2 t's")
assert(numberOfPartThree(character: "o", in: kangaroo) == 3, "Should have 3 o's")
assert(numberOfPartThree(character: "X", in: hacking) == 0, "No X should be found")

//: [Next](@next)
