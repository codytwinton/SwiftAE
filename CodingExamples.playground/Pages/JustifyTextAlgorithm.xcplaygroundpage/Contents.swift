//: Playground - noun: a place where people can play

import Foundation

extension Array where Iterator.Element == String {

	public func justify(with maxCount: Int) -> [String] {

		var justified: [String] = []
		var line: [String] = []

		for word in self {
			guard line.joined(separator: " ").count + word.count > maxCount else {
				line.append(word)
				continue
			}

			justified.append(line.justifyLine(with: maxCount))
			line.removeAll()
			line.append(word)
		}

		justified.append(line.justifyLine(with: maxCount))
		return justified
	}

	private func justifyLine(with maxCount: Int) -> String {
		var words = self
		let needed = maxCount - words.joined(separator: " ").count

		for i in 0..<needed {
			let max = words.count - 1

			switch i < max {
			case true:
				words[i] += " "
			case false:
				words[i % max] += " "
			}
		}

		return words.joined(separator: " ")
	}
}


// Tests

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.words.justify(with: input.charCount)

	// Assert
	test.assert(with: actual)
}


