//
//  Testable.swift
//  Tests
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import Foundation

public protocol Testable {
	associatedtype Input
	associatedtype Expected

	/// The input value to use for testing
	var input: Input { get }

	/// The expected output for testing
	var expected: Expected { get }
}
