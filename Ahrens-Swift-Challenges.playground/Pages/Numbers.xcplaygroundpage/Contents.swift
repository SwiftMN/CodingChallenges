//: Playground - noun: a place where people can play

import UIKit
import GameplayKit

// Generate a random number between two numbers (inclusive)
// https://nshipster.com/random/
// modulo bias

func random(min: Int, max: Int) -> Int {
  assert(min > 0 && max > 0, "Ensure positive numbers")
  let upper = max - min + 1
  let rand = arc4random_uniform(UInt32(upper))
  return Int(rand) + min
}

// https://developer.apple.com/documentation/gameplaykit/gkrandomdistribution
func randomAgain(min: Int, max: Int) -> Int {
  let generator = GKRandomDistribution(lowestValue: min, highestValue: max)
  return generator.nextInt()
}

var numbers = [1, 2, 3, 4, 5]
var rand = random(min: 1, max: 5)
assert(numbers.contains(rand), "Should contain the random")

numbers = [8, 9, 10]
rand = random(min: 8, max: 10)
assert(numbers.contains(rand), "Should contain the random")

numbers = [12]
rand = random(min: 12, max: 12)
assert(numbers.contains(rand), "Should contain the random")

numbers = [1, 2, 3, 4, 5]
rand = randomAgain(min: 1, max: 5)
assert(numbers.contains(rand), "Should contain the random")

numbers = [8, 9, 10]
rand = randomAgain(min: 8, max: 10)
assert(numbers.contains(rand), "Should contain the random")

numbers = [12]
rand = randomAgain(min: 12, max: 12)
assert(numbers.contains(rand), "Should contain the random")
