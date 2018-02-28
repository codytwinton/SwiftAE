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
	let unsolved: [[Int]]
	private(set) var solution: [[Int]]

	init(unsolved: [[Int]]) {
		self.unsolved = unsolved
		self.solution = unsolved
	}

	mutating func solveSudoku() -> Bool {
		var row = 0
		var col = 0

		if !findUnassignedLocation(grid: solution, row: &row, col: &col) {
			return true
		}

		for num in 1...9 {
			guard isSafe(grid: solution, row: row, col: col, num: num) else { continue }
			solution[row][col] = num

			if solveSudoku() {
				return true
			}

			solution[row][col] = 0
		}

		return false
	}

	func findUnassignedLocation(grid: [[Int]], row: inout Int, col: inout Int) -> Bool {

		for i in 0..<9 {
			for j in 0..<9 {
				guard grid[i][j] == 0 else { continue }
				row = i
				col = j
				return true
			}
		}

		row = 8
		col = 8
		return false
	}

	func usedInRow(grid: [[Int]], row: Int, num: Int) -> Bool {
		for col in 0..<9 {
			guard grid[row][col] == num else { continue }
			return true
		}

		return false
	}

	func usedInCol(grid: [[Int]], col: Int, num: Int) -> Bool {
		for row in 0..<9 {
			guard grid[row][col] == num else { continue }
			return true
		}

		return false
	}

	func usedInBox(grid: [[Int]], boxStartRow: Int, boxStartCol: Int, num: Int) -> Bool {
		for row in boxStartRow...(boxStartRow + 2) {
			for col in boxStartCol...(boxStartCol + 2) {
				guard grid[row][col] == num else { continue }
				return true
			}
		}

		return false
	}

	func isSafe(grid: [[Int]], row: Int, col: Int, num: Int) -> Bool {
		return !usedInRow(grid: grid, row: row, num: num) &&
			!usedInCol(grid: grid, col: col, num: num) &&
			!usedInBox(grid: grid, boxStartRow: row - row%3, boxStartCol: col - col%3, num: num)
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

