//
//  Number+Extensions.swift
//  Examples
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import Foundation

extension Int {

	// MARK: Factorial

	var factorialIterate: Int {
		guard self > 1 else { return 1 }
		return (1...self).reduce(1, *)
	}

	var factorialRecursive: Int {
		return factorial()
	}

	private func factorial() -> Int {
		guard self > 1 else { return 1 }
		return self * (self - 1).factorial()
	}

	// MARK: Fibonacci

	var fibonacciIterative: [Int] {
		guard self > 0 else { return [] }

		var sequence = [0, 1]
		guard self > 1 else { return sequence }

		for _ in sequence.count...self {
			let first = sequence[sequence.count - 2]
			let second = sequence[sequence.count - 1]
			sequence.append(first + second)
		}

		return sequence
	}

	var fibonacciRecursive: [Int] {
		guard self > 0 else { return [] }
		let sequence = [0, 1]

		guard self > 1 else { return sequence }
		return sequence + Int.fibonacciRecursive(count: self - 1)
	}

	private static func fibonacciRecursive(count: Int, first: Int = 0, second: Int = 1) -> [Int] {
		guard count > 0 else { return [] }
		return [first + second] + fibonacciRecursive(count: count - 1, first: second, second: first + second)
	}

	// MARK: Digits from Number

	var digitsIteritive: [Int] {
		guard self >= 10 else { return [self] }

		var num = self
		var digits: [Int] = []

		while num >= 1 {
			digits.insert(num % 10, at: 0)
			num /= 10
		}

		return digits
	}

	var digitsRecursive: [Int] {
		return digitsRecursive(for: self)
	}

	private func digitsRecursive(for number: Int) -> [Int] {
		guard number >= 10 else { return [number] }
		return [number % 10] + digitsRecursive(for: number / 10)
	}

	// MARK: GCD

	func gcdIterative(for b: Int) -> Int {
		var a = self
		var b = b

		while b > 0 {
			switch a > b {
			case true: a -= b
			case false: b -= a
			}
		}

		return a
	}

	func gcdRecursive(for b: Int) -> Int {
		return gcdRecursive(for: self, and: b)
	}

	private func gcdRecursive(for a: Int, and b: Int) -> Int {
		guard b != 0 else { return a }
		switch a > b {
		case true: return gcdRecursive(for: a - b, and: b)
		case false: return gcdRecursive(for: b, and: b - a)
		}
	}
}

extension Decimal {

	// MARK: Powers

	func powerRecursive(to y: Int) -> Decimal {
		guard y > 0 else { return 1 }
		return self * powerRecursive(to: y - 1)
	}

	func powerIterative(to y: Int) -> Decimal {
		guard y > 0 else { return 1 }
		return Array(repeating: self, count: y).reduce(1.0, *)
	}
}
