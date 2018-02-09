/* This problem was asked by Google.

Given an array of strictly the characters "R", "G", and "B", segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array ["G", "B", "R", "R", "B", "R", "G"], it should become ["R", "R", "R", "G", "G", "B", "B"].
*/

import Foundation

// Solution

extension Array where Iterator.Element == String {

	/*
	public func rgbSwap() -> [String] {
		guard !self.isEmpty else { return self }

		var updated = self


		for i in 0..<updated.count {
			guard i < updated.count - 1 else { break }

			let current = updated[i]

			print("\nindex: \(i) current: \(current)")

			for j in (i + 1)..<updated.count {
				let next = updated[j]
				guard current != next else { continue }
				print("current: \(current) next: \(next)")

				switch current {
				case "G" where next == "R", "B" where next == "R":
					updated.swapAt(i, j)
					print("updated \(updated)")
					break
				default:
					continue
				}
			}
		}

		return updated
	}
	*/

	public func rgbSwap() -> [String] {
		guard !self.isEmpty else { return self }

		var updated = self

		var count = (r: 0, g: 0, b: 0)

		for i in 0..<updated.count {
			let current = updated[i]

			let swapIndex: Int

			switch current {
			case "R":
				swapIndex = count.r
				count.r += 1
			case "G":
				swapIndex = count.r + count.g
				count.g += 1
			case "B":
				swapIndex = count.r + count.g + count.b
				count.b += 1
			default:
				continue
			}

			print("\(current).swapAt(\(i), \(swapIndex))")
			updated.swapAt(i, swapIndex)
		}

		return updated
	}
}

// Tests

struct TestValues {
	let input: [String]
	let result: [String]
}

var tests: [TestValues] = [
	TestValues(input: ["G", "B", "R", "R", "B", "R", "G"],  result: ["R", "R", "R", "G", "G", "B", "B"])
]

for (index, test) in tests.enumerated() {
	let result = test.input.rgbSwap()

	switch result == test.result {
	case false:
		print("\n\nFailed test \(index):\n\tinput: \(test.input)\n\texpected: \(test.result)\n\tactual: \(result)")
	case true:
		print("\n\nPassed test \(index). result: \(result)")
	}
}

