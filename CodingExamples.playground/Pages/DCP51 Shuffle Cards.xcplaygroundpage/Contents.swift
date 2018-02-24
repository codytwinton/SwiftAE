/* This problem was asked by Facebook.

Given a function that generates perfectly random numbers between 1 and k (inclusive), where k is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in O(N) time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.
*/

import Foundation

// MARK: Solution

extension CountableClosedRange where Bound == Int {

	func random() -> Int {
		let range = upperBound - lowerBound
		let rand = arc4random_uniform(UInt32(range))
		return Int(rand) + lowerBound
	}

	func random(seed: Int) -> Int {
		guard seed < upperBound else { return random() }

		let seedRange = lowerBound...seed

		let permutations: Int = upperBound / seed + 1
		var randMax: Int = (permutations * 2) * seedRange.random() + seedRange.random() - (permutations * 2)

		guard randMax < upperBound * 2 else { return random(seed: seed) }

		let rand = randMax % upperBound

		guard rand > 0 else { return random(seed: seed) }
		return rand - 1
	}
}

extension Array where Iterator.Element == Int {

	mutating func shuffle(seed: Int) {
		var indexesLeft: Set = Set(enumerated().map { $0.offset })
		let cardRange = 1...52

		while let index = indexesLeft.first {
			let rand = cardRange.random(seed: seed)
			swapAt(index, rand)
			indexesLeft.remove(index)
		}
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

// Arrange
let input = Array(1...52)

// Act
var actual = input
actual.shuffle(seed: 5)

for (index, item) in input.enumerated() {

	if item == actual[index] {
		print("\(item) was not shuffled and is: \(actual[index])")
	}
}

// Assert
print("""

\(input != actual ? "✅ Passed" : "🛑 Failed") Test:
	input:		\(input)
	actual:		\(actual)

""")

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

