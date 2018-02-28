import Foundation

/* This problem was asked by Dropbox.

Sudoku is a puzzle where you're given a partially-filled 9 by 9 grid with digits. The objective is to fill the grid with the constraint that every row, column, and box (3 by 3 subgrid) must contain all of the digits from 1 to 9.

Implement an efficient sudoku solver.

var input = [
	[3, 0, 6, 5, 0, 8, 4, 0, 0],
	[5, 2, 0, 0, 0, 0, 0, 0, 0],
	[0, 8, 7, 0, 0, 0, 0, 3, 1],
	[0, 0, 3, 0, 1, 0, 0, 8, 0],
	[9, 0, 0, 8, 6, 3, 0, 0, 5],
	[0, 5, 0, 0, 9, 0, 6, 0, 0],
	[1, 3, 0, 0, 0, 0, 2, 5, 0],
	[0, 0, 0, 0, 0, 0, 0, 7, 4],
	[0, 0, 5, 2, 0, 6, 3, 0, 0]
],

var expected = [
	[3, 1, 6, 5, 7, 8, 4, 9, 2],
	[5, 2, 9, 1, 3, 4, 7, 6, 8],
	[4, 8, 7, 6, 2, 9, 5, 3, 1],
	[2, 6, 3, 4, 1, 5, 9, 8, 7],
	[9, 7, 4, 8, 6, 3, 1, 2, 5],
	[8, 5, 1, 7, 9, 2, 6, 4, 3],
	[1, 3, 8, 9, 4, 7, 2, 5, 6],
	[6, 9, 2, 3, 5, 1, 8, 7, 4],
	[7, 4, 5, 2, 8, 6, 3, 1, 9]
]

Solution: https://www.geeksforgeeks.org/backtracking-set-7-suduku/
*/

struct Sudoku {
	let gridSize: Int
	let unsolved: [[Int]]
	private(set) var solution: [[Int]]

	init(unsolved: [[Int]]) {
		self.gridSize = unsolved.count
		self.unsolved = unsolved
		self.solution = unsolved
	}

	mutating func solveSudoku() -> Bool {
		var row = 0
		var col = 0

		guard findUnassignedLocation(row: &row, col: &col) else { return true }

		for num in 1...gridSize {
			guard isSafe(num, row: row, col: col) else { continue }
			solution[row][col] = num

			if solveSudoku() { return true }
			solution[row][col] = 0
		}

		return false
	}

	func findUnassignedLocation(row: inout Int, col: inout Int) -> Bool {
		for i in 0..<gridSize {
			for j in 0..<gridSize {
				guard solution[i][j] == 0 else { continue }
				(row, col) = (i, j)
				return true
			}
		}

		(row, col) = (8, 8)
		return false
	}

	func isSafe(_ num: Int, row: Int, col: Int) -> Bool {
		return !isUsed(num, inRow: row)
			&& !isUsed(num, inCol: col)
			&& !isUsed(num, inRowBox: row - row % 3, colBox: col - col % 3)
	}

	func isUsed(_ num: Int, inRow row: Int) -> Bool {
		for col in 0..<gridSize {
			guard solution[row][col] == num else { continue }
			return true
		}

		return false
	}

	func isUsed(_ num: Int, inCol col: Int) -> Bool {
		for row in 0..<gridSize {
			guard solution[row][col] == num else { continue }
			return true
		}

		return false
	}

	func isUsed(_ num: Int, inRowBox rowBox: Int, colBox: Int) -> Bool {
		for row in rowBox...(rowBox + 2) {
			for col in colBox...(colBox + 2) {
				guard solution[row][col] == num else { continue }
				return true
			}
		}

		return false
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input
	var sudoku = Sudoku(unsolved: input)

	// Act
	sudoku.solveSudoku()
	let actual = sudoku.solution

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

