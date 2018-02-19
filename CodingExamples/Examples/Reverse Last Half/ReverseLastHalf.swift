//
//  ReverseLastHalf.swift
//  Examples
//
//  Created by Cody Winton on 2/18/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import Foundation

// MARK: Reverse Last Half of Stack

extension Stack where T == Int {

	mutating func reverseLastHalf() {
		guard count > 2 else { return }

		var queue = Queue<T>()

		for _ in 1..<count {
			queue.enqueue(pop())
		}

		var next = queue.peek() ?? 1

		while !queue.isEmpty {
			guard queue.peek() == next else {
				queue.enqueue(queue.dequeue())
				continue
			}

			let current = peek() ?? 1
			next = current + (next > current ? 1 : -1)
			push(queue.dequeue())
		}
	}
}
