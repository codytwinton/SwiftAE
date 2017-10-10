

//: Playground - noun: a place where people can play

import Foundation

func removNb(_ n: Int) -> [(Int,Int)] {

	let sequence = (1...n)
	let total = sequence.reduce(0, { $0 + $1 })
	let firstSequence = sequence.filter { $0 * n >= total }

	for first in firstSequence {

		let subtractTotal = total - first

		for second in (first...n).reversed() {
			let multiple = first * second
			let smallTotal = subtractTotal - second
			guard multiple >= smallTotal else { break }
			guard multiple == smallTotal else { continue }
			return [(first, second), (second, first)]
		}
	}

	return []
}

for (index, test) in [26, 906, 10].enumerated() {
	print("\n\ntest number: \(test)")
	let result = removNb(test)
	print("result: \(result)")
}
