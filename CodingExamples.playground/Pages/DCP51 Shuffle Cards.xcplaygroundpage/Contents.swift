/* This problem was asked by Facebook.

Given a function that generates perfectly random numbers between 1 and k (inclusive), where k is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in O(N) time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	mutating func shuffle(seed: Int) {
		var indexesLeft: Set = Set(enumerated().map { $0.offset })

		while let index = indexesLeft.first {
			let rand: Int = Int(arc4random_uniform(UInt32(seed)))
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
actual.shuffle(seed: 51)

// Assert
print("""

\(input != actual ? "✅ Passed" : "🛑 Failed") Test:
	input:		\(input)
	actual:		\(actual)

""")

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

