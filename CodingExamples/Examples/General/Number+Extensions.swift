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
		return factorial(for: self)
	}

	private func factorial(for value: Int) -> Int {
		guard value > 1 else { return 1 }
		return value * factorial(for: value - 1)
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
		return digitsRecursive(for: number / 10) + [number % 10]
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
