//
//  InversionOccurrences.swift
//  Examples
//
//  Created by Cody Winton on 2/18/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import Foundation

extension Array where Iterator.Element == Int {

	var inversionCount: Int {
		guard !isEmpty else { return 0 }

		var inversions = 0

		for (i, num) in enumerated() {
			inversions += self[(i + 1)..<count].filter { num > $0 }.count
		}

		return inversions
	}
}
