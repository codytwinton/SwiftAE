//
//  String+PowerSet.swift
//  CodingExamples
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import Foundation

extension String {

	var powerSet: Set<String> {
		var set: Set<String> = [""]

		for char in self {
			let next = String(char)
			set.formUnion(Set(set.map { $0 + next }))
		}

		return set
	}

	var powerSetRecursion: Set<String> {
		return powerSetRecursion(for: self)
	}

	private func powerSetRecursion(for str: String) -> Set<String> {
		var set: Set<String> = ["", str]
		guard str.count > 1 else { return set }

		for i in 0..<str.count {
			let first = str.index(str.startIndex, offsetBy: i)
			let second = str.index(first, offsetBy: 1)
			let sub: String = String(str[str.startIndex..<first] + str[second..<str.endIndex])
			set.formUnion(powerSetRecursion(for: sub))
		}

		return set;
	}
}
