//
//  String+Extensions.swift
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
}
